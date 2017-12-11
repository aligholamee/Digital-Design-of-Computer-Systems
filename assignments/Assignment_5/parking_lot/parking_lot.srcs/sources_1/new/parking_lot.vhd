----------------------------------------------------------------------------------
-- Company: Amirkabir University of Technology
-- Engineer: Ali Gholami (aligholamee)
-- 
-- Create Date: 12/11/2017 10:54:51 AM
-- Design Name: 
-- Module Name: ParkingLot - Behavioral
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

entity ParkingLot is
    port(
        a_input: in std_logic;
        b_input: in std_logic;
        door_cmd: out std_logic;
        car_counter: buffer integer;
        clk: in std_logic;
        rst: in std_logic
    );
end ParkingLot;

architecture Behavioral of ParkingLot is
    -- DEFINITION OF THE STATE_TYPE
    type STATE_TYPE is (NO_SENSE, A_SENSE, B_SENSE, RECOVERY);

    -- IMPLEMENT THE WHOLE FSM USING 1 PROCESS
    signal STATE: STATE_TYPE := NO_SENSE;

    -- IMPLEMENTS THE SAFE FSM CREDINTIALS 
    attribute safe_recovery_state: string;
    attribute safe_recovery_state of STATE: signal is "RECOVERY";

begin
    O_P: process(clk)
        begin
            if(rising_edge(clk)) then
                if(rst = '1') then
                    STATE <= NO_SENSE;
                    car_counter <= 0;
                    door_cmd <= '0';
                else
                    case STATE is
                        when NO_SENSE =>
                            if(a_input = '1' and b_input = '0') then
                                STATE <= A_SENSE;
                                door_cmd <= '1';
                            elsif(b_input = '1' and a_input = '0') then
                                STATE <= B_SENSE;
                                door_cmd <= '1';
                            else 
                                STATE <= NO_SENSE;
                                door_cmd <= '0' after 30000 ms;
                            end if;
                        when A_SENSE => 
                            if(a_input = '0' and b_input = '1') then
                                STATE <= B_SENSE;
                                door_cmd <= '1';
                                car_counter <= car_counter + 1;
                            elsif(a_input = '0' and b_input = '0') then
                                STATE <= NO_SENSE;
                            else
                                STATE <= STATE;
                            end if;
                        when B_SENSE => 
                            if(a_input = '1' and b_input = '0') then 
                                STATE <= A_SENSE;
                                car_counter <= car_counter - 1;
                                door_cmd <= '1';
                            elsif(a_input = '0' and b_input = '0') then 
                                STATE <= NO_SENSE;
                            else 
                                STATE <= STATE;
                            end if;
                        when RECOVERY =>
                                STATE <= NO_SENSE;
                    end case;
                end if;
            end if;
        end process;
end Behavioral;
