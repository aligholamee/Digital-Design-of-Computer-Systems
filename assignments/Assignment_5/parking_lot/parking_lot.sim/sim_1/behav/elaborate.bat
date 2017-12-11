@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.4\\bin
call %xv_path%/xelab  -wto 6d9e2aaed872482998516308d2fbbca9 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot ParkingLot_behav xil_defaultlib.ParkingLot -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
