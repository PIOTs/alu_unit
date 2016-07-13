----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:47:36 09/25/2015 
-- Design Name: 
-- Module Name:    logic_unit - Behavioral 
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

entity logic_unit is
port(i_a:in std_logic_vector(31 downto 0);
	  i_b:in std_logic_vector(31 downto 0);
	  s:in std_logic_vector(1 downto 0);
	  result:out std_logic_vector(32 downto 0));
end logic_unit;

architecture Behavioral of logic_unit is

	component and_32bit is
	port(i_a:in std_logic_vector(31 downto 0);
	  i_b:in std_logic_vector(31 downto 0);
	  result:out std_logic_vector(32 downto 0));
	end component;
	
	component or_32bit is
	port(i_a:in std_logic_vector(31 downto 0);
	  i_b:in std_logic_vector(31 downto 0);
	  result:out std_logic_vector(32 downto 0));
	end component;
	
	component xor_32bitt is
	port(i_a:in std_logic_vector(31 downto 0);
	     i_b:in std_logic_vector(31 downto 0);
	     result:out std_logic_vector(32 downto 0));
	end component;
	
	component not_32bit is
	port(i_a:in std_logic_vector(31 downto 0);
	  result:out std_logic_vector(32 downto 0));
	end component;
	
	component mux_4to1_33bit is
	port(a,b,c,d:in std_logic_vector(32 downto 0);
		s:in std_logic_vector(1 downto 0);
		y:out std_logic_vector(32 downto 0));
	end component;
	
	signal sg_and:std_logic_vector(32 downto 0);
	signal sg_or:std_logic_vector(32 downto 0);
	signal sg_xor:std_logic_vector(32 downto 0);
	signal sg_not:std_logic_vector(32 downto 0);

begin

a0:and_32bit port map(i_a,i_b,sg_and);
a1:or_32bit port map(i_a,i_b,sg_or);
a2:xor_32bitt port map(i_a,i_b,sg_xor);
a3:not_32bit port map(i_a,sg_not);
a4:mux_4to1_33bit port map(sg_and,sg_or,sg_xor,sg_not,s,result);

end Behavioral;

