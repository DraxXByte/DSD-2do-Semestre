----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:53:03 12/08/2022 
-- Design Name: 
-- Module Name:    contador - Behavioral 
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

entity contador is
    Port ( clk : in  STD_LOGIC;
           q0 : out  STD_LOGIC;
           q1 : out  STD_LOGIC;
           q2 : out  STD_LOGIC;
           nq0 : out  STD_LOGIC;
           nq1 : out  STD_LOGIC;
           nq2 : out  STD_LOGIC);
end contador;

architecture Behavioral of contador is
-------divisor de frecuencia-----------------------------------------------------------------------------
signal nk: std_logic;
signal count :integer range 0 to 99999999:=0;
signal pulso: std_logic:='0';
-------fin divisor de frecuencia-------------------------------------------------------------------------
signal a0: std_logic:='0';
signal a1: std_logic:='0';
signal a2: std_logic:='0';
begin
     process(clk,nk,a0,a1,count)
	  begin
-------divisor de frecuencia-----------------------------------------------------------------------------
          if(rising_edge(clk))then
			    if(count=25000000)then
				    pulso<=not(pulso);
					 count<=0;
				 end if;
			 end if;
			 nk<=pulso;
-------fin divisor de frecuencia------------------------------------------------------------------------- 
			 
			 if(falling_edge(nk))then
			    a0<=not(a0);
			 end if;
			 if(falling_edge(a0))then
			    a1<=not(a1);
			 end if;
			 if(falling_edge(a1))then
			    a2<=not(a2);
			 end if;
			 
			 q0<=a0;
			 q1<=a1;
			 q2<=a2;
			 nq0<=not(a0);
			 nq1<=not(a1);
			 nq2<=not(a2);
		end process;
end Behavioral;

