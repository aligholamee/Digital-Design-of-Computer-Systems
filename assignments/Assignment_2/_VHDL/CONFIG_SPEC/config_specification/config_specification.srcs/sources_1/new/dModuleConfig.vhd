----------------------------------------------------------------------------------
-- Company: Amirkabir University of Technology
-- Engineer: Ali Gholami (aligholamee)
--
-- Create Date: 10/13/2017 06:55:59 PM
-- Design Name:
-- Module Name: dModuleConfig - Behavioral
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
package Common is

configuration dModuleConfig of dModule is
  for Behavioral                        -- Loop through the Behavioral architecture modules
    for MODULE_1:OTHER_MODULE           -- Set the MODULE1 to use the sequential version
      use entity work.divider(sequential)
    end for;

    for others:OTHER_MODULE             -- Set the others to use the combinational version
      use entity work.divider(combinational)
    end for;
  end for;
end dModuleConfig;

end Common;
