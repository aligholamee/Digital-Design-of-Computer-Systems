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
use IEEE.numeric_std.all;

entity DiskController is
    port(
        service_port_1: in integer range 0 to 128;
        service_request_1: inout std_logic;
        service_port_2: in integer range 0 to 128;
        service_request_2: inout std_logic;
        service_port_3: in integer range 0 to 128;
        service_request_3: inout std_logic;
        service_port_4: in integer range 0 to 128;
        service_request_4: inout std_logic;
        clk: in std_logic;
        rst: in std_logic;
        file_output: out std_logic_vector(31 downto 0)
    );
end DiskController;

architecture FSM of DiskController is
    -- DEFINITION OF THE STATE_TYPE
    type STATE_TYPE is (NO_SERVICE, S1_SERVICE, S2_SERVICE, S3_SERVICE, S4_SERVICE, RECOVERY);

    -- IMPLEMENTS THE WHOLE FSM USING 1 PROCESS 
    signal STATE: STATE_TYPE := NO_SERVICE;
    
    -- IMPLEMENTS THE SAFE FSM CREDINTIALS
    attribute safe_recovery_state: string;
    attribute safe_recovery_state of STATE: signal is "RECOVERY";

    -- IMPLEMENTS THE DIRECTION OF SERVICE(0: PORT1 TO PORT4)(1: PORT4 DOWNTO PORT0)
    signal SERVICE_DIRECTION: std_logic := '0';

    -- IMPLEMENTATION OF THE FILES
    type FILETYPE is array(127 downto 0) of std_logic_vector(31 downto 0);

    
    signal FILESERVER: FILETYPE;
begin
    O_P: process(clk)
         begin 
            if(rising_edge(clk)) then
                if(rst = '1') then
                    STATE <= NO_SERVICE;
                    file_output <= std_logic_vector(to_unsigned(0, 32));
                else 
                    case STATE is 
                        -- THIS IS THE STARTING POINT OBVIOUSLY
                        -- THEREFORE ALL OF THE REQUESTS WILL BE CHECKED AT FIRST
                        -- AND THE DIRECTION WILL BE CONFIGURED :)
                    when NO_SERVICE => 
                            if(service_request_1 = '1') then
                                STATE <= S1_SERVICE;
                                -- RESPONSES UPWARDS
                                SERVICE_DIRECTION <= '0';

                            elsif(service_request_2 = '1') then
                                STATE <= S2_SERVICE;
                                -- RESPONSES UPWARDS
                                SERVICE_DIRECTION <= '0';

                            elsif(service_request_3 = '1') then 
                                STATE <= S3_SERVICE;
                                -- RESPONSES DOWNWARDS
                                SERVICE_DIRECTION <= '1';

                            elsif(service_request_4 = '1') then
                                STATE <= S4_SERVICE;
                                -- RESPONSES DOWNWARDS
                                SERVICE_DIRECTION <= '1';

                            else
                                STATE <= NO_SERVICE;
                                
                            end if;

                        when S1_SERVICE => 
                            -- DOUBLE CHECK THE REQUEST FOR SECURITY REASONS(ROBUST IMPLEMENTATION AGAINST THE NOISE)
                            if(service_request_1 = '1') then
                                file_output <= FILESERVER(service_port_1); 
                                service_request_1 <= '0';
                            end if;
                            
                            if(SERVICE_DIRECTION = '0') then 
                                STATE <= S2_SERVICE;
                            else 
                                STATE <= NO_SERVICE;
                            end if;
                        
                        when S2_SERVICE => 
                            -- DOUBLE CHECK THE REQUEST FOR SECURITY REASONS(ROBUST IMPLEMENTATION AGAINST THE NOISE)
                            if(service_request_2 = '1') then
                                file_output <= FILESERVER(service_port_2);
                                service_request_2 <= '0';
                            end if;

                            if(SERVICE_DIRECTION = '0') then
                                STATE <= S3_SERVICE;
                            else
                                STATE <= S1_SERVICE;

                            end if;
                        
                        when S3_SERVICE => 
                            -- DOUBLE CHECK THE REQUEST FOR SECURITY REASONS(ROBUST IMPLEMENTATION AGAINST THE NOISE)
                            if(service_request_3 = '1') then
                                file_output <= FILESERVER(service_port_3);
                                service_request_3 <= '0';
                            end if;

                            if(SERVICE_DIRECTION = '0') then
                                STATE <= S4_SERVICE;
                            else
                                STATE <= S2_SERVICE;
                            end if;
                        
                        when S4_SERVICE =>
                            -- DOUBLE CHECK THE REQUEST FOR SECURITY REASONS(ROBUST IMPLEMENTATION AGAINST THE NOISE)
                            if(service_request_4 = '1') then
                                file_output <= FILESERVER(service_port_4);
                                service_request_4 <= '0';
                            end if;

                            if(SERVICE_DIRECTION = '0') then
                                STATE <= NO_SERVICE;
                            else
                                STATE <= S3_SERVICE;

                            
                            end if;

                        when RECOVERY =>
                                STATE <= NO_SERVICE;
                    end case;
                end if;
            end if;
         end process;
end FSM;
