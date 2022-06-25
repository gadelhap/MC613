library ieee;
use ieee.std_logic_1164.all;

entity sigext16_to_32 is
	port (
	 	sigin : in std_logic_vector(15 downto 0);
    	sigout : out std_logic_vector(31 downto 0)
	);
end sigext16_to_32;

architecture rtl of sigext16_to_32 is
begin
	with sigin(15) select
		sigout <= 	"1111111111111111" & sigin when '1',
						"0000000000000000" & sigin when others;
end rtl;