----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:35:39 12/09/2022 
-- Design Name: 
-- Module Name:    CONTADOR - Behavioral 
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

entity CONTADOR is
    Port ( CLK : in  STD_LOGIC;
           SET : in  STD_LOGIC;
           RES : in  STD_LOGIC;
           Tv : in  STD_LOGIC_VECTOR (2 downto 0);
           Qv : out  STD_LOGIC_VECTOR (2 downto 0);
           NQv : out  STD_LOGIC_VECTOR (2 downto 0));
end CONTADOR;

architecture Behavioral of CONTADOR is

begin


end Behavioral;

