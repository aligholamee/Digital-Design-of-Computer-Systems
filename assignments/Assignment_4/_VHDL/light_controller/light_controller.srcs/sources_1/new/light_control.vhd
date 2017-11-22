----------------------------------------------------------------------------------
-- Company: Amirkabir University of Technology
-- Engineer: ALi Gholami(aligholamee)
-- 
-- Create Date: 11/08/2017 07:06:23 PM
-- Design Name: 
-- Module Name: LightControl - FSM
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
use IEEE.numeric_std.all;

entity LightControl is
    port(
        time_i: in integer range 0 to 24;
        sensor_input: in integer range 0 to 150;
        light_status: out std_logic;
        clk: in std_logic;
        rst: in std_logic
    );
end LightControl;

architecture FSM of LightControl is
    -- IMPLEMENTS THE 1 PROCESS FINITE STATE MACHINE 
    type STATE_TYPE is (LIGHTS_OFF, LIGHTS_ON, RECOVERY);

    -- STATE SIGNAL
    signal STATE: STATE_TYPE := LIGHTS_OFF;

    -- IMPLEMENTS THE SAFE FSM CREDINTIALS
    attribute safe_recovery_state: string;
    attribute safe_recovery_state of STATE: signal is "RECOVERY";

begin
    -- COMPLETE IMPLEMENTATION IN 1 PROCESS ONLY
    O_P: process(clk, sensor_input, STATE, rst)
         begin
            if(rising_edge(clk)) then
                -- SYNCHRONOUS RESET
                if(rst = '1') then
                        -- CHANGE THE STATE TO THE LIGHTS_OFF MODE
                    STATE <= LIGHTS_OFF;
                    light_status <= '0';
                else    -- CONTROL THE STATE CHANGING STATUS
                    case STATE is 
                        when LIGHTS_OFF =>
                            if(to_unsigned(time_i,5) <= 5 and to_unsigned(time_i,5) => 1) then 
                                STATE <= LIGHTS_OFF;
                                light_status <= '0';
                            elsif(to_unsigned(time_i,5) => 5 and to_unsigned(time_i,5) <= 8) then
                                if(sensor_input > 100) then 
                                    STATE <= LIGHTS_OFF;
                                    light_status <= '0';
                                else 
                                    STATE <= LIGHTS_ON;
                                    light_status <= '1';
                                end if;
                            elsif(to_unsigned(time_i,5) => 8 and to_unsigned(time_i,5) <= 17) then
                                STATE <= LIGHTS_OFF;
                            else
                                if(sensor_input > 100) then 
                                    STATE <= LIGHTS_OFF;
                                else
                                    STATE <= LIGHTS_ON;
                                end if;
                            end if;
                        -- DUPLICATE
                        when LIGHTS_ON =>
                            if(to_unsigned(time_i,5) <= 5 and to_unsigned(time_i,5) => 1) then 
                                STATE <= LIGHTS_OFF;
                                light_status <= '0';
                            elsif(to_unsigned(time_i,5) => 5 and to_unsigned(time_i,5) <= 8) then
                                if(sensor_input > 100) then 
                                    STATE <= LIGHTS_OFF;
                                    light_status <= '0';
                                else 
                                    STATE <= LIGHTS_ON;
                                    light_status <= '1';
                                end if;
                            elsif(to_unsigned(time_i,5) => 8 and to_unsigned(time_i,5) <= 17) then
                                STATE <= LIGHTS_OFF;
                            else
                                if(sensor_input > 100) then 
                                    STATE <= LIGHTS_OFF;
                                else
                                    STATE <= LIGHTS_ON;
                                end if;
                            end if;
                        -- RECOVERY STATE
                        when RECOVERY => 
                            STATE <= LIGHTS_OFF;
                    end case;
                end if;
            end if;
         end process;
end FSM;
