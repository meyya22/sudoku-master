<?php

namespace App\Helpers;

class SudokuSolve
{

    public static $defaultArray = [1, 2, 3, 4, 5, 6, 7, 8, 9];

    public static function getRow($cell)
    {
        return floor($cell / 9);
    }

    public static function getColumn($cell)
    {
        return $cell % 9;
    }

    public static function getGrid($cell)
    {
        return floor(self::getRow($cell) / 3) * 3 + floor(self::getColumn($cell) / 3);
    }

    public static function isRowPossible($number, $row, $sudoku)
    {
        $possible = true;
        for ($i = 0; $i <= 8; $i++) {
            if ($sudoku[$row * 9 + $i] == $number) {
                $possible = false;
            }
        }
        return $possible;
    }

    public static function isColumnPossible($number, $col, $sudoku)
    {
        $possible = true;
        for ($i = 0; $i <= 8; $i++) {
            if ($sudoku[$col + 9 * $i] == $number) {
                $possible = false;
            }
        }
        return $possible;
    }

    public static function isBlockPossible($number, $block, $sudoku)
    {
        $possible = true;
        for ($i = 0; $i <= 8; $i++) {
            if ($sudoku[floor($block / 3) * 27 + $i % 3 + 9 * floor($i / 3) + 3 * ($block % 3)] == $number) {
                $possible = false;
            }
        }
        return $possible;
    }

    public static function isNumberPossible($cell, $number, $sudoku)
    {
        $row   = self::getRow($cell);
        $col   = self::getColumn($cell);
        $block = self::getGrid($cell);
        return self::isRowPossible($number, $row, $sudoku) && self::isColumnPossible($number, $col, $sudoku) && self::isBlockPossible($number, $block, $sudoku);
    }

    public static function isRowCorrect($row, $sudoku)
    {
        for ($i = 0; $i <= 8; $i++) {
            $tempRow[$i] = $sudoku[$row * 9 + $i];
        }
        return count(array_diff(self::$defaultArray, $tempRow)) == 0;
    }

    public static function isColumnCorrect($col, $sudoku)
    {
        for ($i = 0; $i <= 8; $i++) {
            $tempColumn[$i] = $sudoku[$col + $i * 9];
        }
        return count(array_diff(self::$defaultArray, $tempColumn)) == 0;
    }

    public static function isBlockCorrect($block, $sudoku)
    {
        for ($i = 0; $i <= 8; $i++) {
            $tempBlock[$i] = $sudoku[floor($block / 3) * 27 + $i % 3 + 9 * floor($i / 3) + 3 * ($block % 3)];
        }
        return count(array_diff(self::$defaultArray, $tempBlock)) == 0;
    }

    public static function isSolved($sudoku)
    {
        for ($i = 0; $i <= 8; $i++) {
            if (!self::isBlockCorrect($i, $sudoku) or !self::isRowCorrect($i, $sudoku) or !self::isColumnCorrect($i, $sudoku)) {
                return false;
                break;
            }
        }
        return true;
    }

    public static function getPossibleValues($cell, $sudoku)
    {
        $possible = [];
        for ($i = 1; $i <= 9; $i++) {
            if (self::isNumberPossible($cell, $i, $sudoku)) {
                array_unshift($possible, $i);
            }
        }
        return $possible;
    }

    public static function getRandomPossibleValues($possible, $cell)
    {
        return $possible[$cell][rand(0, count($possible[$cell]) - 1)];
    }

    public static function checkUniqueValue($sudoku)
    {
        for ($i = 0; $i <= 80; $i++) {
            if ($sudoku[$i] == 0) {
                $possible[$i] = self::getPossibleValues($i, $sudoku);
                if (count($possible[$i]) == 0) {
                    return (false);
                    break;
                }
            }
        }
        return ($possible);
    }

    public static function discardAttempt($attemptArray, $number)
    {
        $new_array = [];
        for ($i = 0; $i < count($attemptArray); $i++) {
            if ($attemptArray[$i] != $number) {
                array_unshift($new_array, $attemptArray[$i]);
            }
        }
        return $new_array;
    }

    public static function getNextRandom($possible)
    {
        $max = 9;
        for ($i = 0; $i <= 80; $i++) {
            if (isset($possible[$i]) && (count($possible[$i]) <= $max) && (count($possible[$i]) > 0)) {
                $max       = count($possible[$i]);
                $choiceMin = $i;
            }
        }
        return $choiceMin;
    }

    public static function actionSolve($sudoku)
    {
        $saved       = [];
        $sudokuSaved = [];
        $i           = 0;
        while (!self::isSolved($sudoku)) {
            $i += 1;
            $moveNext = self::checkUniqueValue($sudoku);
            if ($moveNext == false) {
                $moveNext = array_pop($saved);
                $sudoku   = array_pop($sudokuSaved);
            }
            $tryNextValue = self::getNextRandom($moveNext);
            $attempt      = self::getRandomPossibleValues($moveNext, $tryNextValue);
            if (count($moveNext[$tryNextValue]) > 1) {
                $moveNext[$tryNextValue] = self::discardAttempt($moveNext[$tryNextValue], $attempt);
                array_push($saved, $moveNext);
                array_push($sudokuSaved, $sudoku);
            }
            $sudoku[$tryNextValue] = $attempt;
        }
        return $sudoku;
    }
}
