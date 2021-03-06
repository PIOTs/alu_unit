----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:36:42 09/25/2015 
-- Design Name: 
-- Module Name:    mux_4to1_33bit - Behavioral 
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

entity mux_4to1_33bit is
port(a,b,c,d:in std_logic_vector(32 downto 0);
		s:in std_logic_vector(1 downto 0);
		y:out std_logic_vector(32 downto 0));
end mux_4to1_33bit;

architecture Behavioral of mux_4to1_33bit is

begin
	process(s,a,b,c,d)
	begin
		case s is
			when "00" => y<=a;
			when "01" => y<=b;
			when "10" => y<=c;
			when "11" => y<=d;
			when others => y<="ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
		end case;
	end process;
end Behavioral;

