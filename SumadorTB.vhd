--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:40:14 04/23/2016
-- Design Name:   
-- Module Name:   D:/Biblioteca/Documents/Procesador/Procesador32/SumadorTB.vhd
-- Project Name:  Procesador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Sumador
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY SumadorTB IS
END SumadorTB;
 
ARCHITECTURE behavior OF SumadorTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Sumador
    PORT(
         Incremento : IN  std_logic_vector(31 downto 0);
         Direccion : IN  std_logic_vector(31 downto 0);
         NuevaDireccion : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Incremento : std_logic_vector(31 downto 0) := (others => '0');
   signal Direccion : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal NuevaDireccion : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Sumador PORT MAP (
          Incremento => Incremento,
          Direccion => Direccion,
          NuevaDireccion => NuevaDireccion
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		wait for 30 ns;
      -- insert stimulus here 
		Incremento <= x"00000001";
		Direccion <= x"00000002";
		wait for 30 ns;
		Incremento <= x"00000001";
			

      wait;
   end process;

END;
