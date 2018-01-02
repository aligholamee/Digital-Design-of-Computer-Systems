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
        ram_rw: in std_logic;                       -- 0 => Read from ram | 1 => Write to the ram
        reset_p: in std_logic
    );
end RegisterController;

architecture RTL of RegisterController is
    -- Create the ram word
    subtype ram_word is std_logic_vector(66 downto 0);
    
    -- Create the ram block of 32 ram_words
    type ram_block_type is array (31 downto 0) of ram_word;
    signal ram_block: ram_block_type := (
                    0 => (others => '0'),
                    1 => (others => '0'),
                    2 => (others => '0'),
                    3 => (others => '0'),
                    4 => (66 downto 64 => "001", others => '0'),
                    5 => (66 downto 64 => "001", others => '0'),
                    6 => (66 downto 64 => "001", 63 downto 32 => r2_p, 31 downto 0 => r1_p),
                    7 => (66 downto 64 => "010", others => '0'),
                    8 => (66 downto 64 => "010", others => '0'),
                    9 => (66 downto 64 => "010", others => '0'),
                    10 => (66 downto 64 => "011", others => '0'),
                    11 => (66 downto 64 => "011", others => '0'),
                    12 => (66 downto 64 => "011", others => '0'),
                    13 => (66 downto 64 => "011", others => '0'),
                    14 => (66 downto 64 => "100", others => '0'),
                    15 => (66 downto 64 => "100", others => '0'),
                    16 => (66 downto 64 => "100", others => '0'),
                    17 => (66 downto 64 => "100", others => '0'),
                    18 => (66 downto 64 => "001", others => '0'),
                    19 => (66 downto 64 => "001", others => '0'),
                    others => (others => '0')
    );
    
    -- Address to read from the ram
    signal R_ADDR_S: std_logic_vector(4 downto 0) := (others => '0');
begin
    START_FSM: process(clk_p)
        -- TEMPORARY VARIABLE TO STORE THE READ VALUE FROM THE RAM BLOCK
        variable temp_read_ram: std_logic_vector(66 downto 0);
        variable temp_read_ram2: std_logic_vector(66 downto 0);
        -- R3 Declaration as a variable 
        variable R3_V: std_logic_vector(31 downto 0);      
    begin
        if(rising_edge(clk_p)) then
            -- START READING THE RAM FROM ADDRESS 0
            temp_read_ram := ram_block(to_integer(unsigned(R_ADDR_S)));
            R_ADDR_S(4 downto 2) <= temp_read_ram(66 downto 64);
            R_ADDR_S(1 downto 0) <= (enable_p, write_p);
            
            -- UPDATE THE OUTPUTS
            if(R_ADDR_S = "00110") then
                -- READ THE PREVIOUS VALUE IN THAT ADDRESS
                temp_read_ram2 := ram_block(to_integer(unsigned(R_ADDR_S)));
                -- UPDATE THE OUTPUT VALUES INSIDE RAM
                ram_block(to_integer(unsigned(R_ADDR_S)))(66 downto 64) <= temp_read_ram2(66 downto 64);
                ram_block(to_integer(unsigned(R_ADDR_S)))(63 downto 32) <= r2_p;
                ram_block(to_integer(unsigned(R_ADDR_S)))(31 downto 0) <= r1_p;
                -- NO NEED TO UPDATE r2_p and r1_p
            elsif(R_ADDR_S = "00111") then
                -- PUT THE CURRENT VALUE OF R1 TO THE R3
                temp_read_ram2 := ram_block(to_integer(unsigned(R_ADDR_S)));
                -- SAVE R1 TO THE R3_V
                R3_V := temp_read_ram2(31 downto 0);
                
            elsif(R_ADDR_S = "01110" or R_ADDR_S = "01111") then
                -- READ THE PREVIOUS VALIE IN THOSE ADDRESSES
                temp_read_ram2 := ram_block(to_integer(unsigned(R_ADDR_S)));
                -- UPDATE THE OUTPUT VALUE OF R2 INSIDE RAM
                ram_block(to_integer(unsigned(R_ADDR_S)))(66 downto 64) <= temp_read_ram2(66 downto 64);
                ram_block(to_integer(unsigned(R_ADDR_S)))(63 downto 32) <= R3_V;
                ram_block(to_integer(unsigned(R_ADDR_S)))(31 downto 0) <= temp_read_ram2(31 downto 0);
                -- UPDATE THE OUTPUT VALUE OF r2_p
                r2_p <= R3_V;
           else
                -- NO CHANGE
                ram_block(to_integer(unsigned(R_ADDR_S))) <= ram_block(to_integer(unsigned(R_ADDR_S)));
           end if;
       end if;
   end process;       
end RTL;
