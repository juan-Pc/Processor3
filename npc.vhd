----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:01:19 11/05/2016 
-- Design Name: 
-- Module Name:    npc - Behavioral 
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

entity nPC is
   Port   (senal: in  STD_LOGIC_VECTOR (31 downto 0);
			  clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           salida: out  STD_LOGIC_VECTOR (31 downto 0));

end nPC;

architecture Behavioral of nPC is

begin
 process (clk,reset,senal)
	begin
	if(rising_edge(clk))then
			if reset='1' then
			salida<=x"00000000";
		else
		salida <=senal;		
		end if;
	end if;
end process;


end Behavioral;

