----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:05:58 11/05/2016 
-- Design Name: 
-- Module Name:    psrmodifier - Behavioral 
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
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
use std.textio.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pSR_modifier is
    Port ( alu_op : in  STD_LOGIC_VECTOR (5 downto 0);
           alu_resultado : in  STD_LOGIC_VECTOR (31 downto 0);
           Crs1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Crs2 : in  STD_LOGIC_VECTOR (31 downto 0);
			  reset: in STD_LOGIC;
           nzvc : out  STD_LOGIC_VECTOR (3 downto 0));
			  
end pSR_modifier;

architecture Behavioral of pSR_modifier is

begin

process(alu_op,alu_resultado,Crs1,Crs2,reset)

begin 
			if(reset = '1')then
					 nzvc <= (others => '0');
			else
				-- ANDcc or ANDNcc or ORcc or ORNcc or XORcc or XNORcc
				if(alu_op="010001" or alu_op="010101" or alu_op="010010" or alu_op="010110" or alu_op="010011" or alu_op="010111") then
					nzvc(3)<= alu_resultado(31);
					if(conv_integer(alu_resultado)=0)then
						nzvc(2) <= '1';
					else
						nzvc(2) <= '0';
									
					end if;
					nzvc(1)<= '0';
					nzvc(0) <='0';
							
				end if;
				-- ADDcc or ADDxcc
				if (alu_op="010000" or alu_op="011000")then
					nzvc(3) <= alu_resultado(31);
					if (conv_integer(alu_resultado)=0)then
						nzvc(2) <= '1';
					else
						nzvc(2) <= '0';
					end if;
					nzvc(1) <= (Crs1(31) and Crs2(31) and (not alu_resultado(31))) or ((not Crs1(31)) and (not Crs2(31)) and alu_resultado(31));
					nzvc(0) <= (Crs1(31) and Crs2(31)) or ((not alu_resultado(31)) and (Crs1(31) or Crs2(31)) );
				end if;
				--SUBcc or SUBxcc
				if (alu_op="010100" or alu_resultado="011100")then
					nzvc(3) <= alu_resultado(31);
				   if (conv_integer(alu_resultado)=0)then
						nzvc(2) <= '1';
					else
					   nzvc(2) <= '0';
					end if;
					nzvc(1) <= (Crs1(31) and (not Crs2(31)) and (not alu_resultado(31))) or ((not Crs1(31)) and Crs2(31) and alu_resultado(31));
					nzvc(0) <= ((not Crs1(31)) and Crs2(31)) or (alu_resultado(31) and ((not Crs1(31)) or Crs2(31)));
				end if;
			end if;		
end process;
end Behavioral;

