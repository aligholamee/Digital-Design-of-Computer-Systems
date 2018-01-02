----------------------------------------------------------------------------------
-- Company: Amirkabir University of Technology
-- Engineer: Ali Gholami(aligholamee)
--
-- Create Date: 10/25/2017 01:35:34 PM
-- Design Name:
-- Module Name: GMCTestBench - Behavioral
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

entity GMCTestBench is

end GMCTestBench;

architecture Behavioral of GMCTestBench is
  component GenericModCounter is
    generic (N: integer := 4);
    port (
      modInput: in integer := N;
      counterOutput: buffer integer := 0;
      asyncReset: buffer std_logic;
      clk: in std_logic
  );
  end component;

  signal ModInput: integer;
  signal CounterOutput: integer := 0;
  signal CLK: std_logic;
  signal RST: std_logic;
begin
  MC1: GenericModCounter port map(
    modInput => ModInput,
    counterOutput => CounterOutput,
    asyncReset => RST,
    clk => CLK
  );
  process
    begin
      ModInput <= 5;
      wait for 500 ns;
      ModInput <= 6;
      wait for 500 ns;
      ModInput <= 7;
      wait for 500 ns;
  end process;
end Behavioral;
