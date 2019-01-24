# PHP Sudoku Game

## Game description

Sudoku (Suzuku) is one of the pencil puzzles that puts numbers from 1 to 9 in a 9 × 9 square frame separated into 3 × 3 blocks. It is also called "numberplace (Nampure)".

## How to play

 1. Put any one of 1 to 9 in the empty square.
 2. Do not enter the same number in the vertical and horizontal columns and the 3 × 3 block surrounded by bold lines.

## Answering algorithm

The strategy to answer starts with an arbitrary frame, fills in arbitrary numbers, and if not breaking the rule, goes to the next frame. If you can not fill numbers in the frame, go back to the previous frame and fill in other commons. When filling the whole frame, finishing answering is over. The algorithm flow is described below.

## Initial placement algorithm

Set up a blank frame in all, choose random numbers, fill in the appropriate boxes and make an answer. From the last answer, we withdraw the figure of answer to the number according to difficulty and make a frame. In order to keep the only answer, if you put all the frames in 1st to 3rd row, 4th to 6th row and 7th to 9th column in a frame, make a flow by making a reform.

![Algorithm](https://raw.githubusercontent.com/meyya22/Sudoku_master/algorithm.jpg)

## Technical Details

Project Details : Sudoku online game

Name Provided: meyya_sudoku
Instance Id: i-00fa438f1e11e4e36
Ip: 52.15.114.52

Access Url: http://52.15.114.52/play

apache2 -v
Server version: Apache/2.4.29 (Ubuntu)
Server built:   2018-10-10T18:59:25

MySQL --version
MySQL  Ver 14.14 Distrib 5.7.24, for Linux (x86_64) using  EditLine wrapper

php -v
PHP 7.2.10-0ubuntu0.18.04.1 (cli) (built: Sep 13 2018 13:45:02) ( NTS )

### API Resources

- [POST /ajax/validate](#post-ajaxvalidate)
- [POST /ajax/solution](#post-ajaxsolution)
- [POST /ajax/feasible](#post-ajaxfeasible)
- [POST /ajax/save-grid](#post-ajaxsave-grid)



#### POST /ajax/validate

Validate user response for a puzzle

Example: http://example.com/ajax/validate

<details>
<summary>Request body:</summary>

```
_token: zUhCuZgL5dukMXguEcZi6iALgD45twahMT7P7Dz3
puzzle: 3
block[0]:
block[1]:
block[2]:
block[3]:
block[4]:
block[5]:
block[6]:
block[7]:
block[8]: 5
block[9]:
block[10]:
block[11]:
block[12]: 8
block[13]:
block[14]:
block[15]:
block[16]: 7
block[17]: 1
block[18]:
block[19]: 3
block[20]: 1
block[21]:
block[22]: 4
block[23]:
block[24]:
block[25]:
block[26]:
block[27]: 1
block[28]: 9
block[29]:
block[30]: 7
block[31]:
block[32]:
block[33]:
block[34]:
block[35]:
block[36]:
block[37]:
block[38]: 8
block[39]: 1
block[40]:
block[41]: 3
block[42]:
block[43]: 2
block[44]:
block[45]:
block[46]:
block[47]:
block[48]: 2
block[49]:
block[50]: 9
block[51]:
block[52]: 8
block[53]: 7
block[54]:
block[55]: 8
block[56]:
block[57]:
block[58]: 9
block[59]:
block[60]:
block[61]:
block[62]:
block[63]: 6
block[64]:
block[65]: 7
block[66]: 3
block[67]:
block[68]:
block[69]: 9
block[70]:
block[71]:
block[72]: 3
block[73]:
block[74]: 9
block[75]:
block[76]: 2
block[77]: 7
block[78]:
block[79]:
block[80]:
```
</details>

<details>
<summary>Response body:</summary>

```
{
  "status": 1,
  "success": false
}
```
</details>


#### POST /ajax/solution

Get solution for a puzzle

Example: http://example.com/ajax/solution

<details>
<summary>Request body:</summary>

```
_token: zUhCuZgL5dukMXguEcZi6iALgD45twahMT7P7Dz3
puzzle: 3
```
</details>

<details>
<summary>Response body:</summary>

```
{
  "status": 1,
  "success": true,
  "data": {
    "solution": [
      "8",
      "2",
      "6",
      "9",
      "7",
      "1",
      "3",
      "4",
      "5",
      "9",
      "5",
      "4",
      "8",
      "3",
      "2",
      "6",
      "7",
      "1",
      "7",
      "3",
      "1",
      "6",
      "4",
      "5",
      "2",
      "9",
      "8",
      "1",
      "9",
      "2",
      "7",
      "8",
      "4",
      "5",
      "3",
      "6",
      "5",
      "7",
      "8",
      "1",
      "6",
      "3",
      "4",
      "2",
      "9",
      "4",
      "6",
      "3",
      "2",
      "5",
      "9",
      "1",
      "8",
      "7",
      "2",
      "8",
      "5",
      "4",
      "9",
      "6",
      "7",
      "1",
      "3",
      "6",
      "4",
      "7",
      "3",
      "1",
      "8",
      "9",
      "5",
      "2",
      "3",
      "1",
      "9",
      "5",
      "2",
      "7",
      "8",
      "6",
      "4"
    ]
  }
}
```
</details>

#### POST /ajax/feasible

Check user generated puzzle for all possible rules

Example: http://example.com/ajax/feasible

<details>
<summary>Request body:</summary>

```
_token: zUhCuZgL5dukMXguEcZi6iALgD45twahMT7P7Dz3
block[0][0]: 1
block[0][1]:
block[0][2]:
block[0][3]:
block[0][4]:
block[0][5]:
block[0][6]:
block[0][7]:
block[0][8]:
block[1][0]:
block[1][1]: 5
block[1][2]:
block[1][3]:
block[1][4]:
block[1][5]:
block[1][6]:
block[1][7]:
block[1][8]:
block[2][0]:
block[2][1]:
block[2][2]: 3
block[2][3]:
block[2][4]:
block[2][5]:
block[2][6]:
block[2][7]:
block[2][8]:
block[3][0]:
block[3][1]:
block[3][2]:
block[3][3]:
block[3][4]:
block[3][5]:
block[3][6]:
block[3][7]:
block[3][8]:
block[4][0]:
block[4][1]:
block[4][2]:
block[4][3]:
block[4][4]:
block[4][5]:
block[4][6]:
block[4][7]:
block[4][8]:
block[5][0]:
block[5][1]:
block[5][2]:
block[5][3]:
block[5][4]:
block[5][5]:
block[5][6]:
block[5][7]:
block[5][8]:
block[6][0]:
block[6][1]:
block[6][2]:
block[6][3]:
block[6][4]:
block[6][5]:
block[6][6]:
block[6][7]:
block[6][8]:
block[7][0]:
block[7][1]:
block[7][2]:
block[7][3]:
block[7][4]:
block[7][5]:
block[7][6]:
block[7][7]:
block[7][8]:
block[8][0]:
block[8][1]:
block[8][2]:
block[8][3]:
block[8][4]:
block[8][5]:
block[8][6]:
block[8][7]:
block[8][8]:
```
</details>

<details>
<summary>Response body:</summary>

```
{
  "status": 1,
  "success": true
}
```
</details>

#### POST /ajax/save-grid

Save user generated puzzle in database and provide solution for that puzzle

Example: http://example.com/ajax/save-grid

<details>
<summary>Request body:</summary>

```
_token: zUhCuZgL5dukMXguEcZi6iALgD45twahMT7P7Dz3
block[0][0]: 1
block[0][1]:
block[0][2]:
block[0][3]:
block[0][4]:
block[0][5]:
block[0][6]:
block[0][7]:
block[0][8]:
block[1][0]:
block[1][1]: 5
block[1][2]:
block[1][3]:
block[1][4]:
block[1][5]:
block[1][6]:
block[1][7]:
block[1][8]:
block[2][0]:
block[2][1]:
block[2][2]: 3
block[2][3]:
block[2][4]:
block[2][5]:
block[2][6]:
block[2][7]:
block[2][8]:
block[3][0]:
block[3][1]:
block[3][2]:
block[3][3]:
block[3][4]:
block[3][5]:
block[3][6]:
block[3][7]:
block[3][8]:
block[4][0]:
block[4][1]:
block[4][2]:
block[4][3]:
block[4][4]:
block[4][5]:
block[4][6]:
block[4][7]:
block[4][8]:
block[5][0]:
block[5][1]:
block[5][2]:
block[5][3]:
block[5][4]:
block[5][5]:
block[5][6]:
block[5][7]:
block[5][8]:
block[6][0]:
block[6][1]:
block[6][2]:
block[6][3]:
block[6][4]:
block[6][5]:
block[6][6]:
block[6][7]:
block[6][8]:
block[7][0]:
block[7][1]:
block[7][2]:
block[7][3]:
block[7][4]:
block[7][5]:
block[7][6]:
block[7][7]:
block[7][8]:
block[8][0]:
block[8][1]:
block[8][2]:
block[8][3]:
block[8][4]:
block[8][5]:
block[8][6]:
block[8][7]:
block[8][8]:
```
</details>

<details>
<summary>Response body:</summary>

```
{
  "status": 1,
  "success": true,
  "data": {
    "solution": [
      1,
      6,
      8,
      7,
      3,
      9,
      2,
      4,
      5,
      9,
      5,
      7,
      4,
      6,
      2,
      1,
      8,
      3,
      4,
      2,
      3,
      5,
      1,
      8,
      7,
      9,
      6,
      8,
      4,
      9,
      1,
      5,
      7,
      3,
      6,
      2,
      6,
      1,
      5,
      3,
      2,
      4,
      8,
      7,
      9,
      7,
      3,
      2,
      9,
      8,
      6,
      5,
      1,
      4,
      5,
      9,
      4,
      2,
      7,
      1,
      6,
      3,
      8,
      3,
      7,
      6,
      8,
      4,
      5,
      9,
      2,
      1,
      2,
      8,
      1,
      6,
      9,
      3,
      4,
      5,
      7
    ]
  }
}
```
</details>

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
