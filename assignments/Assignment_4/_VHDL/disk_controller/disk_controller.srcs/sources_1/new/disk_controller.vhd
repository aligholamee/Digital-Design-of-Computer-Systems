----------------------------------------------------------------------------------
-- Company: Amirkabir University of Technology
-- Engineer: Ali Gholami(aligholamee)
-- 
-- Create Date: 11/08/2017 08:43:37 PM
-- Design Name: 
-- Module Name: DiskController - FSM
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

entity DiskController is
    port(
        service_port_1: in integer range 0 to 128;
        service_port_2: in integer range 0 to 128;
        service_port_3: in integer range 0 to 128;
        service_port_4: in integer range 0 to 128;
        clk: in std_logic;
        rst: in std_logic;
        file_output: out std_logic_vector(31 downto 0)
    );
end DiskController;

architecture FSM of DiskController is

begin


end FSM;
