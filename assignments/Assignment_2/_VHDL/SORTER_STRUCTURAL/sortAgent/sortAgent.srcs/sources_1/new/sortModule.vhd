----------------------------------------------------------------------------------
-- Company: Amirkabir University of Technology
-- Engineer: Ali Gholami (aligholamee)
--
-- Create Date: 10/14/2017 03:44:52 PM
-- Design Name:
-- Module Name: sortModule - Structural
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sortModule is
  generic (N: integer := 8);
  port (
    inputArray: inout std_logic_vector(0 to N-1);
    outputArray: inout std_logic_vector(0 to N-1)
  );
end sortModule;

architecture Behavioral of sortModule is
    signal temp: std_logic;
    signal clk, reset: std_logic;
begin
  process(clk, reset)
  begin
    if reset = "0" then
      if clk'event and clk = "1" then
        A: for I in 0 to n-1 loop
          B: for J in 1 to n-1 loop
            if(inputArray(J) <= inputArray(J-1)) then
                temp <= inputArray(J);
                inputArray(J) <= inputArray(J-1);
                inputArray(J-1) <= temp;
              end if;
          end loop;
          C: for C in 1 to n-2 loop
            if(inputArray(C+1) <= inputArray(C))
              then
                temp <= inputArray(C);
                inputArray(C) <= inputArray(C+1);
                inputArray(C+1) <= temp;
            end if;
          end loop;
        end loop;
      end if;
    end if;
  end process;
  outputArray <= inputArray;
end architecture Behavioral;
