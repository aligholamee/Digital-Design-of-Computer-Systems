@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.4\\bin
call %xv_path%/xelab  -wto 0fc3d5e2bac0434b9fece8f8eba8d2a4 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot RegisterController_behav xil_defaultlib.RegisterController -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
