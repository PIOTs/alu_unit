----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:11:47 09/25/2015 
-- Design Name: 
-- Module Name:    shift_unit - Behavioral 
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

entity shift_unit is
port(i_a:in std_logic_vector(31 downto 0);
	  cin:in std_logic;
	  s:in std_logic;
	  result:out std_logic_vector(32 downto 0));
end shift_unit;

architecture Behavioral of shift_unit is
	
	component rt_shift is
	port(i_a:in std_logic_vector(31 downto 0);
	  cin:in std_logic;
	  result:out std_logic_vector(32 downto 0));
	end component;
	
	component lft_shift is
	port(i_a:in std_logic_vector(31 downto 0);
	  cin:in std_logic;
	  result:out std_logic_vector(32 downto 0));
	end component;

	component mux_2to1_33bit is
	port(a,b:in std_logic_vector(32 downto 0);
		s:in std_logic;
		y:out std_logic_vector(32 downto 0));
	end component;	

   signal sg_rt:std_logic_vector(32 downto 0);
	signal sg_lft:std_logic_vector(32 downto 0);
	
begin

a0:rt_shift port map(i_a,cin,sg_rt);
a1:lft_shift port map(i_a,cin,sg_lft);
a2:mux_2to1_33bit port map(sg_rt,sg_lft,s,result);

end Behavioral;

