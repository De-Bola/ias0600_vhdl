----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/18/2021 01:51:35 PM
-- Design Name: 
-- Module Name: CLA_tb - Behavioral
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

entity CLA_tb is
--  Port ( );
end CLA_tb;

architecture Behavioral of CLA_tb is

signal carry_in_tb : std_logic := '0';
signal a_in_tb, b_in_tb, borrow_out_tb_1, borrow_out_tb_2 : std_logic;
signal difference_tb_1, difference_tb_2 : std_logic;
signal n : natural := 4;
signal a_tb, b_tb : std_logic_vector(n -1 downto 0);
signal output_tb : std_logic_vector(n downto 0);
signal counter : integer := ((2**n) - 1);

begin

--UUT1 : entity work.CLA_Adder generic map (n) port map (a_tb, b_tb, carry_in_tb, output_tb);
UUT2 : entity work.Subtractor generic map (n) port map (a_tb, b_tb, carry_in_tb, output_tb);
--UUT3 : entity work.HS_Source port map (a_in_tb, b_in_tb, borrow_out_tb_1, difference_tb_1);
--UUT4 : entity work.FS_Source port map (a_in_tb, b_in_tb, '0', borrow_out_tb_2, difference_tb_2);

stimuli : process

begin

wait for 10 ns;

--a_in_tb <= '0'; b_in_tb <= '0';
--wait for 10 ns;

--a_in_tb <= '0'; b_in_tb <= '0';
--wait for 10 ns;

--a_in_tb <= '0'; b_in_tb <= '1';
--wait for 10 ns;

--a_in_tb <= '0'; b_in_tb <= '1';
--wait for 10 ns;

--a_in_tb <= '1'; b_in_tb <= '0';
--wait for 10 ns;

--a_in_tb <= '1'; b_in_tb <= '0';
--wait for 10 ns;

--a_in_tb <= '1'; b_in_tb <= '1';
--wait for 10 ns;

--a_in_tb <= '1'; b_in_tb <= '1';
--wait for 10 ns;

--a_in_tb <= '0'; b_in_tb <= '0';
--wait for 10 ns;

--a_in_tb <= '0'; b_in_tb <= '0';
--wait for 10 ns;

--a_in_tb <= '0'; b_in_tb <= '1';
--wait for 10 ns;

--a_in_tb <= '0'; b_in_tb <= '1';
--wait for 10 ns;

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
