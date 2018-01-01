----------------------------------------------------------------------------------
-- Company: Amirkabir University of Technology
-- Engineer: Ali Gholami (aligholamee)
-- 
-- Create Date: 12/31/2017 10:07:01 PM
-- Design Name: 
-- Module Name: RegisterController - RTL
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

entity RegisterController is
    port(
        r1_p: inout std_logic_vector(31 downto 0);
        r2_p: inout std_logic_vector(31 downto 0);
        write_p: in std_logic;
        enable_p: in std_logic;
        clk_p: in std_logic;
        reset_p: in std_logic
    );
end RegisterController;

architecture RTL of RegisterController is
    -- Create the ram word
    subtype ram_word is std_logic_vector(66 downto 0);
    
    -- Create the ram block of 32 ram_words
    type ram_block is array 31 downto 0 of ram_word;
    
    
    
    
begin


    M_B: process(clk)
    begin 
        if(rising_edge(clk)) then
            if(reset_p = '1') then
                STATE <= STATE0;
            else
                
end RTL;
