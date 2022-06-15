library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- celula de memoria de 128 (depth) x 8 (width)
entity ram_block is
	generic(
		depth : integer range 1 to 7 := 7; -- 128 (2 ** 7) Linhas
		width: integer range 1 to 8 := 8 -- 1 Linha = 8 bits
	);

	port (
		Clock : in std_logic;
		Address : in std_logic_vector(depth - 1 downto 0);
		Data : in std_logic_vector(width - 1 downto 0); -- Entrada para WRITE
		Q : out std_logic_vector(width -1 downto 0); -- Saida do READ
		WrEn : in std_logic
	);
end ram_block;

architecture direct of ram_block is
	type mem_type is array (0 to 2**depth-1) of std_logic_vector(width-1 downto 0);
	signal memdata : mem_type;
	
begin
	process(Clock)
		begin
			if Clock'event and Clock = '1' then
				if WrEn = '1' then
					memdata(to_integer(unsigned(Address))) <= Data;
				end if;
				Q <= memdata(to_integer(unsigned(Address)));
			end if;
		end process;

end direct;