@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.4\\bin
call %xv_path%/xelab  -wto 9ad40c901bb243cb828624d99d8933cc -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot GMCTestBench_behav xil_defaultlib.GMCTestBench -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
