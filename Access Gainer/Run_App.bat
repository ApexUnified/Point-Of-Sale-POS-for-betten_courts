@echo off

start "" php "E:\ABDULLAH WORK\Laravel Portfolio Projects\POS\POS\artisan" serve

:loop
php "E:\ABDULLAH WORK\Laravel Portfolio Projects\POS\POS\artisan" schedule:run
timeout /t 60
goto loop