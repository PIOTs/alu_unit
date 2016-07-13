----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:48:44 09/25/2015 
-- Design Name: 
-- Module Name:    mux_2to1_33bit - Behavioral 
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

entity mux_2to1_33bit is
port(a,b:in std_logic_vector(32 downto 0);
		s:in std_logic;
		y:out std_logic_vector(32 downto 0));
end mux_2to1_33bit;

architecture Behavioral of mux_2to1_33bit is

begin
	process(s,a,b)
		 begin
		 case s is
		 when '0'=> y<=a;
		 when '1'=> y<=b;
		 when others=> y<="ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
		 end case;
	end process;
		
end Behavioral;

