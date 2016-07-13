--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:06:27 09/25/2015
-- Design Name:   
-- Module Name:   C:/Users/mtech/poonam_vlsi/alu_32bit/alu_test.vhd
-- Project Name:  alu_32bit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: alu_unit
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
USE ieee.numeric_std.ALL; 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY alu_test IS
END alu_test;
 
ARCHITECTURE behavior OF alu_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT alu_unit
    PORT(
         i_a : IN  std_logic_vector(31 downto 0);
         i_b : IN  std_logic_vector(31 downto 0);
         cin : IN  std_logic;
         s : IN  std_logic_vector(3 downto 0);
         result : OUT  std_logic_vector(32 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal i_a : std_logic_vector(31 downto 0) := (others => '0');
   signal i_b : std_logic_vector(31 downto 0) := (others => '0');
   signal cin : std_logic := '0';
   signal s : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal result : std_logic_vector(32 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: alu_unit PORT MAP (
          i_a => i_a,
          i_b => i_b,
          cin => cin,
          s => s,
          result => result
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock<= '0';
		wait for clock_period/2;
		clock<= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		i_a <= "00000000000000000000000000010011"; --19 in decimal
      i_b <= "00000000000000000000000000001100"; --12 in decimal
		------------------adder---------------------------------
		cin <='0';
		s <="0000";wait for clock_period;
		s <="0001";wait for clock_period;
		s <="0010";wait for clock_period;
		s <="0011";wait for clock_period;
		
		cin <='1';
		s <="0000";wait for clock_period;
		s <="0001";wait for clock_period;
		s <="0010";wait for clock_period;
		s <="0011";wait for clock_period;
		
		------------------------logic---------------------------------
		cin <='0';
		s <="0100";wait for clock_period;
		s <="0101";wait for clock_period;
		s <="0110";wait for clock_period;
		s <="0111";wait for clock_period;
		
		---------------------shift-------------------------------------
      cin <='0';
		s <="1000";wait for clock_period;
		s <="1010";wait for clock_period;
		
		cin <='1';
		s <="1000";wait for clock_period;
		s <="1010";wait for clock_period;
       ----- insert stimulus here 

      wait;
   end process;

END;
