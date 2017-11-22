----------------------------------------------------------------------------------
-- Company: Amirkabir University of Technology
-- Engineer: Ali Gholami(aligholamee)
-- 
-- Create Date: 11/08/2017 07:45:21 PM
-- Design Name: 
-- Module Name: TrafficLight - FSM
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

entity TrafficLight is
    port(
        output_color: out std_logic_vector(1 downto 0);
        sensor_1: in std_logic;
        clk: in std_logic;
        rst: in std_logic
    );
end TrafficLight;

architecture FSM of TrafficLight is
    -- IMPLEMENTS THE 1 PROCESS FINITE STATE MACHINE 
    type STATE_TYPE is (GREEN_LIGHT, YELLOW_LIGHT, RED_LIGHT, RECOVERY); 

    -- STATE SIGNAL 
    signal STATE: STATE_TYPE := GREEN_LIGHT;
    signal YELLOW_PULSE: integer range 0 to 30;
    signal RED_PULSE: integer range 0 to 100;

    -- IMPLEMENTS THE SAFE FSM CREDINTIALS
    attribute safe_recovery_state: string;
    attribute safe_recovery_state of STATE: signal is "RECOVERY";
begin
    O_P: process(clk)
         begin 
            if(rising_edge(clk)) then
                if(rst = '1') then 
                    STATE <= GREEN_LIGHT;
                else 
                    case STATE is
                        when GREEN_LIGHT =>
                            if(sensor_1 = '1') then 
                                -- CHANGE THE STATE TO YELLOW_LIGHT
                                -- HERE THE TIMER FOR THE YELLOW LIGHT STARTS
                                YELLOW_PULSE <= 0;
                                STATE <= YELLOW_LIGHT;
                            end if;
                        when YELLOW_LIGHT => 
                            if(YELLOW_PULSE = 30) then
                                -- GO TO THE RED STATE
                                -- THE COUNTER FOR THE RED LIGHT STARTS HERE
                                STATE <= RED_LIGHT;
                            else 
                                -- INC THE YELLOW PULSE
                                YELLOW_PULSE <= YELLOW_PULSE + 1;
                                STATE <= YELLOW_LIGHT;
                            end if;
                        when RED_LIGHT => 
                            if(RED_PULSE = 100) then
                                STATE <= GREEN_LIGHT;
                            else 
                                RED_PULSE <= RED_PULSE + 1;
                                STATE <= RED_LIGHT;
                            end if;
                        when RECOVERY => 
                            -- GREEN LIGHT AT THIS MOMENT COULD BE DANGEROUS :D
                            STATE <= RED_LIGHT;
                    end case;
                end if;
            end if;
         end process;
    
    O_C: process(STATE)
    begin 
        case STATE is 
            when GREEN_LIGHT =>
                output_color <= "00";

            when YELLOW_LIGHT =>
                output_color <= "01";

            when RED_LIGHT =>
                output_color <= "10";
            
            when RECOVERY =>    
                output_color <= "11";
        end case;   
    end process;
end FSM;
