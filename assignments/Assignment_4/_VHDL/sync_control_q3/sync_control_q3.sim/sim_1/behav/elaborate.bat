@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.4\\bin
call %xv_path%/xelab  -wto 9fa87e8171cd4c4ca7910b565f9f5055 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot SyncControl_behav xil_defaultlib.SyncControl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0