@echo off

echo automatic GCC compilation script
echo.
echo this script can only compile a single source file as an executable file!
echo.

set /p name=please enter the source file name (excluding the extension):

if exist .\build\ (
    rename build build_early
)

md build
cd build

gcc -E ..\%name%.c -o %name%.i -static -g3

if %errorlevel% == 1 (
	goto fail
)

gcc -S %name%.i -o %name%.s -static -g3

if %errorlevel% == 1 (
	goto fail
)

gcc -c %name%.s -o %name%.o

if %errorlevel% == 1 (
	goto fail
)

md x86
cd x86

gcc ..\%name%.o -o %name%

if %errorlevel% == 1 (
	goto fail
)


echo.
Echo generation succeeded!
echo.

goto end


:fail

echo.

Echo generation failed!

echo.

goto end

:end

cd ..\..\
pause