LIBRARY ieee;
USE ieee.std_logic_1164.all;

package sample_package is

	component FA is
		PORT (xi, yi, cin: IN std_logic;
			      s, cout: OUT std_logic);
	end component;
	
	component Adder is
	GENERIC (n : INTEGER);
	PORT (   cin: IN STD_LOGIC;
			 x,y: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
            cout: OUT STD_LOGIC;
               s: OUT STD_LOGIC_VECTOR(n-1 downto 0));
	end component;
  
end sample_package;

