entity FOUR_BIT_ADDER is
  port(
    A, B: in bit_vector(3 downto 0);
    CIN: in bit;
    SUM: out bit_vector(3 downto 0);
    COUT: out bit
  );
end entity FOUR_BIT_ADDER;

architecture STRUCT_FA of FOUR_BIT_ADDER is
  component FULL_ADDER port (
    A, B, CIN: in bit;
    SUM, COUT: out bit
  );
  end component;

  signal C: bit_vector (3 downto 1);

  F: for I in 2 downto 1 generate:
      F_IF0: if I=1 generate:
        L0: FULL_ADDER port map(
          A => A[0],
          B => B[0],
          CIN => CIN,
          SUM => SUM[0],
          COUT => C[1]
        );
      end generate F_IF0;

      F_IF3: if I=3 generate:
        L3: FUL_ADDER port map(
          A => A[3],
          B => B[3],
          CIN => C[3],
          SUM => SUM[3],
          COUT => COUT
        );
      end generate F_IF3;
      
      FAS: FULL_ADDER port map(
        A => A[i],
        B => B[i],
        CIN => C[i],
        SUM => SUM[i],
        COUT => C[i+1]
      )
    end generate F;

end architecture STRUCT_FA;
