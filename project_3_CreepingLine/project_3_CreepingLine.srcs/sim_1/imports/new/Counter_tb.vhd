----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/20/2021 05:29:42 PM
-- Design Name: 
-- Module Name: Counter_tb - Behavioral
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

entity Counter_tb is
--    Port ();
end Counter_tb;

architecture Behavioral of Counter_tb is

signal pulse : std_logic_vector(1 downto 0) := "00";
signal clk, rst, is_done : std_logic := '0';

signal main_sw : STD_LOGIC_VECTOR (15 downto 0);
signal anode : STD_LOGIC_VECTOR (7 downto 0);
signal seven_seg : STD_LOGIC_VECTOR (6 downto 0);

begin

--UUT1: entity work.FirstStep port map (sw_input => main_sw(3 downto 0), anode_out => "11111110", seven_seg_out => seven_seg);

--UUT2: entity work.SecondStep port map(input_1 => main_sw(3 downto 0), input_2 => main_sw(7 downto 4), input_3 => main_sw(11 downto 8), 
--                    input_4 => main_sw(15 downto 12), anode_out => anode, seven_seg_out => seven_seg, clock_100MHz => clk, reset => rst);

UUT3: entity work.ThirdStep port map(clock_100MHz => clk, reset => rst, anode_out => anode, seven_seg_out => seven_seg);

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
wait for 20 ns;
main_sw <= "0100001100100001";
wait for 1024 ms;
is_done <= '1';
wait;
end process;

end Behavioral;
