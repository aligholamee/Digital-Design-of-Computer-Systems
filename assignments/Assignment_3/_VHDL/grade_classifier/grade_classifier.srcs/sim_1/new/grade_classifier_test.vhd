----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/23/2017 11:25:00 PM
-- Design Name: 
-- Module Name: GCTestBench - Gate
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
use work.common.all;

entity GCTestBench is

end GCTestBench;

architecture Gate of GCTestBench is
    component GradeClassifier is 
    port(
        gradeInput: in gradeType;
        a, b, c, d: out bit
    );
    end component GradeClassifier;

    signal D_OUTPUT: bit;
    signal C_OUTPUT: bit;
    signal B_OUTPUT: bit;
    signal A_OUTPUT: bit;
    signal GradeInput: gradeType;

begin
    GC1: GradeClassifier port map(GradeInput, A_OUTPUT, B_OUTPUT, C_OUTPUT, D_OUTPUT);

    process
        begin
            GradeInput <= 10;
            wait for 500 ns;
            GradeInput <= 20; 
            wait for 500 ns;
            GradeInput <= 50;
            wait for 500 ns;
            GradeInput <= 60;
            wait for 500 ns;
            GradeInput <= 70;
            wait for 500 ns;
            GradeInput <= 85;
            wait for 500 ns;
            GradeInput <= 95;
            wait;
        end process;
end Gate;
