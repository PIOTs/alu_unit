----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:20:44 09/25/2015 
-- Design Name: 
-- Module Name:    alu_unit - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu_unit is
port(i_a:in std_logic_vector(31 downto 0);
	  i_b:in std_logic_vector(31 downto 0);
	  cin:in std_logic;
	  s:in std_logic_vector(3 downto 0);
	  result:out std_logic_vector(32 downto 0));
end alu_unit;

architecture Behavioral of alu_unit is

	component arithm_unit is
	port(i_a:in std_logic_vector(31 downto 0);
	  i_b:in std_logic_vector(31 downto 0);
	  cin:in std_logic;
	  s:in std_logic_vector(1 downto 0);
	  result:out std_logic_vector(32 downto 0));
	end component;
	
	component logic_unit is
	port(i_a:in std_logic_vector(31 downto 0);
	  i_b:in std_logic_vector(31 downto 0);
	  s:in std_logic_vector(1 downto 0);
	  result:out std_logic_vector(32 downto 0));
	end component;

	component shift_unit is
	port(i_a:in std_logic_vector(31 downto 0);
	  cin:in std_logic;
	  s:in std_logic;
	  result:out std_logic_vector(32 downto 0));
	end component;	
	
	component mux_4to1_33bit is
	port(a,b,c,d:in std_logic_vector(32 downto 0);
		s:in std_logic_vector(1 downto 0);
		y:out std_logic_vector(32 downto 0));
	end component;
	
	signal sg_arith:std_logic_vector(32 downto 0);
	signal sg_logic:std_logic_vector(32 downto 0);
	signal sg_shift:std_logic_vector(32 downto 0);

begin
a0:arithm_unit port map(i_a,i_b,cin,s(1 downto 0),sg_arith);
a1:logic_unit port map(i_a,i_b,s(1 downto 0),sg_logic);
a2:shift_unit port map(i_a,cin,s(1),sg_shift);

a3:mux_4to1_33bit port map(sg_arith,sg_logic,sg_shift,"ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ",s(3 downto 2),result);


end Behavioral;

