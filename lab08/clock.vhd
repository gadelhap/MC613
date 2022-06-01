library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all; -- posso usar essa library?

entity clock is
  port (
    clk : in std_logic;
    decimal : in std_logic_vector(3 downto 0);
    unity : in std_logic_vector(3 downto 0);
    set_hour : in std_logic;
    set_minute : in std_logic;
    set_second : in std_logic;
    hour_dec, hour_un : out std_logic_vector(6 downto 0);
    min_dec, min_un : out std_logic_vector(6 downto 0);
    sec_dec, sec_un : out std_logic_vector(6 downto 0)
  );
end clock;

architecture rtl of clock is
	signal clk_hz : std_logic;
	signal hour_dec_sig : std_logic_vector(3 downto 0);
	signal hour_un_sig : std_logic_vector(3 downto 0);
	signal min_dec_sig : std_logic_vector(3 downto 0);
	signal min_un_sig : std_logic_vector(3 downto 0);
	signal sec_dec_sig : std_logic_vector(3 downto 0);
	signal sec_un_sig : std_logic_vector(3 downto 0);	
	
	component clk_div is
		port (
			clk : in std_logic;
			clk_hz : out std_logic
		);
	end component;
  
	component bin2dec is
		port (
			bin: in std_logic_vector(3 downto 0);
			dec: out std_logic_vector(6 downto 0)
		);
	end component;
  
begin
	clock_divider : clk_div port map (clk, clk_hz);
	hour2dec_dec : bin2dec port map ( hour_dec_sig, hour_dec);
	hour2dec_un : bin2dec port map ( hour_un_sig, hour_un);
	min2dec_dec : bin2dec port map ( min_dec_sig, min_dec);
	min2dec_un : bin2dec port map ( min_un_sig, min_un);
	sec2dec_dec : bin2dec port map ( sec_dec_sig, sec_dec);
	sec2dec_un : bin2dec port map ( sec_un_sig, sec_un);
  
	process (clk)
		variable  hour_dec_aux: std_logic_vector(3 downto 0) := "0000";
		variable  hour_un_aux: std_logic_vector(3 downto 0) := "0000";
		variable  min_dec_aux: std_logic_vector(3 downto 0) := "0000";
		variable  min_un_aux: std_logic_vector(3 downto 0) := "0000";
		variable  sec_dec_aux: std_logic_vector(3 downto 0) := "0000";
		variable  sec_un_aux: std_logic_vector(3 downto 0) := "0000";
	begin
		if (clk'event and clk = '1') then
		-- SET
		if set_hour =  '1' then
			if (decimal <= "0001" and unity <= "1001") or (decimal = "0010" and unity <= "0011") then
				hour_dec_aux := decimal;
				hour_un_aux := unity;
			end if;
		end if;
		
		if set_minute =  '1' then
			if (decimal <= "0101" and unity <= "1001") then
				min_dec_aux := decimal;
				min_un_aux := unity;
			end if;
		end if;
		
		if set_second =  '1' then
			if (decimal <= "0101" and unity <= "1001") then
				sec_dec_aux := decimal;
				sec_un_aux := unity;
			end if;
		end if;
		
		-- CLOCK
		if (clk_hz = '1') then
			-- SOMA SEGUNDO 
			if sec_un_aux <= "1000" then
				sec_un_aux := sec_un_aux + 1;
			else
				sec_un_aux := "0000";
				if sec_dec_aux <= "0100" then
					sec_dec_aux := sec_dec_aux + 1;
				else
					sec_dec_aux := "0000";
					-- SOMA MINUTO
					if min_un_aux <= "1000" then
						min_un_aux := min_un_aux + 1;
					else
						min_un_aux := "0000";
						if min_dec_aux <= "0100" then
							min_dec_aux := min_dec_aux + 1;
						else
							min_dec_aux := "0000";
							-- SOMA HORA
							if hour_un_aux <= "1000" then
								if hour_dec_aux = "0010" and hour_un_aux = "0011" then
									hour_dec_aux := "0000";
									hour_un_aux := "0000";
								else
									hour_un_aux := hour_un_aux + 1;
								end if;
							else
								hour_un_aux := "0000";
								hour_dec_aux := hour_dec_aux + 1;
							end if;
						end if;
					end if;
				end if;
			end if;
		end if;
		end if;
		hour_dec_sig <= hour_dec_aux;
		hour_un_sig <= hour_un_aux;
		min_dec_sig <= min_dec_aux;
		min_un_sig <= min_un_aux;
		sec_dec_sig <= sec_dec_aux;
		sec_un_sig <= sec_un_aux;
	end process;
end rtl;