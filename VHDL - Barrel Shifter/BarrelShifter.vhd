LIBRARY ieee;
USE ieee.std_logic_1164.all;
-------------------------------------
ENTITY BarrelShfter IS
  GENERIC (n : INTEGER := 4);
  GENERIC (m : INTEGER := 3);
  PORT (    x: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
			yi: IN STD_LOGIC_VECTOR (m-1 DOWNTO 0);
            s: OUT STD_LOGIC_VECTOR(n-1 downto 0));
END BarrelShfter;
--------------------------------------------------------------
ARCHITECTURE dbs OF BarrelShfter IS
COMPONENT MuxChain IS
  GENERIC (n : INTEGER := 4);
  PORT (    xi: IN STD_LOGIC_VECTOR (2*n-1 DOWNTO 0);
			y: IN STD_LOGIC;             
			zi: OUT STD_LOGIC_VECTOR(n-1 downto 0));
END COMPONENT;
	TYPE matrix is array (0 to m-1,n-1 downto 0);
	SIGNAL w : std_logic_vector(n-1 DOWNTO 0);
	SIGNAL entry: matrix; -- matrix of entries to each muxChain

BEGIN
	entry <= (OTHERS=>'0');
	w<=x;
	for j in 1 to n-1 GENERATE
		for i in 0 to m-1 GENERATE
			entry(i,(2*j+1))<=w(j);
			entry(i,(2^i-1)*2+1+2*j+1)<=w(j);
		chain : MuxChain port map(
			xi => entry(i),
			y => yi(i);
			w<= zi;
		);
		END GENERATE;
	END GENERATE;	
	s<=w;

END dbs;

