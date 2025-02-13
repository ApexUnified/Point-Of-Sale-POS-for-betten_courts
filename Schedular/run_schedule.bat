

@echo off

start "" "D:\ABDULLAH WORK\ABDULLAH ( ME)\All Projects And Portfolio\Laravel Portfolio Projects\POS\POS\artisan" serve


:loop
php "D:\ABDULLAH WORK\ABDULLAH ( ME)\All Projects And Portfolio\Laravel Portfolio Projects\POS\POS\artisan" schedule:run
timeout /t 60
goto loop