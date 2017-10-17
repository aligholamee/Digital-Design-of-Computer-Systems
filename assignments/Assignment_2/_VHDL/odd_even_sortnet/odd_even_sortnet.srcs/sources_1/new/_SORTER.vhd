----------------------------------------------------------------------------------
-- Company: Amirkabir University of Technology
-- Engineer: Ali Gholami (aligholamee)
--
-- Create Date: 10/17/2017 06:16:41 PM
-- Design Name:
-- Module Name: sorter - Structural
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

entity sorter is
    generic(N: integer := 8);
    -- algo found!
end sorter;

architecture Structural of sorter is
    component comparator is
        port(
            input1: in bit_vector(7 downto 0);
            input2: in bit_vector(7 downto 0);
            output1: out bit_vector(7 downto 0);
            output2: out bit_vector(7 downto 0)
        );
begin
    -- for the first column
    for x in 0 to N-1 generate
        if(x mod 2 = 1)
            first_col: comparator port map(inputSignal(x-1), inputSignal(x), outputSignal(0)(x-1), outputSignal(0)(x));
    end generate;
    -- for the last column


    -- for internal columns
    for i in 1 to 6 generate
    begin
        if(i mod 2 = 0) generate
            L1: for j in 0 to N-1 generate
            -- Assign N/2 Comparators
                if(j mod 2 = 1) generate -- Handles the first comp of odd columns
                    if(j = 1) generate
                        first_coms_odd: comparator port map(outputSignal(i-2)(j-1), outputSignal(i-1)(j), outputSignal(i)(j-1), outputSignal(i)(j));
                    end generate;
                    if(j = 7) generate
                        last_coms_odd: comparator port map(outputSignal(i-1)(j-1), outputSignal(i-2)(j), outputSignal(i)(j-1), outputSignal(i)(j));
                    end generate;
                end generate;

                else generate   -- Handles the other comps of odd columns
                coms_odd: comparator port map(outputSignal(i-1)(j-1), inputSignal(i-1)(j), outputSignal(i)(j-1), outputSignal(i)(j));
                end generate;

        if(i mod 2 = 1) generate
            L2: for j in 1 to N-2 generate
            -- Assign N/2 - 1 Comparators
                if(j mod 2 = 1) -- odd number of wires means one comparator!
                coms_even: comparator port map(outputSignal(i-1)(j), inputSignal(i-1)(j+1), outputSignal(i)(j-1), outputSignal(i)(j));
            end generate;
        end generate;
    end generate;

end Structural;
