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
        light_status: out std_logic
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


end FSM;
