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

entity LightControl is
    port(
        time: in integer range 0 to 24;
        sensor_input: in integer range 0 to 150;
        light_status: out std_logic;
        clk: in std_logic;
        rst: in std_logic
    );
end LightControl;

architecture FSM of LightControl is
    -- IMPLEMENTS THE 1 PROCESS FINITE STATE MACHINE 
    type STATE_TYPE is (LIGHTS_OFF, LIGHTS_ON);

    -- IMPLEMENTS THE SAFE FSM CREDINTIALS
    attribute safe_recovery_state: string;
    attribute safe_recovery_state of STATE: signal is "RECOVERY";
    
    -- STATE SIGNAL
    signal STATE: STATE_TYPE := LIGHTS_OFF;

begin
    -- COMPLETE IMPLEMENTATION IN 1 PROCESS ONLY
    O_P: process(clk, sensor_input, light_status, STATE)
         begin
            if(rising_edge(clk)) then
                if(rst = '1') then
                    -- CHANGE THE STATE TO THE LIGHTS_OFF MODE
                    STATE <= LIGHTS_OFF;
                    light_status <= '0';
                else 
                    -- CONTROL THE STATE CHANGING STATUS
                     case STATE is 
                        when LIGHTS_OFF =>
                            if(time <= 5 and time => 1) then 
                                STATE <= LIGHTS_OFF;
                                light_status <= '0';
                            elsif(time => 5 and time <= 8) then
                                if(sensor_input > 100) then 
                                    STATE <= LIGHTS_OFF;
                                    light_status <= '0';
                                else 
                                    STATE <= LIGHTS_ON;
                                    light_status <= '1';
                                end if;
                            elsif(time => 8 and time <= 17) then
                                STATE <= LIGHTS_OFF;
                            else
                                if(sensor_input > 100) then 
                                    STATE <= LIGHTS_OFF;
                                else
                                    STATE <= LIGHTS_ON;
                        
                        -- DUPLICATE
                        when LIGHTS_ON =>
                            if(time <= 5 and time => 1) then 
                                STATE <= LIGHTS_OFF;
                                light_status <= '0';
                            elsif(time => 5 and time <= 8) then
                                if(sensor_input > 100) then 
                                    STATE <= LIGHTS_OFF;
                                    light_status <= '0';
                                else 
                                    STATE <= LIGHTS_ON;
                                    light_status <= '1';
                                end if;
                            elsif(time => 8 and time <= 17) then
                                STATE <= LIGHTS_OFF;
                            else
                                if(sensor_input > 100) then 
                                    STATE <= LIGHTS_OFF;
                                else
                                    STATE <= LIGHTS_ON;
                        -- RECOVERY STATE
                        when RECOVERY => 
                            STATE <= LIGHTS_OFF;
            end if;
         end process;
end FSM;
