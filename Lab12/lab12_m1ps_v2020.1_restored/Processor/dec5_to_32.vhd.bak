library ieee;
use ieee.std_logic_1164.all;

entity dec3_to_8 is
	port (
    	enable : in std_logic;
    	data_in : in std_logic_vector(2 downto 0);
    	data_out : out std_logic_vector(0 to 7)
	);
end dec3_to_8;

architecture rtl of dec3_to_8 is
	signal aux : std_logic_vector(3 downto 0);
begin
	aux <= enable & data_in;
	with aux select
		data_out <= "10000000" when "1000",
						"01000000" when "1001",
						"00100000" when "1010",
						"00010000" when "1011",
						"00001000" when "1100",
						"00000100" when "1101",
						"00000010" when "1110",
						"00000001" when "1111",
						"00000000" when others;
end rtl;