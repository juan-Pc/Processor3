----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:18:37 11/01/2016 
-- Design Name: 
-- Module Name:    procesador - Behavioral 
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

entity Procesador_AMD_FULL is
	Port ( Clock : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           OutProcesador : out  STD_LOGIC_VECTOR (31 downto 0));
end Procesador_AMD_FULL;

architecture Behavioral of Procesador_AMD_FULL is
COMPONENT Sumador
	PORT(
		Incremento : IN std_logic_vector(31 downto 0);
		Direccion : IN std_logic_vector(31 downto 0);          
		NuevaDireccion : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT NPC
	PORT(
		Direccion : IN std_logic_vector(31 downto 0);
		Reset : IN std_logic;
		Clock : IN std_logic;          
		NuevaDireccion : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT PC
	PORT(
		Direccion : IN std_logic_vector(31 downto 0);
		Reset : IN std_logic;
		Clock : IN std_logic;          
		NuevaDireccion : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT instructionMemory
	PORT(
		address : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;          
		outInstruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	
	COMPONENT UC
	PORT(
		OP : IN std_logic_vector(1 downto 0);
		OP3 : IN std_logic_vector(5 downto 0);          
		ALU_OP : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
	
	COMPONENT RF
	PORT(
		Rs1 : IN std_logic_vector(4 downto 0);
		Rs2 : IN std_logic_vector(4 downto 0);
		Rsd : IN std_logic_vector(4 downto 0);
		datawrite : IN std_logic_vector(31 downto 0);
		rst : IN std_logic;          
		CRs1 : OUT std_logic_vector(31 downto 0);
		CRs2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT MUX
	PORT(
		RfToMux : IN std_logic_vector(31 downto 0);
		inm : IN std_logic;
		seuToMux : IN std_logic_vector(31 downto 0);          
		MuxToAlu : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT SEU
	PORT(
		simm13 : IN std_logic_vector(12 downto 0);          
		seu32 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT pSR_modifier
	PORT(
		alu_op : IN std_logic_vector(5 downto 0);
		alu_resultado : IN std_logic_vector(31 downto 0);
		Crs1 : IN std_logic_vector(31 downto 0);
		Crs2 : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;          
		nzvc : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
		COMPONENT pSR
	PORT(
		nzvc : IN std_logic_vector(3 downto 0);
		reset : IN std_logic;
		Clock : IN std_logic;          
		carry : OUT std_logic
		);
	END COMPONENT;

	
	COMPONENT ALU
	PORT(
		Crs1 : IN std_logic_vector(31 downto 0);
		Crs2 : IN std_logic_vector(31 downto 0);
		ALU_Op : IN std_logic_vector(5 downto 0);
      Carry : in STD_LOGIC;		
		ALU_Out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
signal SumadorToNPC, NPCToPC, PCToIM, IMToURS, ALUToRF, RFToALU, RFToMUX, SEUToMUX, MUXToALU: STD_LOGIC_VECTOR (31 downto 0);
signal UCToALU: STD_LOGIC_VECTOR (5 downto 0);
signal psrToalu: STD_LOGIC := '0';--creo senals de 1
signal psrmodifier_psr: STD_LOGIC_VECTOR(3 downto 0);--creo senals de 4
begin

	Inst_Sumador: Sumador PORT MAP(
		Incremento => x"00000001",
		Direccion => NPCToPC,
		NuevaDireccion => SumadorToNPC
	);
	
	Inst_NPC: NPC PORT MAP(
		Direccion => SumadorToNPC,
		NuevaDireccion => NPCToPC,
		Reset => Reset,
		Clock => Clock
	);
	
	Inst_PC: PC PORT MAP(
		Direccion => NPCToPC,
		NuevaDireccion => PCToIM,
		Reset => Reset,
		Clock => Clock
	);
	
	Inst_instructionMemory: instructionMemory PORT MAP(
		address => PCToIM,
		reset => Reset,
		outInstruction => IMToURS
	);	
	
	Inst_UC: UC PORT MAP(
		OP => IMToURS(31 downto 30),
		OP3 => IMToURS(24 downto 19),
		ALU_OP => UCtoALU
	);	
	
	Inst_RF: RF PORT MAP(
		Rs1 => IMToURS(18 downto 14),
		Rs2 => IMToURS(4 downto 0),
		Rsd => IMToURS(29 downto 25),
		datawrite => ALUToRF,
		CRs1 => RFToALU,
		CRs2 => RFToMUX,
		rst => Reset
	);
	
	Inst_MUX: MUX PORT MAP(
		RfToMux => RFToMUX,
		inm => IMToURS(13),
		seuToMux => SEUToMUX,
		MuxToAlu => MUXToALU
	);
	
	Inst_SEU: SEU PORT MAP(
		simm13 => IMToURS(12 downto 0),
		seu32 => SEUToMUX
	);
	
	Inst_pSR_modifier: pSR_modifier PORT MAP(
		alu_op => UCToALU ,
		alu_resultado => ALUToRF,
		Crs1 => RFToALU,
		Crs2 => RFToMUX ,
		reset => reset,
		nzvc => psrmodifier_psr
	);
	
	Inst_pSR: pSR PORT MAP(
		nzvc => psrmodifier_psr ,
		reset =>reset ,
		Clock =>Clock,
		carry => psrToalu
	);



	
	Inst_ALU: ALU PORT MAP(
		Crs1 => RFToALU,
		Crs2 => MUXToALU,
		ALU_Op => UCtoALU,
		Carry => psrToalu ,		
		ALU_Out => ALUToRF
	);
	
	OutProcesador <= ALUToRF;
	

end Behavioral;

