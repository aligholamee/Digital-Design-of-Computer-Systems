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
use IEEE.numeric_std.all;

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
    RAM_LOAD: process(clk)
        -- R3 Declaration as a variable 
        -- Variable will be used probably in the next process
        variable R3_V: std_logic_vector(31 downto 0);
    begin 
        -- We're gonna load the 32 words of this ram with clock first
        -- Outputs are being updated in the runtime :D
        if(rising_edge(clk)) then
            -- STATE 0 DESCRIPTION
            ram_block(0) <= ((66 downto 64) => "000", (63 downto 32) => std_logic_vector(to_unsigned(0, 32)), (31 downto 0) => std_logic_vector(to_unsgined(0, 32)));
            ram_block(1) <= ((66 downto 64) => "000", (63 downto 32) => std_logic_vector(to_unsigned(0, 32)), (31 downto 0) => std_logic_vector(to_unsigned(0, 32)));
            ram_block(2) <= ((66 downto 64) => "001", (63 downto 32) => std_logic_vector(to_unsigned(0, 32)), (31 downto 0) => std_logic_vector(to_unsigned(0, 32)));
            ram_block(3) <= ((66 downto 64) => "001", (63 downto 32) => std_logic_vector(to_unsigned(0, 32)), (31 downto 0) => std_logic_vector(to_unsigned(0, 32)));
            
            -- STATE 1 DESCRIPTION
            ram_block(4) <= ((66 downto 64) => "001");
            ram_block(5) <= ((66 downto 64) => "001");
            ram_block(6) <= ((66 downto 64) => "001", (63 downto 32) => r2_p, (31 downto 0) => r1_p);
            ram_block(7) <= ((66 downto 64) => "010");
            
            -- STATE 2 DESCRIPTION
            ram_block(8) <= ((66 downto 64) => "010");
            ram_block(9) <= ((66 downto 64) => "010");
            ram_block(10) <= ((66 downto 64) => "011");
            ram_block(11) <= ((66 downto 64) => "011");
            
            -- STATE 3 DESCRIPTION
            ram_block(12) <= ((66 downto 64) => "011");
            ram_block(13) <= ((66 downto 64) => "011");
            ram_block(14) <= ((66 downto 64) => "100");
            ram_block(15) <= ((66 downto 64) => "100");
            
            -- STATE 4 DESCRIPTION
            ram_block(16) <= ((66 downto 64) => "100");
            ram_block(17) <= ((66 downto 64) => "100");
            ram_block(18) <= ((66 downto 64) => "001");
            ram_block(19) <= ((66 downto 64) => "001");
            ram_block(31 downto 20) <= std_logic_vector(to_unsigned(0, 67));
                    
end RTL;
