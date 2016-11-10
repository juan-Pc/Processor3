----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:02:08 11/05/2016 
-- Design Name: 
-- Module Name:    im - Behavioral 
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
use std.textio.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity iM is
Port ( direccion : in  STD_LOGIC_VECTOR (31 downto 0);
       instruccion : out  STD_LOGIC_VECTOR (31 downto 0);
       reset : in  STD_LOGIC );
end iM;

architecture Behavioral of iM is

type rom_type is array (0 to 39) of std_logic_vector (31 downto 0);--se crea una varieble tipo rom que permite solo la  lectura de la direccion
	
	impure function InitRomFromFile (RomFileName : in string) return rom_type is--se crea una funcion que lea cada linea y retorne su lectura                                                 
	
		FILE RomFile : text open read_mode is RomFileName;--en esta linea especifica el archivo donde abre en modo lectura
		variable RomFileLine : line;--se declara la variable romfileline que trata de la lectura de la linea                                
		variable temp_bv : bit_vector(31 downto 0);--se declara la variable rom que va ser tipo lectura
		variable temp_mem : rom_type;--se declara la variable temp que va ser un vector de 32
		begin
			for I in rom_type'range loop
				readline (RomFile, RomFileLine);
				read(RomFileLine, temp_bv);
				temp_mem(i) := to_stdlogicvector(temp_bv);
		end loop;
	return temp_mem;
	end function;
	signal instructions : rom_type := InitRomFromFile("PruebaProcesor.data");


begin
	process(reset,direccion, instructions)
	begin		
			if(reset = '1')then
				instruccion <= (others=>'0');
			else
				instruccion <= instructions(conv_integer(direccion(5 downto 0)));
			end if;
		
	end process;



end Behavioral;

