----------------------------------------------------------------------------------
-- Company: Amirkabir University of Technology
-- Engineer: Ali Gholami (aligholamee)
--
-- Create Date: 10/13/2017 04:21:46 PM
-- Design Name:
-- Module Name: threeDigitBcdAdder - Structural
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
use work.BCD_ADDER;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity threeDigitBcdAdder is
  port(
    A: in bcd_number;
    B: in bcd_number;
    SUM: out bcd_number;
    Carry_in: in std_logic;
    Carry_out: out std_logic
  );
end threeDigitBcdAdder;

architecture Structural of threeDigitBcdAdder is
  component BCD_ADDER is
    port(
      input_1: in digit;
      input_2: in digit;
      bcd_output: out digit;
      carry_out: out std_logic;
      carry_in: in std_logic
    );
  end component;

  signal carry1, carry2: std_logic;

begin
  MODULE1: BCD_ADDER
  port map(
    input1 => A(0);
    input_2 => B(0);
    bcd_output => SUM(0);
    carry_in => 1;
    carry_out => carry1
  );

  MODULE2: BCD_ADDER
  port map(
    input1 => A(1);
    input_2 => B(1);
    bcd_output => SUM(1);
    carry_in => carry1;
    carry_out => carry2
  );

  MODULE3: BCD_ADDER
  port map(
    input1 => A(2);
    input_2 => B(2);
    bcd_output => SUM(2);
    carry_in => carry2;
    carry_out => Carry_out
  );

end Structural;
