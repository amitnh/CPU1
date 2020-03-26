library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity tb is
	constant m : integer := 4;
end tb;

architecture rtb of tb is
  component Adder is
	GENERIC (n : INTEGER);
	PORT (   cin: IN STD_LOGIC;
			 x,y: IN STD_LOGIC_VECTOR (n-1 DOWNTO 0);
            cout: OUT STD_LOGIC;
               s: OUT STD_LOGIC_VECTOR(n-1 downto 0));
  end component;
	SIGNAL cin,cout : STD_LOGIC;
	SIGNAL x,y,s : STD_LOGIC_VECTOR (m-1 DOWNTO 0);
begin
	L0 : Adder generic map (m) port map(cin,x,y,cout,s);
    
	--------- start of stimulus section ------------------	
        tb : process
        begin
		  x <= (others => '0');
		  y <= (others => '1');
		  for i in 0 to 7 loop
			wait for 50 ns;
			x <= x+2;
			y <= y-2;
		  end loop;
		  wait;
        end process tb;
		  
		tb_cin : process
        begin
		  cin <='0','1' after 200 ns;
		  wait;
        end process tb_cin; 
  
end architecture rtb;
