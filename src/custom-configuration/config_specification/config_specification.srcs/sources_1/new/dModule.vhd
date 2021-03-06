----------------------------------------------------------------------------------
-- Company: Amirkabir University of Technology
-- Engineer: Ali Gholami (aligholamee)
--
-- Create Date: 10/13/2017 06:46:27 PM
-- Design Name:
-- Module Name: dModule - Behavioral
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
use work.dModuleConfig.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dModule is
  -- Something :)
end dModule;

architecture Behavioral of dModule is

begin
  MODULE1: OTHER_MODULE
  port map();

  MODULE2: OTHER_MODULE
  port map();

  MODULE3: OTHER_MODULE
  port map();

end Behavioral;
