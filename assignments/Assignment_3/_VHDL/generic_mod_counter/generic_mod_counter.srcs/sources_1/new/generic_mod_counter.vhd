----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
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
    generic N(integer := 4);
    port (
        modInput: integer:= N;
        counterOutput: integer;
        asyncReset: std_logic
    );
end GenericModCounter;

architecture RTL of GenericModCounter is

begin


end RTL;
