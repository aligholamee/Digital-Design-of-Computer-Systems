@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.4\\bin
call %xv_path%/xelab  -wto da5593dbcdba4f568e5dc579b08db2c0 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot DiskController_behav xil_defaultlib.DiskController -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
