library ieee;
use ieee.std_logic_1164.all;

entity ripple_carry_board is
  port (
    SW : in std_logic_vector(7 downto 0);
    HEX4 : out std_logic_vector(6 downto 0);
    HEX2 : out std_logic_vector(6 downto 0);
    HEX0 : out std_logic_vector(6 downto 0);
    LEDR : out std_logic_vector(0 downto 0)
    );
end ripple_carry_board;

architecture rtl of ripple_carry_board is
  signal r: std_logic_vector(0 to 4)
begin
  adder: entity work.ripple_carry
    generic map (N => 4)
    port map(x => SW(7..4), y => SW(3..0),
              r => r(1..4),
              cin => '0', cout => r(0),
              overflow => LEDR(0));
    
end rtl;
