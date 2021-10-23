----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/29/2021 04:57:42 PM
-- Design Name: 
-- Module Name: Boolean_TB - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Boolean_TB is
    -- Port ( );
end Boolean_TB;

architecture Behavioral of Boolean_TB is

signal a_tb, b_tb : std_logic_vector(1 downto 0);
signal equal_tb, aGreater_tb, aLesser_tb : std_logic;

begin

UUT : entity work.booleanEquation_designApproach
        port map(a => a_tb, b => b_tb, equal => equal_tb, aGreater => aGreater_tb, aLesser => aLesser_tb);

stimuli : process
begin

a_tb <= "00"; b_tb <= "00";
wait for 10 ns;

a_tb <= "00"; b_tb <= "01";
wait for 10 ns;

a_tb <= "00"; b_tb <= "10";
wait for 10 ns;

a_tb <= "00"; b_tb <= "11";
wait for 10 ns;

--

a_tb <= "01"; b_tb <= "00";
wait for 10 ns;

a_tb <= "01"; b_tb <= "01";
wait for 10 ns;

a_tb <= "01"; b_tb <= "10";
wait for 10 ns;

a_tb <= "01"; b_tb <= "11";
wait for 10 ns;

--

a_tb <= "10"; b_tb <= "00";
wait for 10 ns;

a_tb <= "10"; b_tb <= "01";
wait for 10 ns;

a_tb <= "10"; b_tb <= "10";
wait for 10 ns;

a_tb <= "10"; b_tb <= "11";
wait for 10 ns;

--

a_tb <= "11"; b_tb <= "00";
wait for 10 ns;

a_tb <= "11"; b_tb <= "01";
wait for 10 ns;

a_tb <= "11"; b_tb <= "10";
wait for 10 ns;

a_tb <= "11"; b_tb <= "11";
wait for 10 ns;

wait;
end process;

end Behavioral;
