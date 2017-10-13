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
use work.FULL_ADDER.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity BCD_ADDER is
    port(
        input_1: in bcd_number;
        input_2: in bcd_number;
        bcd_output: out bcd_number;
        carry_out: out bcd_number;
        carry_in: in bcd_number);
end entity BCD_ADDER;

architecture Structural of BCD_ADDER is
  component FULL_ADDER
    port(
      A, B, CARRY_IN: in std_logic;
      SUM, CARRY_OUT: out std_logic
    );
  end component;

  signal carry_1, carry_2, carry_3: std_logic;
begin
  MODULE1: FULL_ADDER
  port map(input_1[0], input_2[0], 0, bcd_output[0], carry_1);

  MODULE2: FULL_ADDER
    port map(input_1[1], input_2[1], carry_1, bcd_output[1], carry_2);

  MODULE3: FULL_ADDER
    port map(input_1[2], input_2[2], carry_2, bcd_output[2], carry_3);

end Structural;
