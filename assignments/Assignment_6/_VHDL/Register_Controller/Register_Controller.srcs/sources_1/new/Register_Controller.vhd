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
        type ram_block is array (31 downto 0) of ram_word;
        
        -- Address to read from the ram
        signal R_ADDR_S: std_logic_vector(4 downto 0) := "00000";
        
    begin
        RAM_LOAD: process(clk)
        begin 
            -- We're gonna load the 32 words of this ram with clock first
            -- Outputs are being updated in the runtime :D
            if(rising_edge(clk)) then
                if(ram_rw = '1') then
                    -- STATE 0 DESCRIPTION
                    ram_block(0) <= ("000", std_logic_vector(to_unsigned(0, 32)), std_logic_vector(to_unsgined(0, 32)));
                    ram_block(1) <= ("000", std_logic_vector(to_unsigned(0, 32)), std_logic_vector(to_unsigned(0, 32)));
                    ram_block(2) <= ("001", std_logic_vector(to_unsigned(0, 32)), std_logic_vector(to_unsigned(0, 32)));
                    ram_block(3) <= ("001", std_logic_vector(to_unsigned(0, 32)), std_logic_vector(to_unsigned(0, 32)));
                    
                    -- STATE 1 DESCRIPTION
                    ram_block(4) <= (66 downto 64) => "001";
                    ram_block(5) <= (66 downto 64) => "001";
                    ram_block(6) <= ("001", r2_p, r1_p);
                    ram_block(7) <= (66 downto 64) => "010";
                    
                    -- STATE 2 DESCRIPTION
                    ram_block(8) <= (66 downto 64) => "010";
                    ram_block(9) <= (66 downto 64) => "010";
                    ram_block(10) <= (66 downto 64) => "011";
                    ram_block(11) <= (66 downto 64) => "011";
                    
                    -- STATE 3 DESCRIPTION
                    ram_block(12) <= (66 downto 64) => "011";
                    ram_block(13) <= (66 downto 64) => "011";
                    ram_block(14) <= (66 downto 64) => "100";
                    ram_block(15) <= (66 downto 64) => "100";
                    
                    -- STATE 4 DESCRIPTION
                    ram_block(16) <= (66 downto 64) => "100";
                    ram_block(17) <= (66 downto 64) => "100";
                    ram_block(18) <= (66 downto 64) => "001";
                    ram_block(19) <= (66 downto 64) => "001";
                    ram_block(31 downto 20) <= std_logic_vector(to_unsigned(0, 67));
                end if;
            end if;
        end process;
        
        START_FSM: process(clk)
            -- TEMPORARY VARIABLE TO STORE THE READ VALUE FROM THE RAM BLOCK
            variable temp_read_ram: std_logic_vector(66 downto 0);
            variable temp_read_ram2: std_logic_vector(66 downto 0);
            -- R3 Declaration as a variable 
            variable R3_V: std_logic_vector(31 downto 0);
        begin 
            if(rising_edge(clk)) then
                if(ram_rw = '0') then
                    -- START READING THE RAM FROM ADDRESS 0
                    temp_read_ram := ram_block(to_integer(unsigned(R_ADDR_S)));
                    R_ADDR_S(4 downto 2) <= temp_read_ram(66 downto 64);
                    R_ADDR_S(1 downto 0) <= (enable_p, write_p);
                    
                    -- UPDATE THE OUTPUTS
                    if(R_ADDR_S = "00110") then
                        -- READ THE PREVIOUS VALUE IN THAT ADDRESS
                        temp_read_ram2 <= ram_block(R_ADDR_S);
                        -- UPDATE THE OUTPUT VALUES INSIDE RAM
                        ram_block(R_ADDR_S) <= (temp_read_ram2(66 downto 64), r2_p, r1_p);
                        -- NO NEED TO UPDATE r2_p and r1_p
                    elsif(R_ADDR_S = "00111") then
                        -- PUT THE CURRENT VALUE OF R1 TO THE R3
                        temp_read_ram2 <= ram_block(R_ADDR_S);
                        -- SAVE R1 TO THE R3_V
                        R3_V := temp_read_ram2(31 downto 0);
                        
                    elsif(R_ADDR_S = "01110" or R_ADDR_S = "01111") then
                        -- READ THE PREVIOUS VALIE IN THOSE ADDRESSES
                        temp_read_ram2 <= ram_block(R_ADDR_S);
                        -- UPDATE THE OUTPUT VALUE OF R2 INSIDE RAM
                        ram_block(R_ADDR_S) <= (temp_read_ram2(66 downto 64), R3_V, temp_read_ram2(31 downto 0)); 
                        -- UPDATE THE OUTPUT VALUE OF r2_p
                        r2_p <= R3_V;
                   else
                   else
                        -- NO CHANGE
                        ram_block(R_ADDR_S) <= ram_block(R_ADDR_S);
                   end if;
               end if;
           end if;
       end process;       
    end RTL;
