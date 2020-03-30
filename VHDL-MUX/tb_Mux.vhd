-- Test Bench for Counter.
library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;



entity tb_MUX is
end tb_MUX;

architecture rtl of tb_MUX is  

component MUX
	PORT (x1, x2, y: IN std_logic;
			z: OUT std_logic);
end component;
signal  x1, x2, y, z: std_logic;
begin
        tester : MUX port map(
			x1=>x1,x2=>x2,y=>y,z=>z
		);
        
        testbench : process
        begin
          --------- start of stimulus section - ver1 ------------------
          x1 <='0';
		  x2 <='1';
		  y <='0', '1' after 200 ns;
          --------- end of stimulus section----------------------------
		  wait;
        end process testbench;
        
end rtl;
