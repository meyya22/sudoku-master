# PHP Sudoku Game

Solve Sudoku puzzles or make your own puzzles. Your puzzles will be saved into database.

## What is Sudoku

Sudoku is a logic-based, combinatorial number-placement puzzle. The objective is to fill a 9×9 grid with digits so that each column, each row, and each of the nine 3×3 subgrids that compose the grid (also called "boxes", "blocks", or "regions") contains all of the digits from 1 to 9. The puzzle setter provides a partially completed grid, which for a well-posed puzzle has a single solution.

Read More on [Wikipedia](https://en.wikipedia.org/wiki/Sudoku)

## Sections

1. **Play**
- Let's you to play puzzles stored in database
- Check if your answers are valid or not
- If you are not able to solve puzzle, then you can give up. You will be shown the result of that puzzle.

2. **Generate**
- Create your own puzzle from 9x9 grid.
- Check if your puzzle if valid or not.
- You can save your puzzle if it is valid.

## Installation

After clone run below commands from project folder

```
composer install
```

Copy .env.example to .env

```
php artisan key:generate
```

Import *sudoku.sql* in your database and update your database details in *.env* file.
```
DB_DATABASE="{YOUR_DB_NAME_GOES_HERE}"
DB_USERNAME="{YOUR_DB_USERNAME_GOES_HERE}"
DB_PASSWORD="{YOUR_DB_PASSWORD_GOES_HERE}"
```

## Technical stacks

- Laravel (PHP Framework)
- MySQL
- HTML + CSS + JavaScript + jQuery