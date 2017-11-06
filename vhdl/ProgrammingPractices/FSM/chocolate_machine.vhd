
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
                if((d,p) = '00')
                    next_state = START;
                elsif((d,p) = '01')
                    next_state = FULL;
                else 
                    next_state = P200;
                end if;
            when P200 => 
                if((d,p) = '00')
                    next_state = current_state;
                elsif((d,p) = '01') 
                    next_state = FULL;
                else 
                    next_state = P400;
                end if;
            when P400 =>
                if((d,p) = '00')
                    next_state = current_state;
                else((d,p) = '01')
                    next_state = FULL;
                end if;
            when FULL =>
                next_state = current_state;
        end case;
    end process;

                