@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.4\\bin
call %xv_path%/xelab  -wto d25cff73b5ed4dc480a91eb0efee35c4 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot TrafficLight_behav xil_defaultlib.TrafficLight -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
