@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.4\\bin
call %xv_path%/xelab  -wto 6952746f267b429bb6b72a93a966c3c7 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot PatternVerifier_behav xil_defaultlib.PatternVerifier -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
