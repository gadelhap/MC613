library ieee;
use ieee.std_logic_1164.all;

entity ram is
  port (
    Clock : in std_logic;
    Address : in std_logic_vector(9 downto 0);
    DataIn : in std_logic_vector(31 downto 0);
    DataOut : out std_logic_vector(31 downto 0);
    WrEn : in std_logic
  );
end ram;

architecture rtl of ram is
	signal DataOut0 : std_logic_vector(7 downto 0);
	signal DataOut1 : std_logic_vector(7 downto 0);
	signal DataOut2 : std_logic_vector(7 downto 0);
	signal DataOut3 : std_logic_vector(7 downto 0);
	signal DataOut4 : std_logic_vector(7 downto 0);
	signal DataOut5 : std_logic_vector(7 downto 0);
	signal DataOut6 : std_logic_vector(7 downto 0);
	signal DataOut7 : std_logic_vector(7 downto 0);
	signal DataOutBlock1 : std_logic_vector(31 downto 0);
	signal DataOutBlock2 : std_logic_vector(31 downto 0);
	signal WrEnBlock1 : std_logic;
	signal WrEnBlock2 : std_logic;

	component ram_block is
		port (
			Clock : in std_logic;
			Address : in std_logic_vector(6 downto 0);
			Data : in std_logic_vector(7 downto 0); -- Entrada para WRITE
			Q : out std_logic_vector(7 downto 0); -- Saida do READ
			WrEn : in std_logic
		);
	end component;

begin
	WrEnBlock1 <= (not Address(7) and WrEn);
	WrEnBlock2 <= (Address(7) and WrEn);
	memblock0 : ram_block port map (Clock, Address(6 downto 0), DataIn(31 downto 24), DataOut0, WrEnBlock1);
	memblock1 : ram_block port map (Clock, Address(6 downto 0), DataIn(23 downto 16), DataOut1, WrEnBlock1);
	memblock2 : ram_block port map (Clock, Address(6 downto 0), DataIn(15 downto 8), DataOut2, WrEnBlock1);
	memblock3 : ram_block port map (Clock, Address(6 downto 0), DataIn(7 downto 0), DataOut3, WrEnBlock1);
	
	memblock4 : ram_block port map (Clock, Address(6 downto 0), DataIn(31 downto 24), DataOut4, WrEnBlock2);
	memblock5 : ram_block port map (Clock, Address(6 downto 0), DataIn(23 downto 16), DataOut5, WrEnBlock2);
	memblock6 : ram_block port map (Clock, Address(6 downto 0), DataIn(15 downto 8), DataOut6, WrEnBlock2);
	memblock7 : ram_block port map (Clock, Address(6 downto 0), DataIn(7 downto 0), DataOut7, WrEnBlock2);
	
	DataOutBlock1 <= DataOut0 & DataOut1 & DataOut2 & DataOut3;
	DataOutBlock2 <= DataOut4 & DataOut5 & DataOut6 & DataOut7;
	
	process (Address, DataOutBlock1, DataOutBlock2)
	begin
		if Address(9) = '1' or Address(8) = '1' then
			DataOut <= (others => 'Z');
		else
			if Address(7) = '0' then
			-- primeiro bloco de memoria
				DataOut <= DataOutBlock1;
				
			else
			-- segundo bloco de memoria
				DataOut <= DataOutBlock2;

			end if;
		end if;
	end process;
end rtl;