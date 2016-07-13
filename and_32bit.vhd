----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:50:26 09/25/2015 
-- Design Name: 
-- Module Name:    and_32bit - Behavioral 
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

entity and_32bit is
port(i_a:in std_logic_vector(31 downto 0);
	  i_b:in std_logic_vector(31 downto 0);
	  result:out std_logic_vector(32 downto 0));
end and_32bit;

architecture Behavioral of and_32bit is

begin
result(31 downto 0)<= i_a(31 downto 0) and i_b(31 downto 0);
result(32)<='Z';
 

end Behavioral;

