----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/17/2021 05:24:21 PM
-- Design Name: 
-- Module Name: RCA_tb - Behavioral
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

entity RCA_tb is
--  Port ( );
end RCA_tb;

architecture Behavioral of RCA_tb is

signal carry_in_tb : std_logic := '0';
signal n : natural := 4;
signal a_tb, b_tb : std_logic_vector(n -1 downto 0);
signal output_tb : std_logic_vector(n downto 0);
signal counter : integer := ((2**n) - 1);

begin

UUT : entity work.RCA_Source generic map (n) port map (a_tb, b_tb, carry_in_tb, output_tb);

stimuli : process

begin

wait for 10 ns;

for i in 0 to counter loop
    for j in 0 to counter loop
        a_tb <= std_logic_vector(to_unsigned(i, n));
        b_tb <= std_logic_vector(to_unsigned(j, n));
        wait for 10 ns;
    end loop;
end loop;
wait;
end process stimuli;


end Behavioral;
