@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.4\\bin
call %xv_path%/xelab  -wto 6e237b6874e34418ae66a296c77a6dd3 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot MultipleDriverTest_behav xil_defaultlib.MultipleDriverTest -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
