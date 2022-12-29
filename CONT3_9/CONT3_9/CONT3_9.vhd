----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:33:18 12/21/2022 
-- Design Name: 
-- Module Name:    CONT3_9 - Behavioral 
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

entity CONT3_9 is
    Port ( UP : in  STD_LOGIC;
           DOWN : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           SAL : out  STD_LOGIC_VECTOR (3 downto 0));
end CONT3_9;

architecture Behavioral of CONT3_9 is
TYPE ESTADOS IS (D0,D1,D2,D3,D4,D5,D6);
SIGNAL EDO_PRES, EDO_FUT: ESTADOS:=D0;
begin
     PROCESO1:
	        PROCESS(EDO_PRES,UP,DOWN)
			  BEGIN
			       CASE(EDO_PRES) IS
							--EDO D3
							 WHEN D0 => SAL <="0011";-- TRES
								  IF(UP='1')THEN
									  EDO_FUT<=D1;
								  ELSIF(DOWN='1')THEN
									  EDO_FUT<=D5;
								  ELSE
										EDO_FUT<=D0;
								  END IF;
								  
							 --EDO D4
							 WHEN D1=> SAL <="0100";-- CUATRO
								  IF(UP='1')THEN
									  EDO_FUT<=D2;
								  ELSIF(DOWN='1')THEN
									  EDO_FUT<=D0;
								  ELSE
										EDO_FUT<=D1;
								  END IF;
							--EDO D5
							 WHEN D2=> SAL <="0101";-- CINCO
								  IF(UP='1')THEN
									  EDO_FUT<=D3;
								  ELSIF(DOWN='1')THEN
									  EDO_FUT<=D1;
								  ELSE
										EDO_FUT<=D2;
								  END IF;
							--EDO D6
							 WHEN D3=> SAL <="0110";-- SEIS
								  IF(UP='1')THEN
									  EDO_FUT<=D4;
								  ELSIF(DOWN='1')THEN
									  EDO_FUT<=D2;
								  ELSE
										EDO_FUT<=D3;
								  END IF;
							--EDO D7
							 WHEN D4=> SAL <="0111";-- SIETE
								  IF(UP='1')THEN
									  EDO_FUT<=D5;
								  ELSIF(DOWN='1')THEN
									  EDO_FUT<=D3;
								  ELSE
										EDO_FUT<=D4;
								  END IF;
							--EDO D5
							 WHEN D5=> SAL <="1000";-- OCHO
								  IF(UP='1')THEN
									  EDO_FUT<=D6;
								  ELSIF(DOWN='1')THEN
									  EDO_FUT<=D4;
								  ELSE
										EDO_FUT<=D5;
								  END IF;
							--EDO D6
							 WHEN D6=> SAL <="1001";-- NUEVE
								  IF(UP='1')THEN
									  EDO_FUT<=D0;
								  ELSIF(DOWN='1')THEN
									  EDO_FUT<=D5;
								  ELSE
										EDO_FUT<=D6;
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
								 PULSOS:=PULSOS -1;
							END IF;
						END IF;
				 END PROCESS;
end Behavioral;

