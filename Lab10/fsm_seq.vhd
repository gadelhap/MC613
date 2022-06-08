library ieee;
use ieee.std_logic_1164.all;

entity fsm_seq is
	port (	
		clock : in  std_logic;
      reset : in  std_logic;
      w     : in  std_logic;
      z     : out std_logic
	);
end fsm_seq;

architecture rtl of fsm_seq is
	type state_type is (A, B, C, D, E);
	
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
							state <= B;
						else
							state <= A;
						end if;
					
					when B => 
						if w = '0' then
							state <= B;
						else
							state <= C;
						end if;
					
					when C => 
						if w = '0' then
							state <= D;
						else
							state <= A;
						end if;
					
					when D => 
						if w = '0' then
							state <= B;
						else
							state <= E;
						end if;
					
					when E =>
						if w = '0' then
							state <= D;
						else
							state <= A;
						end if;
				end case;
			end if;
		end if;
	end process;
		z <= '1' when state = E else '0';
end rtl;