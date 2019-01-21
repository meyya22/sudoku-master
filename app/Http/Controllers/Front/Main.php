<?php

namespace App\Http\Controllers\Front;

use App\Helpers\SudokuSolve as SudokuSolveHelper;
use App\Http\Controllers\Controller;
use App\Models\Puzzle as PuzzleModel;
use GeneralHelper;
use Request;

class Main extends Controller
{
    public function index()
    {
        return redirect('/play');
    }

    public function play()
    {

        $puzzle = PuzzleModel::query();
        $puzzle = $puzzle->where('i_status', '0');
        $puzzle = $puzzle->inRandomOrder();
        $puzzle = $puzzle->first(['id', 'l_display']);

        return view('front/play', compact('puzzle'));
    }

    public function checkResult()
    {
        $data = Request::all();

        $successFlag = false;

        if (isset($data['puzzle']) && $data['puzzle'] && isset($data['block']) && count($data['block'])) {

            $puzzle = PuzzleModel::find($data['puzzle']);

            if (isset($puzzle) && $puzzle->count()) {

                if ($puzzle['l_solution'] == json_encode($data['block'])) {

                    $successFlag = true;
                }
            }
        }

        $response = [
            'status'  => 1,
            'success' => $successFlag,
        ];

        return $response;
    }

    public function checkSolution()
    {
        $data = Request::all();

        $successFlag = false;

        if (isset($data['puzzle']) && $data['puzzle']) {

            $puzzle = PuzzleModel::find($data['puzzle']);

            if (isset($puzzle) && $puzzle->count()) {

                $successFlag = true;
            }
        }

        $response = [
            'status'  => 1,
            'success' => $successFlag,
        ];

        if ($successFlag) {

            $response['data'] = [
                // 'puzzle' => $puzzle,
                'solution' => json_decode($puzzle['l_solution'], 1),
            ];
        }

        return $response;
    }

    public function generate()
    {

        return view('front/generate', compact('puzzle'));
    }

    public function checkFeasible()
    {

        $data = Request::all();

        $successFlag = false;

        $checkData = [];

        if (isset($data['block']) && count($data['block'])) {

            for ($i = 0; $i < 9; $i++) {

                for ($j = 0; $j < 9; $j++) {
                    $checkData[$i][$j] = isset($data['block'][$i][$j]) && $data['block'][$i][$j] && intval($data['block'][$i][$j])
                    ? intval($data['block'][$i][$j]) : 0;
                }
            }
        }

        $successFlag = GeneralHelper::validateSudoku($checkData);

        $response = [
            'status'  => 1,
            'success' => $successFlag,
        ];

        return $response;
    }

    public function savePattern()
    {

        $data = Request::all();

        $successFlag     = false;
        $createdPuzzleId = 0;

        $checkData           = $solveData           = [];
        $isAlreadySolvedFlag = true;

        if (isset($data['block']) && count($data['block'])) {

            for ($i = 0; $i < 9; $i++) {

                for ($j = 0; $j < 9; $j++) {

                    $element           = isset($data['block'][$i][$j]) && $data['block'][$i][$j] && intval($data['block'][$i][$j]) ? intval($data['block'][$i][$j]) : 0;
                    $checkData[$i][$j] = $element;
                    $solveData[]       = $element;

                    if ($isAlreadySolvedFlag && $element === 0) {
                        $isAlreadySolvedFlag = false;
                    }

                }
            }
        }

        if ($isAlreadySolvedFlag === false) {

            $canBeSolved = GeneralHelper::validateSudoku($checkData);

            if ($canBeSolved) {

                $solvedGrid = SudokuSolveHelper::actionSolve($solveData);

                if (isset($solvedGrid) && count($solvedGrid) === 81) {
                    $successFlag = true;
                }
            }

            if ($successFlag) {

                $isInDatabase = false;

                $checkDatabaseData = [];

                foreach ($solveData as $value) {
                    $checkDatabaseData[] = $value && intval($value) > 0 ? (string) $value : ' ';
                }

                $checkDatabaseData = json_encode($checkDatabaseData);

                $dataInDatabase = PuzzleModel::where('l_display', $checkDatabaseData)->get();

                if ($dataInDatabase->count() === 0) {

                    $solutionData = [];

                    foreach ($solvedGrid as $value) {
                        $solutionData[] = $value && intval($value) > 0 ? (string) $value : ' ';
                    }

                    $create = [
                        'l_display'  => $checkDatabaseData,
                        'l_solution' => json_encode($solutionData),
                        'i_status'   => 0,
                    ];

                    $createdPuzzleId = PuzzleModel::create($create)->id;
                }
            }
        }

        $response = [
            'status'  => 1,
            'success' => $successFlag && $createdPuzzleId > 0 ? true : false,
        ];

        if ($successFlag && $createdPuzzleId > 0) {
            $response['data']['solution'] = $solvedGrid;
        }

        return $response;
    }
}
