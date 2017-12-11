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
        car_counter: out integer
    );
end ParkingLot;

architecture Behavioral of ParkingLot is

begin


end Behavioral;
