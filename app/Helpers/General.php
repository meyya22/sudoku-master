<?php

namespace App\Helpers;

class General
{

    public static function validateSudoku($input)
    {
        $matrix;

        for ($row = 0; $row < 9; $row++) {
            $matrix = 0;
            for ($column = 0; $column < 9; $column++) {
                if ('0' != $input[$row][$column]) {

                    $mask = pow(2, $input[$row][$column]);

                    if (($matrix & $mask) == 0) {
                        $matrix = $matrix | $mask;
                    } else {
                        return false;
                    }
                }
            }
        }

        for ($column = 0; $column < 9; $column++) {
            $matrix = 0;
            for ($row = 0; $row < 9; $row++) {
                if ('0' != $input[$row][$column]) {

                    $mask = pow(2, $input[$row][$column]);

                    if (($matrix & $mask) == 0) {
                        $matrix = $matrix | $mask;
                    } else {
                        return false;
                    }

                }
            }
        }

        $iStart = 0;
        $jStart = 0;
        for ($b = 0; $b < 9; $b++) {

            $iStart = floor($b / 3) * 3;
            $jStart = ($b % 3) * 3;
            $matrix = 0;

            for ($i = $iStart; $i < $iStart + 3; $i++) {
                for ($j = $jStart; $j < $jStart + 3; $j++) {

                    if ('0' != $input[$i][$j]) {
                        $mask = pow(2, $input[$i][$j]);

                        if (($matrix & $mask) == 0) {
                            $matrix = $matrix | $mask;
                        } else {
                            return false;
                        }

                    }
                }
            }
        }

        return true;
    }
}
