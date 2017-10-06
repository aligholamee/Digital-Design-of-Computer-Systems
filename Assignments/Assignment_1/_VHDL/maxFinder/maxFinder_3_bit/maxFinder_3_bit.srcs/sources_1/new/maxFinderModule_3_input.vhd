----------------------------------------------------------------------------------
-- Company: Amirkabir University of Technology
-- Engineer: Ali Gholami(aligholamee)
--
-- Create Date: 10/05/2017 11:41:38 PM
-- Design Name:
-- Module Name: maxFinderModule_3_input - Gate
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

entity maxFinderModule_3_input is
  port(
    A, B, C: in std_logic;
    F_OUT: out std_logic
  );
end maxFinderModule_3_input;

architecture Gate of maxFinderModule_3_input is
  component andGate_2_bit is
    port(
      A, B: in std_logic;
      F_OUT: out std_logic
    );
  end component;
  component orGate_3_bit is
    port(
      A, B, C: in std_logic;
      F_OUT: out std_logic
    );
  end component;

  signal AND1_RES, AND2_RES, AND3_RES: std_logic;
  signal input1, input2, input3: std_logic;
  signal ciruit_output: std_logic;

begin
  MODULE AND_GATE_1:andGate_2_bit
  port map(
    A => input1,
    B => input2,
    F_OUT => AND1_RES
  );

  MODULE AND_GATE_2:andGate_2_bit
  port map(
    A => input2,
    B => input3,
    F_OUT => AND2_RES
  );

  MODULE AND_GATE_3:andGate_2_bit
  port map(
    A => input1,
    B => input3,
    F_OUT => AND3_RES
  );

  MODULE OR_GATE:orGate_3_bit
  port map(
    A => AND1_RES,
    B => AND2_RES,
    C => AND3_RES
    F_OUT => ciruit_output
  );
end Gate;
