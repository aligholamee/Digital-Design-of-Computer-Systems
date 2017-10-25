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
use work.common.all;

entity GenericModCounter is
    generic (N: integer := 4);
    port (
        modInput: integer:= N;
        counterOutput: integer;
        asyncReset: std_logic;
        clk: std_logic
    );
end GenericModCounter;

architecture RTL of GenericModCounter is

begin
    process(clk, asyncReset)
    begin
        if(asyncReset = 0) then
            modInput := N;
            counterOutput := 0;
            asyncReset := 1;

        elsif clk'event and clk = 1 then
            counterOutput := counterOutput + modInput;
        else 
            -- Do nothing;
        end if;
    end process;
end RTL;
