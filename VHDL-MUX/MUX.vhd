LIBRARY ieee;
USE ieee.std_logic_1164.all;
--------------------------------------------------------
ENTITY MUX IS
	PORT (x1, x2, y: IN std_logic;
			  Z: OUT std_logic);
END MUX;
--------------------------------------------------------
ARCHITECTURE dataflow OF MUX IS
BEGIN
	Z<= x1 when (y = '0' ) else x2;
END dataflow;
