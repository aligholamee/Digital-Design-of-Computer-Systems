----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/27/2017 06:43:08 PM
-- Design Name: 
-- Module Name: PatternVerifier - Behavioral
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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PatternVerifier is
    Port (
    input: in std_logic_vector(0 to 19);
    output: out std_logic_vector(1 downto 0);
    clk, rst: in std_logic
    );
end PatternVerifier;

architecture Behavioral of PatternVerifier is
 
    type STATE_TYPE is (
        START1, G, GG, GGG, GGGG, GGGGG, GGGGGA, GGGGGAC, GGGGGACT, GGGGGACTC, GGGGGACTCT, GGGGGACTCTC, GGGGGACTCTCT, GGGGGACTCTCTC, 
        START2, A, AA, AAG, AAGT, AAC
    );
    signal stateU, stateV: STATE_TYPE;
    
    signal sample: string(1 to 10);
    signal counter, counterV: integer := 1;
    signal flag :std_logic:= '0';
    signal u_founded, v_founded: std_logic := '0';

begin

    detectString : process( input )
    begin
        identifier : for i in 0 to input'high loop
            if (i mod 2 = 1) then
                if input(i-1) = '0' then
                    if input(i) = '0' then
                        sample(i/2 + 1) <=  'A';
                    elsif(input(i) = '1') then
                        sample(i/2 + 1) <= 'C';
                    end if;
                elsif(input(i-1) = '1') then
                    if input(i) = '0' then
                        sample(i/2 + 1) <= 'T';
                    elsif(input(i) = '1') then
                        sample(i/2 + 1) <= 'G';
                    end if;
                end if; 
            end if;
        end loop ;
        flag <= '1';
    end process ;


    changeStates : process( clk, rst )
    begin
        if(rising_edge(clk) and flag = '1') then
            if(rst = '1') then
                stateU <= START1;
            else
                case( stateU ) is
                    when START1 =>
                        if sample(counter) = 'G' then
                            stateU <= G;
                        else 
                            stateU <= START1;
                        end if ;
                        
                    when G =>
                        if sample(counter) = 'G' then
                            stateU <= GG;
                        else 
                            stateU <= START1;
                        end if ;
                    when GG =>
                        if sample(counter) = 'G' then
                            stateU <= GGG;
                        else 
                            stateU <= START1;
                        end if ;
                    when GGG =>
                        if sample(counter) = 'G' then
                            stateU <= GGGG;
                        else 
                            stateU <= START1;
                        end if ;
                    when GGGG =>
                        if sample(counter) = 'G' then
                            stateU <= GGGGG;
                        else 
                            stateU <= START1;
                        end if ;
                    when GGGGG =>
                        if sample(counter) = 'A' then
                            stateU <= GGGGGA;
                        else 
                            stateU <= START1;
                        end if ;
                    when GGGGGA =>
                        if sample(counter) = 'A' then
                            stateU <= GGGGGA;
                        elsif sample(counter) = 'C' then
                            stateU <= GGGGGAC;
                        else 
                            stateU <= START1;
                        end if ;
                    when GGGGGAC =>
                        if sample(counter) = 'T' then
                            stateU <= GGGGGACT;
                        else 
                            stateU <= START1;
                        end if ;
                    when GGGGGACT =>
                        if sample(counter) = 'C' then
                            stateU <= GGGGGACTC;
                        else 
                            stateU <= START1;
                        end if ;
                    when GGGGGACTC =>
                        if sample(counter) = 'T' then
                            stateU <= GGGGGACTCT;
                        else 
                            stateU <= START1;
                        end if ;
                    when GGGGGACTCT =>
                        if sample(counter) = 'C' then
                            stateU <= GGGGGACTCTC;
                        else 
                            stateU <= START1;
                        end if ;
                    when GGGGGACTCTC =>
                        if sample(counter) = 'T' then
                            stateU <= GGGGGACTCTCT;
                        else 
                            stateU <= START1;
                        end if ;
                    when GGGGGACTCTCT =>
                        if sample(counter) = 'C' then
                            stateU <= GGGGGACTCTCTC;
                        else 
                            stateU <= START1;
                        end if ;
                    when GGGGGACTCTCTC =>
                        stateU <= START1;
                        u_founded <= '1';
                    when others =>
                        stateU <= START1;
                
                end case ;
            end if;
            counter <= counter + 1;
        end if;

    end process ; 

    updateWithNewStates : process( clk, rst )
    begin
        if(rising_edge(clk)) then
            if(rst = '1') then
                stateV <= START2;
            else
                case( stateV ) is
                    when START2 =>
                        if sample(counterV) = 'A' then
                            stateV <= A;
                        else 
                            stateV <= START2;
                        end if ;
                        
                    when A =>
                        if sample(counterV) = 'A' then
                            stateV <= AA;
                        else 
                            stateV <= START2;
                        end if ;
                    when AA =>
                        if sample(counterV) = 'C' then
                            stateV <= AAC;
                        elsif sample(counterV) = 'G' then
                            stateV <= AAG;
                        else 
                            stateV <= START2;
                        end if ;
                    when AAG =>
                        if sample(counterV) = 'T' then
                            stateV <= AAGT;
                        else 
                            stateV <= START2;
                        end if ;
                    when AAGT =>
                        if sample(counterV) = 'G' then
                            stateV <= AAG;
                        else 
                            stateV <= START2;
                        end if ;
                    when AAC =>
                        stateV <= START2;
                        v_founded <= '1';
                    when others =>
                        stateV <= START2;
                
                end case ;
            end if;
            counterV <= counterV + 1;
        end if;

    end process ;

    outputGenerator : process( clk )
    begin
        if v_founded = '1' then
            output(1) <= '1';
        else
            output(1) <= '0';
        end if ;
        if u_founded = '1' then
            output(0) <= '1';
        else
            output(0) <= '0';
        end if ;
    end process ;

end Behavioral;
