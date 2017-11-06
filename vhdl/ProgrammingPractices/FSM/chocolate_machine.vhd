
-- Coded with Visual Studio Code
-- Developer: Ali Gholami(aligholamee)


library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity ChoclateMachine is 
    port (
        dInput: in std_logic;
        pInput: in std_logic;
        rst: in std_logic;
        clk: in std_logic;
        chocolateOutput: out std_logic
    );
end ChoclateMachine;

architecture RTL of ChocolateMachine is 
    type STATE_TYPE is (START, P200, P400, FULL);
    signal current_state, next_state: STATE_TYPE;
begin
    