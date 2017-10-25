----------------------------------------------------------------------------------
-- Company: Amirkabir University of Technology
-- Engineer: Ali Gholami(aligholamee)
--
-- Create Date: 10/25/2017 12:50:27 PM
-- Design Name:
-- Module Name: GenericModCounter - RTL
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

entity GenericModCounter is
    generic (N: integer := 4);
    port (
        modInput: in integer := N;
        counterOutput: buffer integer := 0;
        asyncReset: buffer std_logic;
        clk: in std_logic
    );
end GenericModCounter;

architecture RTL of GenericModCounter is

begin
    process(clk, asyncReset)
    begin
        if(asyncReset = '1') then
            counterOutput <= 0;
            asyncReset <= '0';
        elsif clk'event and clk = '1' then
            counterOutput <= counterOutput + modInput;
        end if;
    end process;
end RTL;
