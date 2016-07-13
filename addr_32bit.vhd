----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:27:26 09/25/2015 
-- Design Name: 
-- Module Name:    addr_32bit - Behavioral 
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

entity addr_32bit is
port(i_a:in std_logic_vector(31 downto 0);
	  i_b:in std_logic_vector(31 downto 0);
	  cin:in std_logic;
	  result:out std_logic_vector(32 downto 0));
end addr_32bit;

architecture Behavioral of addr_32bit is

	component rippl_4bitaddr is
	port(a,b:in std_logic_vector(3 downto 0);
	    cin:in std_logic;
	    sum:out std_logic_vector(3 downto 0);
	    carry:out std_logic);
	end component;
	
	signal s:std_logic_vector(6 downto 0);---------7 intermediate carry
	
begin

	s1:rippl_4bitaddr port map(i_a(3 downto 0),i_b(3 downto 0),cin,result(3 downto 0),s(0));
	s2:rippl_4bitaddr port map(i_a(7 downto 4),i_b(7 downto 4),s(0),result(7 downto 4),s(1));
	s3:rippl_4bitaddr port map(i_a(11 downto 8),i_b(11 downto 8),s(1),result(11 downto 8),s(2));
	s4:rippl_4bitaddr port map(i_a(15 downto 12),i_b(15 downto 12),s(2),result(15 downto 12),s(3));
	s5:rippl_4bitaddr port map(i_a(19 downto 16),i_b(19 downto 16),s(3),result(19 downto 16),s(4));
	s6:rippl_4bitaddr port map(i_a(23 downto 20),i_b(23 downto 20),s(4),result(23 downto 20),s(5));
	s7:rippl_4bitaddr port map(i_a(27 downto 24),i_b(27 downto 24),s(5),result(27 downto 24),s(6));
	s8:rippl_4bitaddr port map(i_a(31 downto 28),i_b(31 downto 28),s(6),result(31 downto 28),result(32));


end Behavioral;

