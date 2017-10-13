----------------------------------------------------------------------------------
-- Company: Amirkabir University of Technology
-- Engineer: Ali Gholami (aligholamee)
--
-- Create Date: 10/13/2017 06:38:33 PM
-- Design Name:
-- Module Name: MultipleDriverTest - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MultipleDriverTest is

end MultipleDriverTest;

architecture Behavioral of MultipleDriverTest is

  signal x, w: std_logic:='1';
  signal y, z: std_logic:='0';
begin
  p1: process(x, w)
  begin
    z <= x or w;
  end process;
  p2: process(x, y)
  begin
    z <= x and y;
  end process;
end Behavioral;
