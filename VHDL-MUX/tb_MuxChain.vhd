-- Test Bench for Counter.
library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;



entity tb_MuxChain is
  GENERIC (n : INTEGER := 4);
end tb_MuxChain;

architecture rtl of tb_MuxChain is  
component MuxChain IS
  
  PORT (     xi: IN STD_LOGIC_VECTOR (2*n-1 DOWNTO 0);
			 y: IN STD_LOGIC;
              
			 zi: OUT STD_LOGIC_VECTOR(n-1 downto 0));
END component;

signal  xi: STD_LOGIC_VECTOR (2*n-1 DOWNTO 0);
signal	zi : STD_LOGIC_VECTOR (n-1 DOWNTO 0);
signal	y : std_logic;

begin
        tester : MuxChain port map(
			xi=>xi,y=>y,zi=>zi
		);
        
        testbench : process
        begin
          --------- start of stimulus section - ver1 ------------------
          xi <="01100110";
		  y <='0', '1' after 200 ns;
          --------- end of stimulus section----------------------------
		  wait;
        end process testbench;
        
end rtl;
