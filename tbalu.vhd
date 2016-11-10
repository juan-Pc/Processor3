--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:13:56 11/05/2016
-- Design Name:   
-- Module Name:   D:/Desktop/PROCESADOR NUEVO/PROCESADOR4/tbalu.vhd
-- Project Name:  PROCESADOR4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: aLU
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
 
ENTITY Tb_aLU IS
END Tb_aLU;
 
ARCHITECTURE behavior OF Tb_aLU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT aLU
    PORT(
         opA : IN  std_logic_vector(31 downto 0);
         opB : IN  std_logic_vector(31 downto 0);
			Carry : in STD_LOGIC;
         aluOp : IN  std_logic_vector(5 downto 0);
         salida : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal opA : std_logic_vector(31 downto 0) := (others => '0');
   signal opB : std_logic_vector(31 downto 0) := (others => '0');
	signal Carry :STD_LOGIC;
   signal aluOp : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal salida : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: aLU PORT MAP (
          opA => opA,
          opB => opB,
          aluOp => aluOp,
			 Carry => Carry,
          salida => salida
        );



   -- Stimulus process
   stim_proc: process
   begin		
         	opA <= x"00000004";
				opB <= x"00000002";
				aluOp <= "000001";
      
      wait;
   end process;

END;
