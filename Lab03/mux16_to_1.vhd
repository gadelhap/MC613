library ieee;
use ieee.std_logic_1164.all;

entity mux16_to_1 is
  port(data : in std_logic_vector(15 downto 0);
       sel : in std_logic_vector(3 downto 0);
       output : out std_logic);
end mux16_to_1;

architecture rtl of mux16_to_1 is
  signal sel_aux1: std_logic_vector(0 to 1);
  signal sel_aux2: std_logic_vector(0 to 1);
  signal mux1_out: std_logic;
  signal mux2_out: std_logic;
  signal mux3_out: std_logic;
  signal mux4_out: std_logic;
  begin
    sel_aux1(0) <= sel(0);
    sel_aux1(1) <= sel(1);
    sel_aux2(0) <= sel(2);
    sel_aux2(1) <= sel(3);
    mux1: mux4_to_1
      port map(d3 => data(3), d2 => data(2), d1 => data(1), d0 => data(0),
                sel  => sel_aux1,
                output => mux1_out);
    mux2: mux4_to_1
      port map(d3 => data(7), d2 => data(6), d1 => data(5), d0 => data(4),
                sel  => sel_aux1,
                output => mux2_out);
    mux3: mux4_to_1
      port map(d3 => data(11), d2 => data(10), d1 => data(9), d0 => data(8),
                sel  => sel_aux1,
                output => mux3_out);
    mux4: mux4_to_1
      port map(d3 => data(15), d2 => data(14), d1 => data(13), d0 => data(12),
                sel  => sel_aux1,
                output => mux4_out);
    mux_final: mux4_to_1
      port map(d3 => mux4_out, d2 => mux3_out, d1 => mux2_out, d0 => mux1_out,
                sel  => sel_aux2,
                output => output);
  end rtl;