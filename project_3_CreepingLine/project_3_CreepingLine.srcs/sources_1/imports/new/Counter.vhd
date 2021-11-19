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
    Port ( clock_100MHz, reset : in std_logic;
           pulse_output : out std_logic_vector(1 downto 0));
end Counter;

architecture Behavioral of Counter is

signal clock_60Hz : std_logic;
signal temp : std_logic_vector(1 downto 0);
signal counter : integer range 0 to 1599999;

begin

-- slow down the 100 MHz clock to 62.5 Hz
process (clock_100MHz)
begin
    if clock_100MHz'event and clock_100MHz = '1' then
        if counter < 1599999 then
            counter <= counter + 1;
            clock_60Hz <= '0';
        else
            counter <= 0;
            clock_60Hz <= '1';
        end if;
    end if;
end process;

process (clock_100MHz)
    begin
     if clock_100MHz'event and clock_100MHz = '1' then
         if reset = '1' then
            temp <= (others => '0');
         elsif clock_60Hz = '1' then
            temp <= std_logic_vector(unsigned(temp) + 1);
         end if;
     end if;
end process;

pulse_output <= temp;

end Behavioral;
