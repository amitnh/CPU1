LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE IEEE.math_real.all;
-------------------------------------
ENTITY BarrelShfter IS
  GENERIC (n : INTEGER := 4;m : INTEGER := 3);
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
	TYPE matrix is array (0 to m-1) OF STD_LOGIC_VECTOR (2*n-1 downto 0);
	--TYPE matrix is array (0 to m-1,2*n-1 downto 0) OF STD_LOGIC;
	SIGNAL entry,exitMat: matrix;-- matrix of entries/exits to each muxChain
	
BEGIN
	entry <= (OTHERS=>(OTHERS=>'0'));
	exitMat(0)<=x;
		yFor:for i in 0 to m-1 GENERATE
			muxFor:for j in 0 to n-1 GENERATE
				entry(i)(2*j+1)<=exitMat(i)(j);
				--IF (((2**i-1)*2+1+2*j+1) <= (2*n+1)) then
				entry(i)((2**i-1)*2+1+2*j+1)<=exitMat(i)(j);
				--END IF;
			END GENERATE;
			chain : MuxChain port map(
				xi => entry(i),
				y => yi(i),
				zi=>exitMat(i) --- check
			);
		END GENERATE;	
		s<=exitMat(m-1);
END dbs;

