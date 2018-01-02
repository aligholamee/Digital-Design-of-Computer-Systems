@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.4\\bin
call %xv_path%/xelab  -wto f237ddb7e6aa4b89a6b063c6bdd08190 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot LightControl_behav xil_defaultlib.LightControl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
