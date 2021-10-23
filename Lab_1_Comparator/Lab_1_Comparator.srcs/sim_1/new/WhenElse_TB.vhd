----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/29/2021 06:02:02 PM
-- Design Name: 
-- Module Name: WhenElse_TB - Behavioral
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

entity WhenElse_TB is
    --Port ( );
end WhenElse_TB;

architecture Behavioral of WhenElse_TB is

signal a_tb, b_tb : std_logic_vector(1 downto 0);
signal equal_tb_uut1, aGreater_tb_uut1, aLesser_tb_uut1 : std_logic;
signal equal_tb_uut2, aGreater_tb_uut2, aLesser_tb_uut2 : std_logic;
signal equal_tb_uut3, aGreater_tb_uut3, aLesser_tb_uut3 : std_logic;

begin

UUT1 : entity work.whenStatement_designApproach
        port map(a => a_tb, b => b_tb, equal => equal_tb_uut1, aGreater => aGreater_tb_uut1, aLesser => aLesser_tb_uut1);
        
UUT2 : entity work.withStatement_designApproach
        port map(a => a_tb, b => b_tb, equal => equal_tb_uut2, aGreater => aGreater_tb_uut2, aLesser => aLesser_tb_uut2);
        
UUT3 : entity work.booleanEquation_designApproach
        port map(a => a_tb, b => b_tb, equal => equal_tb_uut3, aGreater => aGreater_tb_uut3, aLesser => aLesser_tb_uut3);

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
