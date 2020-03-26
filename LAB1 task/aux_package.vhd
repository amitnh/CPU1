LIBRARY ieee;
USE ieee.std_logic_1164.all;


package aux_package is

	component top is
	GENERIC (n : INTEGER);
	PORT (    cin : IN STD_LOGIC;
			sel : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
			 X,Y: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
		  result: OUT STD_LOGIC_VECTOR(n-1 downto 0));
	end component;
  
  
  
  
  
end aux_package;

