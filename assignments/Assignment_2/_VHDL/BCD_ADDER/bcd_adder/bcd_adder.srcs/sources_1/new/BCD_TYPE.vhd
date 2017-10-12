----------------------------------------------------------------------------------
-- Company: Amirkabir University of Technology
-- Engineer: Ali Gholami (aligholamee)
--
-- Create Date: 10/12/2017 05:20:31 PM
-- Design Name:
-- Module Name: BCD_TYPE
-- Project Name:
-- Target Devices:
-- Tool Versions:
-- Description: A simple type of Binary Coded Digital
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

package common is
    type bcd_number is std_logic_vector(2 downto 0);
end common
