<?php

Route::get('/', 'Front\Main@index');

Route::get('/play', 'Front\Main@play');
Route::post('/ajax/validate', 'Front\Main@checkResult');
Route::post('/ajax/solution', 'Front\Main@checkSolution');

Route::get('/generate', 'Front\Main@generate');
Route::post('/ajax/feasible', 'Front\Main@checkFeasible');
Route::post('/ajax/save-grid', 'Front\Main@savePattern');