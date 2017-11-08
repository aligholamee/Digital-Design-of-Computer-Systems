----------------------------------------------------------------------------------
-- Company: Amirkabir University of Technology
-- Engineer: Ali Gholami(aligholamee)
-- 
-- Create Date: 11/08/2017 05:30:09 PM
-- Design Name: 
-- Module Name: SyncControl - FSM
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SyncControl is
    port(
        input_P: in std_logic;
        output_P1: out std_logic;
        output_P2: out std_logic;
        clk: in std_logic
    );
end SyncControl;

architecture FSM of SyncControl is
    type STATE_TYPE is (START, OUTPUT1_ENABLE_STATE, OUTPUT2_ENABLE_STATE, RECOVERY);

    -- DEFINE THE RECOVERY STATE FOR THE SAFE FSM
    attribute safe_recovery_state: string;
    attribute safe_recovery_state of STATE: signal is "RECOVERY";
begin
    -- PROCESS TO CHECK FOR THE INPUT AND CLOCK
    P1: process(input_P, clk)
    begin 


    end process;

    P2: process(output1)
    begin
    

    end process;
    



end FSM;
