-- brief : lab05 - question 2

library ieee;
use ieee.std_logic_1164.all;

entity cla_4bits is
  port(
    x    : in  std_logic_vector(3 downto 0);
    y    : in  std_logic_vector(3 downto 0);
    cin  : in  std_logic;
    sum  : out std_logic_vector(3 downto 0);
    cout : out std_logic
  );
end cla_4bits;

architecture rtl of cla_4bits is
  signal g: std_logic_vector(0 to 3);
  signal p: std_logic_vector(0 to 3);
  signal c: std_logic_vector(0 to 3);
begin
  for i in 0 to 3 generate:
    g(i) <= x(i) and y(i);
    p(i) <= x(i) or y(i);
  end generate;

  c(0) <= cin;
  c(1) <= g(0) or (p(0) and cin);
  c(2) <= g(1) or (p(1) and (g(0) or (p(0) and cin)));
  c(3) <= g(2) or (p(2) and (g(1) or (p(1) and (g(0) or (p(0) and cin)))));
  cout <= g(3) or (p(3) and (g(2) or (p(2) and (g(1) or (p(1) and (g(0) or (p(0) and cin)))))));

  for i in 0 to 3 generate:
    sum(i) <= x(i) xor y(i) xor c(i);
  end generate;
end rtl;

