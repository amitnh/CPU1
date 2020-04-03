-- Test Bench for Counter.
library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;



entity tb_bs is
  GENERIC (n : INTEGER := 4;m : INTEGER := 3);
end tb_bs;

architecture rtl of tb_bs is  
COMPONENT BarrelShfter IS
  GENERIC (n : INTEGER := 4;m : INTEGER := 3);
  PORT (    x: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
			yi: IN STD_LOGIC_VECTOR (m-1 DOWNTO 0);
            s: OUT STD_LOGIC_VECTOR(n-1 downto 0));
END COMPONENT;

signal  x:STD_LOGIC_VECTOR (n-1 DOWNTO 0);
signal	yi :STD_LOGIC_VECTOR (m-1 DOWNTO 0);
signal	s :STD_LOGIC_VECTOR(n-1 downto 0);

begin
        tester : BarrelShfter port map(
			x=>x,yi=>yi,s=>s
		);
        
        testbench : process
        begin
          --------- start of stimulus section - ver1 ------------------
          x <="1111";
		      yi <="001";
          --------- end of stimulus section----------------------------
		  wait;
        end process testbench;
        
end rtl;