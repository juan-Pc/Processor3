----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:03:05 11/05/2016 
-- Design Name: 
-- Module Name:    uc - Behavioral 
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

entity uC is
Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           salidaout: out  STD_LOGIC_VECTOR (5 downto 0));--la salidaoututo el tipo de operador que llevara a la alu
end uC;

architecture Behavioral of uC is

begin
process(op,op3)
begin
if (op="10")then 


						case op3 is 
										when "000000" => -- ADD
										salidaout  <= "000000";
											
										when "010000" => -- ADDcc
										salidaout  <= "010000";
											
										when "001000" => -- ADDX
										salidaout  <= "001000";
										
										when "011000" => -- ADDXcc
										salidaout  <= "011000";

										when "000100" => -- SUB
										salidaout <= "000100";
									 
										when "010100" => -- SUBcc
									   salidaout <= "010100";	
											 
										when "001100" => -- SUBX
										salidaout <= "001100";	
										
										when "011100" => -- SUBXcc
										salidaout <= "011100";							
											 
										when "000001" => -- AND
										salidaout <= "000001";
											 
										when "000101" => -- ANDN
										salidaout <= "000101";
										
										when "010101" => -- ANDNcc
										salidaout <= "010101";
											 
										when "010001" => -- ANDcc
										salidaout <= "010001";							
											 
										when "000010" => -- OR
										salidaout <= "000010";
											
										when "000110" => -- ORN
										salidaout <= "000110";
											
										when "010010" => -- ORcc
										salidaout <= "010010";
											
										when "010110" => -- ORNcc
										salidaout <= "010110";	
											 
										when "000011" => -- XOR
										salidaout  <= "000011"; 
											
										when "000111" => -- XNOR
										salidaout <= "000111";
										
										when "010011" => -- XORcc
										salidaout  <= "010011"; 
											
										when "010111" => -- XNORcc
										salidaout <= "010111";	
										
										when "111100" => --save (se toma como una suma pero modifica current window pointier)
										salidaout <= "111100" ; 
						   
							         when "111101" =>
										salidaout <="111101";--restore	
											
										when others => --otras instrucciones
										salidaout <= "111111"; 
												
						end case;
				 end if;
end process;


end Behavioral;

