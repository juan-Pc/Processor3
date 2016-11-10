----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:10:27 11/05/2016 
-- Design Name: 
-- Module Name:    test_npc - Behavioral 
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
 
ENTITY Tb_nPC IS
END Tb_nPC;
 
ARCHITECTURE behavior OF Tb_nPC IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT nPC
    PORT(senal: in  STD_LOGIC_VECTOR (31 downto 0);
			  clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           salida: out  STD_LOGIC_VECTOR (31 downto 0)
        );
    END COMPONENT;
    
   --Inputs
   signal senal : std_logic_vector(31 downto 0) := (others => '0');
	signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   

 	--Outputs
   signal salida: std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: nPC PORT MAP (
          senal=> senal,
			 clk => clk,
          reset => reset,
          salida=> salida
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;


   -- Stimulus process
    stim_proc: process
   begin		
		reset<='1';
      -- hold reset state for 100 ns.
      wait for 30 ns;
		reset<='0';
		senal <=  x"00000010"; 
		wait for 30 ns;
		senal<=  x"00000011";
		wait for 30 ns;
		senal <=  x"00000012";

      wait;
   end process;
END;