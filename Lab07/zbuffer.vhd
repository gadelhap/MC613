library ieee;
use ieee.std_logic_1164.all;

entity zbuffer is
	port (
		x : in std_logic_vector(3 downto 0);
		e : in std_logic;
		f : out std_logic_vector(3 downto 0)
	);
end zbuffer;

architecture rtl of zbuffer is
begin
	f <= (others => 'Z') when e = '0' else x;
end rtl;