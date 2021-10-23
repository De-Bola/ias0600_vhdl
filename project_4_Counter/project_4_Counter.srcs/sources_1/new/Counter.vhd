----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/20/2021 04:32:29 PM
-- Design Name: 
-- Module Name: edgeDetector - Behavioral
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

entity Counter is
    Port ( button_input : in std_logic_vector;
           clock_100MHz, reset, enable : in std_logic;
           pulse_output : out std_logic_vector);
end Counter;

architecture Behavioral of Counter is

signal button_buf_1, button_buf_2 : std_logic_vector;

begin

button_buf_1 <= button_input when rising_edge(clock_100MHz);
button_buf_2 <= button_buf_1 when rising_edge(clock_100MHz);
pulse_output <= button_buf_1 and not button_buf_2;


process (clock_100MHz)
    begin
     if clock_100MHz'event and clock_100MHz = '1' then
         if reset = '1' then
            pulse_output <= (others => '0');
         elsif enable = '1' then
            pulse_output <= std_logic_vector(unsigned(pulse_output) + 1);
         end if;
     end if;
end process;

end Behavioral;
