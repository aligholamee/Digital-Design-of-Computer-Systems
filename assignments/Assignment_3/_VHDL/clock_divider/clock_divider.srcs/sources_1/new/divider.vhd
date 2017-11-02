----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/02/2017 09:59:34 AM
-- Design Name: 
-- Module Name: ClockDivider - Behavioral
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

entity ClockDivider is
    port(
        inputClock: buffer std_logic;
        outputClock: buffer std_logic;
        clkFreq: in integer;            -- Clock frequency input should be in Hertz.
        enable: buffer std_ulogic;
        asyncReset: buffer std_logic
    );
end ClockDivider;

architecture Behavioral of ClockDivider is
    signal temporal: std_logic;
    signal counter_case1 : integer range 0 to 124999 := 0; 
    signal counter_case2 : integer range 0 to 5000 := 0;  
    
    function caclculateCounter (
        frequency: in integer;)
        return integer is
        countsToBuildHalfFreq: integer;
    begin
        variable temp: integer := 0;
        temp := 1 / frequency;
        countsToBuildHalfFreq := temp/2;
    end;
begin
    process(asyncReset, inputClock)
    begin 
        if(asyncReset = '1') then
            temporal <= '0';
            enable <= '0';
            asyncReset <= '0';
        elsif(enable = '1' and rising_edge(inputClock)) then
            if(counter_case1 = caclculateCounter(clkFreq)) then
                temporal <= not(temporal);
                counter_case1 <= 0;
            else
                counter_case1 <= counter_case1 + 1;
            end if;
        elsif(enable = '0' and rising_edge(inputClock)) then 
            if(counter_case2 = caclculateCounter(clkFreq) then
                temporal <= not(temporal);
                counter_case2 <= 0;
            else 
                counter_case2 = counter_case2 + 1;
            end if;
        end if;
    end process;
    -- Concurrently assign temporal to clockOut
    clockOut <= temporal;
end Behavioral;
