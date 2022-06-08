library ieee;
use ieee.std_logic_1164.all;

entity fsm_table is
	port (	
		clock : in  std_logic;
      reset : in  std_logic;
      w     : in  std_logic;
      z     : out std_logic
	);
end fsm_table;

architecture rtl of fsm_table is
	type state_type is (A, B, C, D);
	
	signal state : state_type;
begin
	process (clock)
	begin
		if (clock'event and clock = '1') then
			-- subida do clock
			if  reset = '1' then
				state <= A;
			else
				-- logica de mudanca de estado
				case state is
					when A => 
						if w = '0' then
							state <= C;
							z <= '1';
						else
							state <= B;
							z <= '1';
						end if;
					
					when B => 
						if w = '0' then
							state <= D;
							z <= '1';
						else
							state <= C;
							z <= '0';
						end if;
					
					when C => 
						if w = '0' then
							state <= B;
							z <= '0';
						else
							state <= C;
							z <= '0';
						end if;
					
					when D => 
						if w = '0' then
							state <= A;
							z <= '0';
						else
							state <= C;
							z <= '1';
						end if;
				end case;
			end if;
		end if;
	end process;
end rtl;