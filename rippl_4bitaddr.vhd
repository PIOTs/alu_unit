----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:00:36 09/25/2015 
-- Design Name: 
-- Module Name:    rippl_4bitaddr - Behavioral 
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

entity rippl_4bitaddr is
port(a,b:in std_logic_vector(3 downto 0);
	  cin:in std_logic;
	  sum:out std_logic_vector(3 downto 0);
	  carry:out std_logic);
end rippl_4bitaddr;

architecture Behavioral of rippl_4bitaddr is

	component full_add is
	port(a,b,cin:in std_logic;
	  sum,cout:out std_logic);
	end component;
	
	signal s:std_logic_vector(2 downto 0);-----for 3 intermediate carry
	
begin
	F1:full_add port map(a(0),b(0),cin,sum(0),s(0));
	F2:full_add port map(a(1),b(1),s(0),sum(1),s(1));
	F3:full_add port map(a(2),b(2),s(1),sum(2),s(2));
	F4:full_add port map(a(3),b(3),s(2),sum(3),carry);


end Behavioral;

