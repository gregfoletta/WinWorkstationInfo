@echo off

set O_DST=%USERPROFILE%\Desktop

set O_PREFIX=%COMPUTERNAME%

set O_DIR=%O_DST%\TS_Capure

set OUTPUT_FILE=%O_DIR%\%O_PREFIX%.txt
set TYPEPERF_FILE=%O_DIR%\%O_PREFIX%.tp.tsv
set CAPTURE_FILE=%O_DIR%\%O_PREFIX%.etl
set CAB_FILE=%O_PREFIX%.cab

echo Directory: %O_DIR%
echo Output file: %OUTPUT_FILE%
echo Typeperf file: %TYPEPERF_FILE%
echo Capture file: %CAPTURE_FILE%

set RECORD_SEPARATOR=--------

mkdir %O_DIR%

netsh trace start persistent=yes capture=yes tracefile=%CAPTURE_FILE%

typeperf -Q > %O_DST%\typeperf.counters
@start /b cmd /c typeperf -si 1 -sc 10 -cf %O_DST%\typeperf.counters -f TSV -o %TYPEPERF_FILE%


echo %RECORD_SEPARATOR% >> %OUTPUT_FILE%
echo ----sysinfo---- >> %OUTPUT_FILE%
systeminfo > %OUTPUT_FILE%


echo %RECORD_SEPARATOR% >> %OUTPUT_FILE%
echo ----icmp.internet---- >> %OUTPUT_FILE%
ping 8.8.8.8 >> %OUTPUT_FILE%


echo %RECORD_SEPARATOR% >> %OUTPUT_FILE%
echo ----icmp.app---- >> %OUTPUT_FILE%
ping 10.3.14.60 >> %OUTPUT_FILE%

echo %RECORD_SEPARATOR% >> %OUTPUT_FILE%
echo ----proxy---- >> %OUTPUT_FILE%
netsh winhttp show proxy >> %OUTPUT_FILE%


set /p DUMMY=Hit ENTER once app testing has completed ...  

netsh trace stop

dir %O_DIR% /s /b /a-d > %O_DST%\cab_files.txt
makecab /D MaxDiskSize=0 /D CompressionType=MSZIP /D Cabinet=ON /D Compress=ON /D UniqueFiles=OFF /D DiskDirectoryTemplate=%O_DST% /D CabinetNameTemplate=%CAB_FILE%  /F cab_files.txt

REM CLEANUP
del typeperf.counters
rmdir /q /s %O_DIR%
del %O_DST%\cab_files.txt








typeperf -si 1 -sc 10 -cf ps_counter.txt -f TSV -o %filename%.tp.tsv

