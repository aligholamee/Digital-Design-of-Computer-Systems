----------------------------------------------------------------------------------
-- Company: Amirkabir University of Technology
-- Engineer: Ali Gholami (aligholamee)
--
-- Create Date: 10/13/2017 02:35:25 PM
-- Design Name:
-- Module Name: FOUR_BIT_FA - Behavioral
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
use work.FULL_ADDER;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FOUR_BIT_FA is
  port(
    A: in std_logic_vector (3 downto 0);
    B: in std_logic_vector (3 downto 0);
    Carry_in: in std_logic;
    Carry_out: out std_logic;
    Sum: out std_logic_vector (3 downto 0)
  );
end FOUR_BIT_FA;

architecture Behavioral of FOUR_BIT_FA is
  component FULL_ADDER is
    port(
      A, B, CARRY_IN: in std_logic;
      SUM, CARRY_OUT: out std_logic
    );
  end component;

  signal Carry_1, Carry_2, Carry_3;

begin
  MODULE1: FULL_ADDER
  port map();

  MODULE2: FULL_ADDER
  port map();

  MODULE3: FULL_ADDER
  port map();

  MODULE4: FULL_ADDER
  port map();
end Behavioral ;
