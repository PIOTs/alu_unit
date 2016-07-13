----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:12:34 09/25/2015 
-- Design Name: 
-- Module Name:    lft_shift - Behavioral 
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

entity lft_shift is
port(i_a:in std_logic_vector(31 downto 0);
	  cin:in std_logic;
	  result:out std_logic_vector(32 downto 0));
end lft_shift;

architecture Behavioral of lft_shift is

begin
result(32)<=i_a(31);
result(31 downto 1)<=i_a(30 downto 0);
result(0)<=cin;


end Behavioral;

