----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:10:04 11/05/2016 
-- Design Name: 
-- Module Name:    test_im - Behavioral 
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
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Tb_iM IS
END Tb_iM;
 
ARCHITECTURE behavior OF Tb_iM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT iM
    PORT(
         direccion : IN  std_logic_vector(31 downto 0);
         instruccion : OUT  std_logic_vector(31 downto 0);
         reset : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal direccion : std_logic_vector(31 downto 0) := (others => '0');
   signal reset : std_logic := '0';

 	--Outputs
   signal instruccion : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: iM PORT MAP (
          direccion => direccion,
          instruccion => instruccion,
          reset => reset
        );

   
 

   -- Stimulus process
   stim_proc: process
   begin		
      reset <='1';
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		reset <='0';
		direccion <= x"00000000";
      wait;
   end process;

END;
