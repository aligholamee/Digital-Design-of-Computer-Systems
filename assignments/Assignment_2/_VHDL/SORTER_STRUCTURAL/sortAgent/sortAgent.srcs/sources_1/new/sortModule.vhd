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
    inputArray: in std_logic_vector(0 to N-1);
    outputArray: out std_logic_vector(0 to N-1)
  );
end sortModule;

architecture Behavioral of sortModule is
begin
  process
  variable temp: std_logic;
  begin
    A: for I in 0 to n-1 loop
      B: for J in 1 to n loop
        if(inputArray(J) <= inputArray(J-1))
          then
            temp <= tempArray(J-1);
            tempArray(J-1) <= tempArray(J);
            tempArray(J) <= temp;
          end if;
      end loop;
      C: for C in 1 to n-1 loop
        if(inputArray(C+1) <= inputArray(C))
          then
            temp <= tempArray(C);
            tempArray(C) <= tempArray(C+1);
            tempArray(C+1) <= temp;
        end if;
      end loop;
    end loop;
  end process;
end architecture Behavioral;
