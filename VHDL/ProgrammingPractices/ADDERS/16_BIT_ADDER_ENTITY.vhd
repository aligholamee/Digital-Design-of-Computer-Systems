entity ADDER is
  port(
    A, B: in integer range 15 downto 0;
    SUM: out integer range 15 downto 0;
    CARRY: out bit
  );
end entity ADDER;
