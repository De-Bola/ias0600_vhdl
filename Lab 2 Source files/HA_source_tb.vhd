library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity HA_source_tb is
end HA_source_tb;

architecture Behavioral of HA_source_tb is

signal a_tb, b_tb : std_logic := '0';
signal sum_tb, carry_tb : std_logic;

begin

UUT : entity work.HA_source
      port map ( a => a_tb, 
                 b => b_tb,
                 sum => sum_tb,
                 carry => carry_tb );

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