LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY Processor;
USE Processor.Processor_pack.reg;

ENTITY bank IS

	GENERIC (
		wordsize : NATURAL := 32 -- Tamanho da palavra de dados
	);

	PORT (
		wr_en : IN STD_LOGIC; -- Permissao de escrita (ativo em nivel alto)
		rd_en : IN STD_LOGIC; -- Permissao de leitura (ativo em nivel alto)
		clear : IN STD_LOGIC; -- Limpar todos os registradores (ativo em nivel alto)
		clock : IN STD_LOGIC; -- Clock
		wr_addr : IN STD_LOGIC_VECTOR (4 DOWNTO 0); -- Registrador para escrita
		rd_addr1 : IN STD_LOGIC_VECTOR (4 DOWNTO 0); -- Registrador para leitura 1
		rd_addr2 : IN STD_LOGIC_VECTOR (4 DOWNTO 0); -- Registrador para leitura 2
		data_in : IN STD_LOGIC_VECTOR (WORDSIZE-1 DOWNTO 0); -- Entrada de dados
		data_out1 : OUT STD_LOGIC_VECTOR (WORDSIZE-1 DOWNTO 0); -- Saida de dados 1
		data_out2 : OUT STD_LOGIC_VECTOR (WORDSIZE-1 DOWNTO 0) -- Saida de dados 2
	);

END ENTITY;

ARCHITECTURE Behavior OF bank IS

	signal d2r: std_logic_vector(0 to 31);
	signal r2d1: std_logic_vector(0 to 31);
	signal r2d2: std_logic_vector(0 to 31);
	signal data_out_aux: std_logic_vector((wordsize * 31) - 1 downto 0);
	
begin

	-- Escolha do registrador a ser escrito:
	dec5x32_write: entity work.dec5_to_32
							port map(
								enable => '1',
								data_in => wr_addr,
								data_out => d2r
							);
	
	-- Escolha dos registradores a serem lidos:
	dec5x32_read1: entity work.dec5_to_32
							port map(
								enable => '1',
								data_in => rd_addr1,
								data_out => r2d1
							);
	
	dec5x32_read2: entity work.dec5_to_32
							port map(
								enable => '1',
								data_in => rd_addr2,
								data_out => r2d2
							);
	
	-- Registradores:
	-- Registrador r0:
	zbuffer_r0_1: entity work.zbuffer
						port map(
							x => (others => '0'),
							e => r2d1(0) and rd_en,
							f => data_out1
						);
						
	zbuffer_r0_2: entity work.zbuffer
						port map(
							x => (others => '0'),
							e => r2d2(0) and rd_en,
							f => data_out2
						);
	
	--Demais registradores:
	g: for i in 1 to 31 generate
		reg: entity work.reg
						port map(
							clock => clock,
							datain => data_in,
							dataout => data_out_aux(i * wordsize - 1 downto (i - 1) * wordsize),
							load => d2r(i) and wr_en,
							clear => clear
						);
  
		zbuffer1: entity work.zbuffer
						port map(
							x => data_out_aux(i * wordsize - 1 downto (i - 1) * wordsize),
							e => r2d1(i) and rd_en,
							f => data_out1
						);
						
		zbuffer2: entity work.zbuffer
						port map(
							x => data_out_aux(i * wordsize - 1 downto (i - 1) * wordsize),
							e => r2d2(i) and rd_en,
							f => data_out2
						);
	end generate;
END ARCHITECTURE;