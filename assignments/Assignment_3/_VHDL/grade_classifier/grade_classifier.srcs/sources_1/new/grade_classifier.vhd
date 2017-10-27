----------------------------------------------------------------------------------
-- Company: Amirkabir University of Technology
-- Engineer: Ali Gholami(aligholamee)
-- 
-- Create Date: 10/23/2017 08:36:00 PM
-- Design Name: 
-- Module Name: GradeClassifier - Behavioral
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
-- The purpose of this excercise is to understand the 
-- conventions in using the VHDL conditional concurrent assignments :)
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.common.all;

entity GradeClassifier is
    port(
        gradeInput: in gradeType;
        a, b, c, d: buffer bit;
        clk: in std_logic
    );
end GradeClassifier;

architecture RTL of GradeClassifier is
begin
    a <= '1' when (gradeInput >= 51 and gradeInput < 60 and rising_edge(clk));
    b <= '1' when (gradeInput >= 61 and gradeInput < 70 and rising_edge(clk));
    c <= '1' when (gradeInput >= 71 and gradeInput < 85 and rising_edge(clk));
    d <= '1' when (gradeInput >= 86 and rising_edge(clk));
end RTL;
