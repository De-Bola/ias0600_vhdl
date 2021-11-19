----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/08/2021 04:29:35 PM
-- Design Name: 
-- Module Name: and_gate_tb - Behavioral
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

entity and_gate_tb is
--  Port ( );
end and_gate_tb;

architecture Behavioral of and_gate_tb is

signal a_tb, b_tb : std_logic;
signal c_tb : std_logic_vector(5 downto 0);

begin

UUT : entity work.and_gate
        port map(a => a_tb, b => b_tb, c => c_tb);

stimuli : process
begin
a_tb <= '0'; b_tb <= '0';
wait for 10 ns;

a_tb <= '0'; b_tb <= '1';
wait for 10 ns;

a_tb <= '1'; b_tb <= '0';
wait for 10 ns;

a_tb <= '1'; b_tb <= '1';
wait for 10 ns;
wait;
end process;

end Behavioral;
