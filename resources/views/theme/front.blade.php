<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Sudoku</title>

  @include('theme.front-inc.style')

  @yield('style')
</head>

<body>

  @include('theme.front-inc.header')

  @yield('content')

  @include('theme.front-inc.footer')

  @include('theme.front-inc.script')

  @yield('script')

</body>

</html>