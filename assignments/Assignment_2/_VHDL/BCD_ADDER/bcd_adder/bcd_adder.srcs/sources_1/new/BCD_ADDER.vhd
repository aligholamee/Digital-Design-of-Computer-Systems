----------------------------------------------------------------------------------
-- Company: Amirkabir University of Technology
-- Engineer: Ali Gholami (aligholamee)
--
-- Create Date: 10/12/2017 05:18:15 PM
-- Design Name:
-- Module Name: BCD_ADDER - Structural
-- Project Name:
-- Target Devices:
-- Tool Versions:
-- Description: A BCD adder ( Data type + Structural representation)
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
use work.orGate;
use work.andGate;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
entity BCD_ADDER is
    port(
        input_1: in digit;
        input_2: in digit;
        bcd_output: out digit;
        carry_out: out std_logic;
        carry_in: in std_logic);
end entity BCD_ADDER;

architecture Structural of BCD_ADDER is
    -- Using 3 4 bit full adders
  component FOUR_BIT_FA is
    port(
      A: in std_logic_vector (3 downto 0);
      B: in std_logic_vector (3 downto 0);
      Carry_in: in std_logic;
      Carry_out: out std_logic;
      Sum: out std_logic_vector (3 downto 0)
    );
  end component;
  component andGate is
    port(
      A: in std_logic;
      B: in std_logic;
      res: out std_logic
    );
  end component;

  component orGate is
    port(
      A: in std_logic;
      B: in std_logic;
      C: in std_logic;
      res: out std_logic
    );
  end component;

  signal c1: digit;
  signal c2: digit;
  signal c3: digit;
  signal c4: std_logic;
  
begin
  -------------------------------------------
  MODULE1: FOUR_BIT_FA
    port map(
      input_1 => c1;
      input_2 => c2;
      bcd_output => c3;
      carry_in => 0;
      carry_out => c4
    );

  MODULE2: andGate
  port map(
      A => bcd_output(3);
      B => bcd_output(2);
      res => firstAndRes
  );

  MODULE3: andGate
  port map(
    A => bcd_output(3);
    B => bcd_output(1);
    res => secondAndRes
  );

  MODULE4: orGate
  port map(
    A => firstAndRes;
    B => secondAndRes
    C => c4
  );
  -------------------------------------------
end Structural;
