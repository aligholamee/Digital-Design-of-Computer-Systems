
-- Coded with Visual Studio Code
-- Developer: Ali Gholami(aligholamee)


library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity ChoclateMachine is 
    port (
        dInput: in std_logic;
        pInput: in std_logic;
        rst: in std_logic;
        clk: in std_logic;
        chocolateOutput: out std_logic
    );
end ChoclateMachine;

architecture RTL of ChocolateMachine is 
    type STATE_TYPE is (START, P200, P400, FULL);
    signal current_state, next_state: STATE_TYPE;
begin

    -- CONTROLS THE FLIP-FLOPS
    FFs: process(clk)
    begin 
        if (rising_edge(clk)) then 
            -- RESET THE FFs
            if (rst = '1') then
                current_state <= START;
            -- GO ON TO THE NEXT STATE(THAT'S THE JOB OF THE FFs)
            else 
                current_state <= next_state;
            end if;
        end if;
    end process;
                
    -- CONTROLS THE FIRST COMBINATIONAL CIRCUIT
    -- NOTE THAT NONE OF THE COMBINATIONAL CIRCUITS WILL BE CONTROLED WITH CLOCK :D
    CC1: process(current_state, dInput, pInput)
    begin 
        case current_state is
            when START => 
                if((dInput,pInput) = '00')
                    next_state = START;
                elsif((dInput,pInput) = '01')
                    next_state = FULL;
                else 
                    next_state = P200;
                end if;
            when P200 => 
                if((dInput,pInput) = '00')
                    next_state = current_state;
                elsif((dInput,pInput) = '01') 
                    next_state = FULL;
                else 
                    next_state = P400;
                end if;
            when P400 =>
                if((dInput,pInput) = '00')
                    next_state = current_state;
                else((dInput,pInput) = '01')
                    next_state = FULL;
                end if;
            when FULL =>
                next_state = current_state;
        end case;
    end process;

    -- CONTROLS THE FINAL COMBINATIONAL CIRCUIT
    -- GENERATES THE OUTPUTS BASED ON THE CURRENT STATE AND INPUTS
    CC2: process(current_state, dInput, pInput)
            variable DP := (dInput, pInput);
    begin
        case current_state is 
            when START => 
                if pInput = '0' then 
                    chocolateOutput <= '0';
                else 
                    chocolateOutput <= '1';
                end if;
            when P200 => 
                if pInput = '0' then 
                    chocolateOutput <= '0';
                else 
                    chocolateOutput <= '1';
                end if;
            when P400 => 
                if DP = "00" or DP = "11" then 
                    chocolateOutput <= '0';
                else 
                    chocolateOutput <= '1';
            when FULL => 
                chocolateOutput <= '0';
        end case;
    end process;
end architecture ChocolateMachine;
         
    