----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:07:24 11/05/2016 
-- Design Name: 
-- Module Name:    alu - Behavioral 
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

entity aLU is
Port ( opA : in  STD_LOGIC_VECTOR (31 downto 0);
           opB : in  STD_LOGIC_VECTOR (31 downto 0);
			  Carry : in STD_LOGIC;
           aluOp : in  STD_LOGIC_VECTOR (5 downto 0);
           salida : out  STD_LOGIC_VECTOR (31 downto 0));
end aLU;

architecture Behavioral of aLU is

begin

process(aluOp,opA,opB)
	
			begin
						case aluOp is
						
								when "000000" => -- add
										salida <= opA + opB;
								
								when "010000" => -- addcc
										salida <= opA + opB;
								
								when "001000" => -- addX
										salida <= opA + opB + Carry;
									
								when "011000" => -- addXcc
										salida <= opA + opB + Carry;
								
								when "000100" => -- sub
										salida <= opA - opB;
								
								when "010100" => -- subcc
										salida <= opA - opB;
								
								when "001100" => -- subX
										salida <= opA - opB - Carry;
								
								when "011100" => -- subXcc
										salida <= opA - opB - Carry;
								
								when "000001" => -- and
										salida <= opA and opB;
								
								when "000101" => -- andn
										salida <= opA and not (opB);
								
								when "010101" => --andNcc
										salida <= opA and opB;
								
								when "010001" => --andcc
										salida <= opA and opB;
								
								when "000010" => --or
										salida <= opA or opB;
								
								when "000110" => --orn
									salida <= opA or not (opB);	
									
								when "010010" => --orcc
										salida <= opA or opB;	
								
								when "010110" => --orNcc
										salida <= opA or opB;  
								
								when "000011" => -- xor
										salida <= opA xor opB;
								
								when "000111" => -- xnor
										salida <= opA xnor opB;
								
								when "010011" => -- xorcc
										salida <= opA xor opB;
							   when "111100" => --save (se toma como una suma pero modifica current window pointier)
										salida <=   opA - opB; 
						   
							   when "111101" =>
										salida <=   opA + opB;--restore	
									
								when others => --otras instrucciones
											salida <= (others=>'0');


										
						end case;
end process;
								


end Behavioral;

