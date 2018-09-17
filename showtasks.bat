call runcrud
if "%ERRORLEVEL%" == "0" goto gettasks
echo.
echo RUNCRUD has errors - breaking work
goto fail

:gettasks
start chrome http://localhost:8090/crud/v1/task/getTasks
goto stoptomcat

:stoptomcat
call %CATALINA_HOME%\bin\shutdown.bat
goto end

:fail
echo.
echo There were errors

:end
echo.
echo URL opened.