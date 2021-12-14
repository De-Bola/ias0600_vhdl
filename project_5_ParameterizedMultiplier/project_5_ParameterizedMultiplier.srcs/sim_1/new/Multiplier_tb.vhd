----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/17/2021 06:45:57 PM
-- Design Name: 
-- Module Name: Multiplier_tb - Behavioral
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

entity Multiplier_tb is
--  Port ( );
end Multiplier_tb;

architecture Behavioral of Multiplier_tb is

signal carry_in_tb, is_done, clk : std_logic := '0';
signal n : natural := 4;
signal a_tb, b_tb : std_logic_vector(n -1 downto 0);
signal RCA_product_tb, CLA_product_tb : std_logic_vector((2*n-1) downto 0);
signal counter : integer := ((2**n) - 1);
signal anode_tb : STD_LOGIC_VECTOR (7 downto 0);
signal seven_seg_tb : STD_LOGIC_VECTOR (6 downto 0);
signal rst : STD_LOGIC;

begin

UUT1 : entity work.Multiplier generic map(n, "ripple-carry") port map (a_tb, b_tb, RCA_product_tb, anode_tb, seven_seg_tb, clk, rst);
UUT2 : entity work.Multiplier generic map(n, "look-ahead") port map (a_tb, b_tb, CLA_product_tb, anode_tb, seven_seg_tb, clk, rst);

clock_process : process

begin
    if(is_done = '0') then clk <= '0';
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;
    else clk <= '0';
        wait for 10 ns;
    end if;
end process;

stimuli : process
begin

wait for 10 ns;
rst <= '1';
wait for 10 ns;
rst <= '0';
is_done <= '0';
wait for 10 ns;

for i in 0 to counter loop
    for j in 0 to counter loop
    
        a_tb <= std_logic_vector(to_unsigned(i, n));
        b_tb <= std_logic_vector(to_unsigned(j, n));
        wait for 10 ns;
        
        assert(RCA_product_tb /= std_logic_vector(to_unsigned(i * j, n + n - 1))) -- asserting for fail statement for RCA based multiplier
        report "Failure at a_tb = " & integer'image(to_integer(unsigned(a_tb))) & " and b_tb = " & integer'image(to_integer(unsigned(b_tb))) 
        & " RCA_Product = " & integer'image(to_integer(unsigned(RCA_product_tb))) & " not equal to " & integer'image(i * j) severity ERROR;
        
        assert(RCA_product_tb = std_logic_vector(to_unsigned(i * j, n + n - 1))) -- asserting for pass statement for RCA based multiplier
        report "Pass at a_tb = " & integer'image(to_integer(unsigned(a_tb))) & " and b_tb = " & integer'image(to_integer(unsigned(b_tb))) 
        & " RCA_Product = " & integer'image(to_integer(unsigned(RCA_product_tb))) & " equal to " & integer'image(i * j) severity NOTE;
        
        assert(CLA_product_tb /= std_logic_vector(to_unsigned(i * j, n + n - 1))) -- asserting for fail statement for CLA based multiplier
        report "Failure at a_tb = " & integer'image(to_integer(unsigned(a_tb))) & " and b_tb = " & integer'image(to_integer(unsigned(b_tb))) 
        & " CLA_Product = " & integer'image(to_integer(unsigned(CLA_product_tb))) & " not equal to " & integer'image(i * j) severity ERROR;
        
        assert(CLA_product_tb = std_logic_vector(to_unsigned(i * j, n + n - 1))) -- asserting for pass statement for CLA based multiplier
        report "Pass at a_tb = " & integer'image(to_integer(unsigned(a_tb))) & " and b_tb = " & integer'image(to_integer(unsigned(b_tb))) 
        & " CLA_Product = " & integer'image(to_integer(unsigned(CLA_product_tb))) & " equal to " & integer'image(i * j) severity NOTE;
        
    end loop;
end loop;

wait for 10 ns;
is_done <= '1';
wait;
end process stimuli; 
end Behavioral;
