@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.4\\bin
call %xv_path%/xelab  -wto b7100200da7a41f880239045e49f9b41 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot AdderTB_behav xil_defaultlib.AdderTB -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
