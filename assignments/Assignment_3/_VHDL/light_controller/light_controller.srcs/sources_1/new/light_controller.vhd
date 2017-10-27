----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/27/2017 11:21:32 AM
-- Design Name: 
-- Module Name: LightController - 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LightController is
    port(
        sensor_a: in unsigned(8 downto 0);
        sensor_b: in unsigned(8 downto 0);
        sensor_c: in unsigned(8 downto 0);
        sensor_d: in unsigned(8 downto 0);
        sens_avg: buffer unsigned(9 downto 0);
        lighting_power: out std_logic
    );
end LightController;

architecture RTL of LightController is

begin
    sens_avg <= '0' & (sensor_a + sensor_b + sensor_c + sensor_d);
    sens_avg <= shift_right(sens_avg, 2);
    lighting_power <= '1' when (sens_avg < "0001100100") else '0';
end RTL;

architecture Behavioral of LightController is 
    signal CLK, RST: std_logic;
begin 
    process(CLK, RST)
    begin
        if(CLK'event and CLK = '1') then
            if(RST = '1') then
                sens_avg <= "0000000000";
                lighting_power <= '0';
            else 
                sens_avg <= '0' & (sensor_a + sensor_b + sensor_c + sensor_d);
                if (sens_avg < "0001100100") then
                    lighting_power <= '1';
                else 
                    lighting_power <= '0';
                end if;
            end if;
        end if; 
    end process;
end Behavioral;
