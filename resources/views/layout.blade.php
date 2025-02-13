<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="{{ asset("css/bootstrap.css") }}">

    <!-- Dripicons icon font-->
    <link rel='stylesheet' href="{{ asset('css/dripicons/webfont.css') }}">


    @stack('css')


    <title>@yield('title')</title>
  </head>
  <body class="container mt-2">

    @yield('content')

    <script src="{{ asset("js/jquery.js") }}"></script>
    <script src="{{ asset("js/popper.js") }}"></script>
    <script src="{{ asset("js/bootstrap.js") }}"></script>

    @stack('scripts')

</body>
</html>
