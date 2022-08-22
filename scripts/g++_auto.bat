@echo off

echo automatic G + + compilation script
echo.
echo this script can only compile a single source file as an executable file!
echo.

set /p name=please enter the source file name (excluding the extension):

md build
cd build

g++ -E ..\%name%.cpp -o %name%.i -static -g3

if %errorlevel% == 1 (
	goto fail
)

g++ -S %name%.i -o %name%.s -static -g3

if %errorlevel% == 1 (
	goto fail
)

g++ -c %name%.s -o %name%.o

if %errorlevel% == 1 (
	goto fail
)

md x86
cd x86

g++ ..\%name%.o -o %name%

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