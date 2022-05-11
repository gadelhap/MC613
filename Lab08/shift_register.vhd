library ieee;
use ieee.std_logic_1164.all;

entity shift_register is
generic (N : integer := 6);
port(
    clk     : in  std_logic;
    mode    : in  std_logic_vector(1 downto 0);
    ser_in  : in  std_logic;
    par_in  : in  std_logic_vector((N - 1) downto 0);
    par_out : out std_logic_vector((N - 1) downto 0)
  );
end shift_register;

architecture rtl of shift_register is
begin
  process
  begin
    wait until clk'event and clk = '1';
  
    if (mode = '00' OR ser_in = '0') AND NOT mode = '11' then  -- AND NOT está certo??;
      par_out <= par_in;
  
    elsif mode = '01' then
      for i in 1 to N-1 loop
        par_out(i) <= par_in(i-1);
      end loop;
      par_out(0) <= par_in(N-1);
        
    elsif mode = '10' then
      for i in 0 to N-2 loop
        par_out(i) <= par_in(i+1);
      end loop;
      par_out(N-1) <= par_in(0);
      
    elsif mode = '11' then
      par_out <=;  -- não sei o que fazer aqui (parelela sincrona);
      
    end if;
  end process;
end rtl;
