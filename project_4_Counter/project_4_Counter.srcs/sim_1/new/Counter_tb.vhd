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

signal btn : std_logic := '0';
signal pulse : std_logic_vector(5 downto 0) := "000000";
signal clk, rst, is_done : std_logic := '0';
signal pulse_output_tb : std_logic_vector(3 downto 0) := "0000";

begin

UUT1: entity work.Counter port map (button_input => btn, clock_100MHz => clk, reset => rst, pulse_output => pulse);
UUT2: entity work.Counter_with_Debouncer port map (serial_input => btn, clock_100MHz => clk, reset => rst, pulse_output => pulse_output_tb);

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
rst <= '1';
wait for 20 ns;
rst <= '0';
wait for 10 ns;

-- simulating bounces
for i in 1 to 8 loop
    wait for 200 us;
    btn <= '1';
    wait for 400 us;
    btn <= '0';
end loop;

wait for 40 ns;

-- pressing button 2x
for i in 1 to 2 loop
    wait for 200 ms;
    btn <= '1';
    wait for 300 ms;
    btn <= '0';
end loop;

wait for 40 ns;

-- simulating bounces
for i in 1 to 10 loop
    wait for 200 us;
    btn <= '1';
    wait for 400 us;
    btn <= '0';
end loop;

wait for 40 ns;

-- pressing button 4x
for i in 1 to 4 loop
    wait for 200 ms;
    btn <= '1';
    wait for 300 ms;
    btn <= '0';
end loop;

wait for 40 ns;

-- simulating bounces
for i in 1 to 8 loop
    wait for 200 us;
    btn <= '1';
    wait for 400 us;
    btn <= '0';
end loop;

wait for 30 ns;
is_done <= '1';

wait for 100 ns;
wait;
end process;

end Behavioral;
