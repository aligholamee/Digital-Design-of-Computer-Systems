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
begin

    -- PROCESS TO DESCRIBE THE CENTRAL REGISTERS OF FSM
    -- THIS PROCESS CONTROLS THE FLIP-FLOPS
    FFs: process(clk)
    begin 
        if(rising_edge(clk)) then
            CURRENT_STATE <= NEXT_STATE;
            pulse_contoller <= '0';
    end process;

    -- PROCESS TO DESCRIBE THE NEXT_STATE GENERATOR COMBINATIONAL CIRCUIT
    CC1: process(CURRENT_STATE, input_P)
    begin 
        case CURRENT_STATE is 
            when START =>
                if(rising_edge(input_P))
                    NEXT_STATE <= OUTPUT1_ENABLE_STATE;
                else
                    NEXT_STATE <= CURRENT_STATE;
                end if;
            when OUTPUT1_ENABLE_STATE => 
                wait until falling_edge(clk)
                    NEXT_STATE <= OUTPUT2_ENABLE_STATE;
                else 
                    NEXT_STATE <= CURRENT_STATE;
            when OUTPUT2_ENABLE_STATE => 
                if(input_P = '1')
                    NEXT_STATE = CURRENT_STATE;
                else 
                    NEXT_STATE = START;
            when others => 
                NEXT_STATE <= RECOVERY;
    end process;
end FSM;
