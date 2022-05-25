-- 10111110101111000001111111 = 49999999

library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

entity clk_div is
  port (
    clk : in std_logic;
    clk_hz : out std_logic
  );
end clk_div;

architecture behavioral of clk_div is
begin
	process (clk)
		variable count : std_logic_vector(25 downto 0) := "00000000000000000000000000";
	begin
		if (clk'event and clk = '1') then
			if count = "10111110101111000001111111" then
				clk_hz <= '1';
				count := "00000000000000000000000000";
			else
				clk_hz <= '0';
				count := count + 1;
			end if;
		end if;
	end process;
end behavioral;
