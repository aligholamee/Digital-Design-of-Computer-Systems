----------------------------------------------------------------------------------
-- Company: Amirkabir University of Technology
-- Engineer: Ali Gholami(aligholamee)
--
-- Create Date: 10/06/2017 11:23:02 AM
-- Design Name:
-- Module Name: maxFinderTB - Gate
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

entity maxFinderTB is
--  Port ( );
end maxFinderTB;

architecture Gate of maxFinderTB is
  component maxFinderModule_3_input is
    port(
      A, B, C: in std_logic;
      F_OUT: out std_logic
    );
  end component;

    signal abc: std_logic_vector (2 downto 0);
    signal maxOutput: std_logic;
begin
  TB1: maxFinderTB port map(
    A => abc[2],
    B => abc[1],
    c => abc[0],
    F_OUT => maxOutput
  );

end Gate;
