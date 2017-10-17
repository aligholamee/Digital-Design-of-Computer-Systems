----------------------------------------------------------------------------------
-- Company: Amirkabir University of Technology
-- Engineer: Ali Gholami (aligholamee)
--
-- Create Date: 10/17/2017 01:36:58 PM
-- Design Name:
-- Module Name: _COMPARATOR - Behavioral
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
use work.common.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity comparator is
    port(
        input1: in bit_vector(7 downto 0);
        input2: in bit_vector(7 downto 0);
        output1: out bit_vector(7 downto 0);
        output2: out bit_vector(7 downto 0)
    );
end comparator;

architecture Behavioral of comparator is
begin
    output1 <= input1 when input1 > input2 else input2;
    output2 <= input1 when input1 < input2 else input2;
end Behavioral;
