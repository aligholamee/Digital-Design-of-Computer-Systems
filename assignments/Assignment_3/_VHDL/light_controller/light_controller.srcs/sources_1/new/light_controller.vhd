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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LightController is
    port(
        sensor_a: in integer;
        sensor_b: in integer;
        sensor_c: in integer;
        sensor_d: in integer;
        sens_avg: buffer integer;
        lighting_power: out std_logic
    );
end LightController;

architecture  of LightControllerConcurrent is

begin


end LightControllerConcurrent;


architecture of LightControllerSequential is 

begin

end LightControllerSequential;
