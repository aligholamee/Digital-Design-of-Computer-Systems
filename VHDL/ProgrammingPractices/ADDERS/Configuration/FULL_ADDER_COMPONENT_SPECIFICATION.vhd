entity OR_GATE is
  port(
    A, B: in bit;
    RES: out bit
  );
end entity OR_GATE;

entity HALF_ADDER is
  port(
    A, B: in bit;
    SUM, CARRY: out bit
  );
end entity HALF_ADDER;

entity FULL_ADDER is
  port(
    A, B, CARRY_IN: in bit;
    SUM, CARRY_OUT: out bit
  );
end entity FULL_ADDER;

architecture STRUCT of FULL_ADDER is
  component HALF_ADDER
    port(
      A, B: in bit;
      SUM, CARRY: out bit
    );
  end component;

  component OR_GATE
    port(
      A, B: in bit;
      RES: out bit
    );
  end component;

  for MODULE_1: HA use entity work.HALF_ADDER(RTL);
  for MODULE_2: HA use entity work.HALF_ADDER(RTL);
  
  signal HA1_SUM, HA1_CARRY, HA2_CARRY: bit;
begin:
  MODULE_1: HA
  port map(A, B, HA1_SUM, HA1_CARRY);

  MODULE_2: HA
  port map(HA1_SUM, CARRY_IN, SUM, HA2_CARRY);

  MODULE_3: OR_GATE
  port map(HA2_CARRY, HA1_CARRY, CARRY);
end STRUCT;
