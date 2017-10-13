----------------------------------------------------------------------------------
-- Company: Amirkabir University of Technology
-- Engineer: Ali Gholami (aligholamee)
--
-- Create Date: 10/12/2017 05:18:15 PM
-- Design Name:
-- Module Name: BCD_ADDER - Structural
-- Project Name:
-- Target Devices:
-- Tool Versions:
-- Description: A BCD adder ( Data type + Structural representation)
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
use work.orGate;
use work.andGate;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
entity BCD_ADDER is
    port(
        input_1: in bcd_number;       -- The input will be a number of 3 digit BCD
        input_2: in bcd_number;       -- The input will be a number of 3 digit BCD
        bcd_output: out bcd_number;   -- The output will be a number of 3 digit BCD
        carry_out: out bcd_number;
        carry_in: in bcd_number);
end entity BCD_ADDER;

architecture Structural of BCD_ADDER is
    -- Using 3 4 bit full adders
  component FOUR_BIT_FA is
    port(
      A: in std_logic_vector (3 downto 0);
      B: in std_logic_vector (3 downto 0);
      Carry_in: in std_logic;
      Carry_out: out std_logic;
      Sum: out std_logic_vector (3 downto 0)
    );
  end component;
  component andGate is
    port(
      A: in std_logic;
      B: in std_logic;
      res: out std_logic
    );
  end component;

  component orGate is
    port(
      A: in std_logic;
      B: in std_logic;
      res: out std_logic
    );
  end component;
begin
  -------------------------------------------
  -- First digit calculator
  MODULE1: FOUR_BIT_FA
  port map(
  
  );

  MODULE2: andGate
  port map(

  );

  MODULE3: andGate
  port map(

  );

  MODULE4: orGate
  port map(

  );

  -------------------------------------------
  -- Second digit calculator
  MODULE5: FOUR_BIT_FA
  port map(

  );

  MODULE6: andGate
  port map(

  );

  MODULE7: andGate
  port map(

  );

  MODULE8: orGate
  port map(

  );
  -------------------------------------------
  -- Third digit calculator
  MODULE9: FOUR_BIT_FA
  port map(

  );

  MODULE10: andGate
  port map(

  );

  MODULE11: andGate
  port map(

  );

  MODULE12: orGate
  port map(

  );
  -------------------------------------------
end Structural;
