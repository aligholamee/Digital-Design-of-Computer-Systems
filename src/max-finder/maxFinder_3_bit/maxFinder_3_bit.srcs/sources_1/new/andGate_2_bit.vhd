----------------------------------------------------------------------------------
-- Company: Amirkabir University of Technology
-- Engineer: Ali Gholami(aligholamee)
--
-- Create Date: 10/05/2017 11:34:15 PM
-- Design Name:
-- Module Name: andGate_2_bit - Gate
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

entity andGate_2_bit is
  port(
    A, B: in std_logic;
    F_OUT: out std_logic
  );
end andGate_2_bit;

architecture Gate of andGate_2_bit is
begin
  F_OUT <= A and B;
end Gate;
