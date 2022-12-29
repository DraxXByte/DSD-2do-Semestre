----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:55:01 12/14/2022 
-- Design Name: 
-- Module Name:    CONTADOR0_5 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CONTADOR_0_5 is
    Port ( UP : in  STD_LOGIC;
           DOWN : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           SAL : out  STD_LOGIC_VECTOR (2 downto 0));
end CONTADOR_0_5;

architecture Behavioral of CONTADOR_0_5 is
TYPE ESTADOS IS (D0, D1, D2, D3, D4, D5);
SIGNAL EDO_PRES, EDO_FUT: ESTADOS := D0;
begin
     PROCESO1:
	  PROCESS(EDO_PRES,UP,DOWN)
	  BEGIN
	       CASE(EDO_PRES) IS
			 --EDO D0
			 WHEN D0 => SAL <="000";-- CERO
			     IF(UP='0')THEN
				     EDO_FUT<=D1;
				  ELSIF(DOWN='0')THEN
				     EDO_FUT<=D5;
				  ELSE
				      EDO_FUT<=D0;
				  END IF;
				  
			 --EDO D1
			 WHEN D1=> SAL <="001";-- CERO
			     IF(UP='0')THEN
				     EDO_FUT<=D2;
				  ELSIF(DOWN='0')THEN
				     EDO_FUT<=D0;
				  ELSE
				      EDO_FUT<=D1;
				  END IF;
			--EDO D2
			 WHEN D2=> SAL <="010";-- CERO
			     IF(UP='0')THEN
				     EDO_FUT<=D3;
				  ELSIF(DOWN='0')THEN
				     EDO_FUT<=D1;
				  ELSE
				      EDO_FUT<=D2;
				  END IF;
			--EDO D3
			 WHEN D3=> SAL <="011";-- CERO
			     IF(UP='0')THEN
				     EDO_FUT<=D4;
				  ELSIF(DOWN='0')THEN
				     EDO_FUT<=D2;
				  ELSE
				      EDO_FUT<=D3;
				  END IF;
			--EDO D4
			 WHEN D4=> SAL <="100";-- CERO
			     IF(UP='0')THEN
				     EDO_FUT<=D5;
				  ELSIF(DOWN='0')THEN
				     EDO_FUT<=D3;
				  ELSE
				      EDO_FUT<=D4;
				  END IF;
			--EDO D5
			 WHEN D5=> SAL <="101";-- CERO
			     IF(UP='0')THEN
				     EDO_FUT<=D0;
				  ELSIF(DOWN='0')THEN
				     EDO_FUT<=D4;
				  ELSE
				      EDO_FUT<=D5;
				  END IF;
	       END CASE;
	 END PROCESS;
	 
	 PROCESO2:
	 PROCESS(CLK,RST)
	 VARIABLE PULSOS: INTEGER RANGE 0 TO 50000000 := 0;
    BEGIN
	      IF(RISING_EDGE(CLK))THEN
			   IF(RST='0')THEN
				   EDO_PRES<=D0;
					PULSOS:=0;
				ELSIF(PULSOS=24999999)THEN
				   PULSOS:=0;
					EDO_PRES<=EDO_FUT;
				ELSE
				    PULSOS:=PULSOS +1;
				END IF;
			END IF;
	 END PROCESS;
	 
end Behavioral;

