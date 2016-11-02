----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:00:05 11/01/2016 
-- Design Name: 
-- Module Name:    psr - Behavioral 
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

entity pSR is
    Port ( nzvc : in  STD_LOGIC_VECTOR (3 downto 0);
           reset : in  STD_LOGIC;
           Clock : in  STD_LOGIC;
           carry : out  STD_LOGIC);
end pSR;

architecture Behavioral of pSR is

begin
process(reset,Clock,nzvc)
begin
		if reset= '1' then
					carry <= '0';
		else
					if rising_edge(Clock) then
							  carry <= nzvc(0);
					end if;
		end if;
end process;
		


end Behavioral;

