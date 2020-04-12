-- Test Bench for BarrelShfter.
library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;



entity tb_bs is
  GENERIC (n : INTEGER :=8 ; m : INTEGER :=3;k : INTEGER :=16 ; l : INTEGER :=4);
end tb_bs;

architecture rtl of tb_bs is  
COMPONENT BarrelShfter IS
  GENERIC (n : INTEGER;m : INTEGER);
  PORT (    x: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
			yi: IN STD_LOGIC_VECTOR (n-2 DOWNTO 0);
            s: OUT STD_LOGIC_VECTOR(n-1 downto 0));
END COMPONENT;

COMPONENT BarrelShfter2 IS
  GENERIC (k : INTEGER;l : INTEGER);
  PORT (    x2: IN STD_LOGIC_VECTOR (k-1 DOWNTO 0);
			yi2: IN STD_LOGIC_VECTOR (k-2 DOWNTO 0);
            s2: OUT STD_LOGIC_VECTOR(k-1 downto 0));
END COMPONENT;

signal  x:STD_LOGIC_VECTOR (n-1 DOWNTO 0);
signal	yi :STD_LOGIC_VECTOR (n-2 DOWNTO 0);
signal	s :STD_LOGIC_VECTOR(n-1 downto 0);

signal  x2:STD_LOGIC_VECTOR (k-1 DOWNTO 0);
signal	yi2 :STD_LOGIC_VECTOR (k-2 DOWNTO 0);
signal	s2 :STD_LOGIC_VECTOR(k-1 downto 0);

begin
        tester : BarrelShfter generic map (n,m) port map(
			x=>x,yi=>yi,s=>s
		);
		tester2 : BarrelShfter generic map (k,l) port map(
			x=>x2,yi=>yi2,s=>s2
		);
        
        testbench : process
        begin
          --------- start of stimulus section - TEST1 ------------------
          x <="11111111";
		   yi <="0000000";
		   for i in 0 to 7 loop
			wait for 50 ns;
			yi <= yi +1;
		  end loop;
		  
		  --------- start of stimulus section - TEST2 ------------------
          x2  <="1111111111111111";
		  yi2 <="000000000000000";
		  for j in 0 to 14 loop
			wait for 50 ns;
			yi2 <= yi2 +1;
		  end loop;
          --------- end of stimulus section----------------------------
		  wait;
        end process testbench;
        
end rtl;
