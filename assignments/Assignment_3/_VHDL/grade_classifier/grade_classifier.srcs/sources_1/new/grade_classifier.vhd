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
        gradeInput: gradeType;
        a, b, c, d: bit;
    )
end GradeClassifier;

architecture Behavioral of GradeClassifier is
begin
    a <= '1' when (gradeInput >= 51 and gradeInput < 60) else '0';
    b <= '1' when (gradeInput >= 61 and gradeInput < 70) else '0';
    c <= '1' when (gradeInput >= 71 and gradeInput < 85) else '0';
    d <= '1' when (gradeInput >= 86) else '0';
end Behavioral;
