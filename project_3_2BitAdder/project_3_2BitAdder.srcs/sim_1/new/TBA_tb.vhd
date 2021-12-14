----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/06/2021 06:24:23 PM
-- Design Name: 
-- Module Name: TBA_tb - Structural
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TBA_tb is
--   Port ( );
end TBA_tb;

architecture Structural of TBA_tb is

signal a_tb, b_tb : STD_LOGIC_VECTOR(1 downto 0);
signal sum_carry_tb1, sum_carry_tb2 : STD_LOGIC_VECTOR(2 downto 0);
signal sum, carry : std_logic;

begin

UUT1 : entity work.TBA_Source port map (a_vector => a_tb, b_vector => b_tb, sum_and_carry_vector => sum_carry_tb1);
UUT2 : entity work.TBA_Block_wrapper port map (a_tb(0), a_tb(1), b_tb(0), b_tb(1), sum_carry_tb2(2), sum_carry_tb2(0), sum_carry_tb2(1));
-- UUT3 : entity work.FA_Block_wrapper port map (a_tb(0), a_tb(1), '0', carry, sum);

stimuli : process

begin

for i in 1 to 3 loop
    for j in 1 to 3 loop
        a_tb <= std_logic_vector(to_unsigned(i,2));
        b_tb <= std_logic_vector(to_unsigned(j,2));
        wait for 10 ns;
    end loop;
end loop;
     
wait;
end process;

end Structural;
