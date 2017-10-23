@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.4\\bin
call %xv_path%/xelab  -wto fbfc43121fe147818ae3413d30bf2f5e -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot GCTestBench_behav xil_defaultlib.GCTestBench -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
