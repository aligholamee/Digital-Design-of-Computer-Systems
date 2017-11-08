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

-- THE FOLLOWING FSM IS IMPLEMENTED USING A SINGLE PROCESS FOR EACH CONTROL PATH
architecture FSM of SyncControl is
    type STATE_TYPE is (START, OUTPUT1_ENABLE_STATE, OUTPUT2_ENABLE_STATE, RECOVERY);

    -- DEFINE THE RECOVERY STATE FOR THE SAFE FSM
    attribute safe_recovery_state: string;
    attribute safe_recovery_state of STATE: signal is "RECOVERY";

    -- DEFINE THE CURRENT_STATE AND NEXT_STATE OF THE FSM
    signal CURRENT_STATE, NEXT_STATE: STATE_TYPE := START;
    signal pulse_controller: std_logic := '0';
begin

    -- PROCESS TO DESCRIBE THE CENTRAL REGISTERS OF FSM
    -- THIS PROCESS CONTROLS THE FLIP-FLOPS
    FFs: process(clk)
    begin 
        if(rising_edge(clk)) then
            CURRENT_STATE <= NEXT_STATE;
            pulse_contoller <= '0';
        elsif(falling_edge(clk)) 
            -- THIS WILL TELL THE OUTPUT1_ENABLE_STATE TO CHANGE THE STATE TO THE NEXT STATE
            -- FALLING EDGE HAS OCCURRED
            pulse_controller <= '1';
        else
            -- AVOID LATCH
            pulse_controller <= '-';
    end process;

    -- PROCESS TO DESCRIBE THE NEXT_STATE GENERATOR COMBINATIONAL CIRCUIT
    CC1: process(pulse_controller, CURRENT_STATE, input_P)
    begin 
        case CURRENT_STATE is 
            when START =>
                if(rising_edge(input_P))
                    NEXT_STATE <= OUTPUT1_ENABLE_STATE;
                else
                    NEXT_STATE <= OUTPUT2_ENABLE_STATE;
                end if;
            when OUTPUT1_ENABLE_STATE => 
                if(pulse_controller = '1')
                    



        
    end process;
end FSM;
