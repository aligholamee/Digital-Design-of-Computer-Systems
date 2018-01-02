----------------------------------------------------------------------------------
-- Company: Amirkabir University of Technology
-- Engineer: Ali Gholami (aligholamee)
--
-- Create Date: 10/13/2017 03:13:20 PM
-- Design Name:
-- Module Name: orGate - Behavioral
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

entity orGate is
  port(
    A: in std_logic;
    B: in std_logic;
    C: in std_logic;
    res: out std_logic
  );
end orGate;

architecture Behavioral of orGate is

begin
  res <= A or B or C;
end Behavioral;
