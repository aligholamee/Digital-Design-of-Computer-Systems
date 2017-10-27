----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/27/2017 06:41:00 PM
-- Design Name: 
-- Module Name: Thermostat - 
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

entity Thermostat is
    port(
        thershold_input: buffer integer;
        sensor_input: buffer integer;
        res: out boolean;
        clk: in std_logic;
        asyncReset: in std_logic
    );
end Thermostat;

architecture RTL of Thermostat is
    
begin
    process(clk, asyncReset)
    begin 
        if(asyncReset = '1') then
            -- Reset the thermostat simulator
            thershold_input <= 0;
            sensor_input <= 0;
            res <= false;
        elsif(rising_edge(clk)) then
            -- Implements the comparison logic
            if(sensor_input > (thershold_input + 5)) then
                res <= false;     -- Turn off the thermostat
            elsif(sensor_input < (thershold_input - 5)) then
                res <= true;     -- Turn on the thermostat
            end if;
        end if;
    end process;
end RTL;
