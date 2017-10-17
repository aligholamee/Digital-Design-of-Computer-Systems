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
    inputArray: buffer bit_vector(0 to N-1);
    outputArray: out bit_vector(0 to N-1)
  );
end sortModule;

architecture Behavioral of sortModule is
    signal temp: bit;
    signal temp2: bit;
    
begin
    process
        variable I: integer;
        variable J: integer;
        variable C: integer;
        begin            
            I := 0;
            J := 1;
            C := 1;
            A: while I < n-1 loop
                B: while J < n-1 loop
                    if(inputArray(J) <= inputArray(J-1)) then
                        temp2 <= inputArray(J-1);
                        temp <= inputArray(J);
                        inputArray(J) <= temp2;
                        inputArray(J-1) <= temp;
                    end if;
                    J := J + 1;
                   end loop B;
                X: while C < n-2 loop
                    if(inputArray(C+1) <= inputArray(C)) then
                        temp2 <= inputArray(C+1);
                        temp <= inputArray(C);
                        inputArray(C) <= temp2;
                        inputArray(C+1) <= temp;
                    end if;
                    C := C + 1;
                   end loop X;
                I := I + 1;
           end loop A;
        end process;
    outputArray <= inputArray;
end architecture Behavioral;   