----------------------------------------------------------------------------------
-- Company: Amirkabir University of Technology
-- Engineer: Ali Gholami(aligholamee)
-- 
-- Create Date: 11/08/2017 08:43:37 PM
-- Design Name: 
-- Module Name: DiskController - FSM
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

entity DiskController is
    port(
        service_port_1: in integer range 0 to 128;
        service_request_1: in std_logic;
        service_port_2: in integer range 0 to 128;
        service_request_2: in std_logic;
        service_port_3: in integer range 0 to 128;
        service_request_3: in std_logic;
        service_port_4: in integer range 0 to 128;
        service_request_4: in std_logic;
        clk: in std_logic;
        rst: in std_logic;
        file_output: out std_logic_vector(31 downto 0)
    );
end DiskController;

architecture FSM of DiskController is
    -- DEFINITION OF THE STATE_TYPE
    type STATE_TYPE is (START, P1_SERVICE, P2_SERVICE, P3_SERVICE, P4_SERVICE);

    -- IMPLEMENTS THE SAFE FSM CREDINTIALS
    attribute safe_recovery_state: string;
    attribute safe_recovery_state of STATE: signal is "RECOVERY";

    -- IMPLEMENTS THE WHOLE FSM USING 1 PROCESS 
    signal STATE: STATE_TYPE := START;

    -- IMPLEMENTS THE DIRECTION OF SERVICE(0: PORT1 TO PORT4)(1: PORT4 DOWNTO PORT0)
    signal SERVICE_DIRECTION: std_logic := '0';

    -- IMPLEMENTATION OF THE FILES
    type FILE_CONTENT is array(31 downto 0) of bit;
    type FILE is array(127 downto 0) of FILE_CONTENT;

    signal FILESERVER: FILE;
begin
    O_P: process(clk)
         begin 
            if(rising_edge(clk)) then
                if(rst = '1') then
                    STATE <= START;
                    file_output <= std_logic_vector(to_unsigned(0, 32));
                else 
                    case STATE is 
                        when START => 
                            if(SERVICE_DIRECTION = '0') then 
                                if(service_request_1 = '1') then
                                    STATE <= P1_SERVICE;
                                    file
         end process;

end FSM;
