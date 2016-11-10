----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:59:54 11/05/2016 
-- Design Name: 
-- Module Name:    sumador - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sumadOR is
 Port ( suma1 : in  STD_LOGIC_VECTOR (31 downto 0);
        suma2 : in  STD_LOGIC_VECTOR (31 downto 0);
        salida: out  STD_LOGIC_VECTOR (31 downto 0));
end sumadOR;

architecture Behavioral of sumadOR is

begin
	process(suma1,suma2)
	begin
		salida<= suma1+ suma2; 
	end process; 




end Behavioral;



