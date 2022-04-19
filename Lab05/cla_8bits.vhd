-- brief : lab05 - question 2

library ieee;
use ieee.std_logic_1164.all;

entity cla_8bits is
  port(
    x    : in  std_logic_vector(7 downto 0);
    y    : in  std_logic_vector(7 downto 0);
    cin  : in  std_logic;
    sum  : out std_logic_vector(7 downto 0);
    cout : out std_logic
  );
end cla_8bits;

architecture rtl of cla_8bits is
  signal g: std_logic_vector(0 to 7);
  signal p: std_logic_vector(0 to 7);
  signal c: std_logic_vector(0 to 7);
begin
  for i in 0 to 7 generate:
    g(i) <= x(i) and y(i);
    p(i) <= x(i) or y(i);
  end generate;

  c(0) <= cin;
  c(1) <= g(0) or (p(0) and cin);
  c(2) <= g(1) or (p(1) and (g(0) or (p(0) and cin)));
  c(3) <= g(2) or (p(2) and (g(1) or (p(1) and (g(0) or (p(0) and cin)))));
  c(4) <= g(3) or (p(3) and (g(2) or (p(2) and (g(1) or (p(1) and (g(0) or (p(0) and cin)))))));
  c(5) <= g(4) or (p(4) and (g(3) or (p(3) and (g(2) or (p(2) and (g(1) or (p(1) and (g(0) or (p(0) and cin)))))))));
  c(6) <= g(5) or (p(5) and (g(4) or (p(4) and (g(3) or (p(3) and (g(2) or (p(2) and (g(1) or (p(1) and (g(0) or (p(0) and cin)))))))))));
  c(7) <= g(6) or (p(6) and (g(5) or (p(5) and (g(4) or (p(4) and (g(3) or (p(3) and (g(2) or (p(2) and (g(1) or (p(1) and (g(0) or (p(0) and cin)))))))))))));
  cout <= g(7) or (p(7) and (g(6) or (p(6) and (g(5) or (p(5) and (g(4) or (p(4) and (g(3) or (p(3) and (g(2) or (p(2) and (g(1) or (p(1) and (g(0) or (p(0) and cin)))))))))))))));

  for i in 0 to 7 generate:
    sum(i) <= x(i) xor y(i) xor c(i);
  end generate;
end rtl;
