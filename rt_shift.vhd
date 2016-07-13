----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:07:05 09/25/2015 
-- Design Name: 
-- Module Name:    rt_shift - Behavioral 
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

entity rt_shift is
port(i_a:in std_logic_vector(31 downto 0);
	  cin:in std_logic;
	  result:out std_logic_vector(32 downto 0));
end rt_shift;

architecture Behavioral of rt_shift is

begin
result(30 downto 0)<= i_a(31 downto 1);
result(31)<=cin;
result(32)<=i_a(0);

end Behavioral;

