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
        service_port_2: in integer range 0 to 128;
        service_port_3: in integer range 0 to 128;
        service_port_4: in integer range 0 to 128;
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
begin


end FSM;
