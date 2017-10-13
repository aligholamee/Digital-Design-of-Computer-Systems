----------------------------------------------------------------------------------
-- Company: Amirkabir University of Technology
-- Engineer: Ali Gholami (aligholamee)
--
-- Create Date: 10/13/2017 10:53:39 AM
-- Design Name:
-- Module Name: FULL_ADDER - Behavioral
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

entity OR_GATE is
  port(
    A, B: in bit;
    RES: out bit
  );
end entity OR_GATE;

entity HALF_ADDER is
  port(
    A, B: in bit;
    SUM, CARRY: out bit
  );
end entity HALF_ADDER;

entity FULL_ADDER is
  port(
    A, B, CARRY_IN: in bit;
    SUM, CARRY_OUT: out bit
  );
end entity FULL_ADDER;

architecture STRUCT of FULL_ADDER is
  component HALF_ADDER
    port(
      A, B: in bit;
      SUM, CARRY: out bit
    );
  end component;

  component OR_GATE
    port(
      A, B: in bit;
      RES: out bit
    );
  end component;

  signal HA1_SUM, HA1_CARRY, HA2_CARRY: bit;
begin:
  MODULE_1: HALF_ADDER
  port map(A, B, HA1_SUM, HA1_CARRY);

  MODULE_2: HALF_ADDER
  port map(HA1_SUM, CARRY_IN, SUM, HA2_CARRY);

  MODULE_3: OR_GATE
  port map(HA2_CARRY, HA1_CARRY, CARRY);
end STRUCT;
