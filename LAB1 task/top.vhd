LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE work.aux_package.all;

-------------------------------------
ENTITY top IS
  GENERIC (n : INTEGER := 8);
  PORT (    cin : IN STD_LOGIC;
			sel : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
			 X,Y: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
		  result: OUT STD_LOGIC_VECTOR(n downto 0));
END top;
------------- complete the top Architecture code --------------
ARCHITECTURE struct OF top IS
	
	
BEGIN
	





END struct;

