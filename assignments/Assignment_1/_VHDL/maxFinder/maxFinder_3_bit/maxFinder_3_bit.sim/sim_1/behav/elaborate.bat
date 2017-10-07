@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.4\\bin
call %xv_path%/xelab  -wto a9c85012015a4a1eb009d5d5476b9315 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot maxFinderTB_behav xil_defaultlib.maxFinderTB -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
