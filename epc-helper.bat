@ECHO OFF
:: ***************************************
:: ***************************************
:: **                                   **
:: **         Name:  ePubCheck Helper   **
:: **     Filename:  epc-helper.bat     **
:: **      Version:  0.1.0-a            **
:: **       Author:  Steve Myles        **
:: **  Description:  See readme.txt     **
:: **      License:  See license.txt    **
:: **    Changelog:  See changelog.txt  **
:: **                                   **
:: ***************************************
:: ***************************************

SETLOCAL ENABLEDELAYEDEXPANSION
:: ***** declare variables *****
:: Set the version of epubcheck.  Go to NOEPUBCHECK if ePubCheck does not 
:: exist in this folder.
IF EXIST "epubcheck-*.jar" (
for %%A in ("epubcheck*.jar") do (
    set "epubcheckfilename=%%~nA"
	set "epubcheckver=!epubcheckfilename:*epubcheck-=!"
)
) ELSE ( 
GOTO NOEPUBCHECK
)
:: Get the current time
SET currtime=%Time:~0,2%_%Time:~3,2%_%Time:~6,2%

:: Date parsing is taken from Rob van der Woude
:: http://www.robvanderwoude.com/datetimentparse.php
:: This will work for US dates
SET Today=%Date: =0%
SET Year=%Today:~-4%
:: Include 1 extra character, which will be either a leading zero or a 
:: trailing separator
SET Month=%Today:~-10,3%
:: Remove separator
SET Month=%Month:-=%
SET Month=%Month:/=%
:: Clear leading zeroes
SET /A Month = 100%Month% %% 100
:: And add one again, if necessary
SET /A Month = 100 + %Month%
SET Month=%Month:~-2%
SET Day=%Today:~-7,2%

:: Logfile created will be <filename>-YYYYMMDD-hh_mm_ss.log (using 24-hour
:: clock) in order to ensure proper sorting of log files.
SET logtimestamp=%Year%%Month%%Day%-%currtime%

:: Get the name, folder, and extension of the passed file and define the 
:: logfile's name.
SET file=%1
FOR /F %%i IN ("%file%") DO (
SET filename=%%~ni
SET folder=%%~dpi
SET extension=%%~xi
SET logfile=%%~ni-%logtimestamp%.log
)
:: ***** End of variables *****

:: ***** If extension is not .zip or .epub then goto NOTEPUB. *****
IF NOT %extension%==.zip (
	IF NOT %extension%==.epub GOTO NOTEPUB
	)

:: ***** if extension is .zip, copy to a new .epub with the same name *****
IF %extension%==.zip (
	IF NOT EXIST %folder%%filename%.epub COPY %folder%%filename%%extension% %folder%%filename%.epub 
	)

:: ***** run ePubCheck on the epub and output to the logfile *****	
java -jar epubcheck-%epubcheckver%.jar %folder%%filename%.epub > %folder%%logfile% 2>&1

:: ***** popup window when complete *****
ECHO msgbox "Finished checking %filename%.  Please check %logfile% for any errors/warnings.", , "ePubCheck Complete" > "%temp%\popup.vbs"
GOTO POPUP

:: ***** ask user to try again with a .zip or .epub file *****
:NOTEPUB
	ECHO msgbox "Please try again with a .zip or .epub file.", , "File extension error" > "%temp%\popup.vbs"
	GOTO POPUP

:: ***** tell user to put batch file in the directory with ePubCheck *****
:NOEPUBCHECK
	ECHO msgbox "Please ensure that epc-helper.bat is in the folder where you have installed ePubCheck.", , "ePubCheck Not Found" > "%temp%\popup.vbs"
	GOTO POPUP	

:: ***** Popup window that tells user why the script is terminated *****
:POPUP
	wscript.exe "%temp%\popup.vbs"
	DEL %temp%\popup.vbs
	GOTO:EOF