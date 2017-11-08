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

    -- DEFINE THE TEMP SIGNAL USED TO ATTACH THE OUTPUT OF FINAL COMBINATIONAL CIRCUIT TO THE SHIF-REGISTERS
    signal TEMP_S_OUTPUT1: std_logic := '0';
    signal TEMP_S_OUTPUT2: std_logic := '0';

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

    -- PROCESS TO DESCRIBE THE OUTPUTS ON EACH STATE
    -- THIS WILL BE A MOORE TYPE FSM
    CC2: process(NEXT_STATE)
    begin 
        case NEXT_STATE is 
            when START =>
                TEMP_S_OUTPUT1 <= '0';
                TEMP_S_OUTPUT2 <= '0';
            when OUTPUT1_ENABLE_STATE => 
                TEMP_S_OUTPUT1 <= '1';
                TEMP_S_OUTPUT2 <= '0';
            when OUTPUT2_ENABLE_STATE => 
                TEMP_S_OUTPUT1 <= '0';
                TEMP_S_OUTPUT2 <= '1';
            when others => 
                TEMP_S_OUTPUT1 <= '-';
                TEMP_S_OUTPUT2 <= '-';
    end process;

    -- PORCESS TO DESCRIBE THE FINAL SHIFT REGISTERS
    -- THIS WILL PROVIDE THE OUTPUT WITH CLOCKS HITTING :D
    SR_SYNC: process(clk, TEMP_S_OUTPUT1, TEMP_S_OUTPUT2)
    begin 
        if(rising_edge(clk))
            output_p1 <= TEMP_S_OUTPUT1;
            output_p2 <= TEMP_S_OUTPUT2;
    end process;
end FSM;


