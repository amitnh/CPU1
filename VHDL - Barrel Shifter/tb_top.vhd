-- Test Bench for Counter.
library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
USE work.aux_package.all;


entity tb_top is
  GENERIC (n : INTEGER := 8);
end tb_top;

architecture rtl of tb_top is  
signal  X,Y:STD_LOGIC_VECTOR (n-1 DOWNTO 0);
signal	cin :STD_LOGIC;
signal	sel :STD_LOGIC_VECTOR (1 DOWNTO 0);
signal result:STD_LOGIC_VECTOR(n downto 0);


begin
        tester : top generic map (n=>n) port map(
			X=>X,Y=>Y,sel=>sel,cin=>cin
		);
        
        testbench : process
        begin
          --------- start of stimulus section - ver1 ------------------
          X <="11111111";
		   Y <="00000001";
		   cin<= '0';
		   sel<="00";
		   for i in 0 to 6 loop
			wait for 50 ns;
			Y <= Y +1;
		  end loop;
          --------- end of stimulus section----------------------------
		  wait;
        end process testbench;
        
end rtl;
