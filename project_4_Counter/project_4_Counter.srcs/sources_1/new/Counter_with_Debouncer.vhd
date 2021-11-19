----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/27/2021 04:44:04 PM
-- Design Name: 
-- Module Name: Counter_with_Debouncer - Behavioral
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

entity Counter_with_Debouncer is
    Port ( pulse_output : out STD_LOGIC_VECTOR (3 downto 0);
           serial_input : in STD_LOGIC;
           clock_100MHz : in STD_LOGIC;
           reset : in STD_LOGIC);
--           enable : in STD_LOGIC);
end Counter_with_Debouncer;

architecture Behavioral of Counter_with_Debouncer is

signal button_buf_1, button_buf_2, enable : std_logic;
signal temp1 : std_logic_vector(0 to 3);
signal temp2 : std_logic_vector(3 downto 0);
signal clock_100Hz : std_logic;
signal counter : integer range 0 to 999999;
signal debouncer_output : std_logic;

begin

-- slow down the 100 MHz clock to 100 Hz
process (clock_100MHz)
begin
    if clock_100MHz'event and clock_100MHz = '1' then
        if counter < 999999 then
            counter <= counter + 1;
            clock_100Hz <= '0';
        else
            counter <= 0;
            clock_100Hz <= '1';
        end if;
    end if;
end process;

-- make the shift-register/debouncer
process (clock_100MHz)
begin
    if clock_100MHz'event and clock_100MHz = '1' then
        if reset = '1' then
            temp1 <= (others => '0');
        elsif clock_100Hz = '1' then
            temp1(0) <= serial_input;
            temp1(1 to 3) <= temp1(0 to 2);
        end if;
    end if;
end process;

-- shift register outputs [temp1 vector] all go to and gate which gives the debouncer's output pulse 
debouncer_output <= temp1(0) and temp1(1) and temp1(2)and temp1(3);

-- edge detection
button_buf_1 <= debouncer_output when rising_edge(clock_100MHz);
button_buf_2 <= button_buf_1 when rising_edge(clock_100MHz);
enable <= button_buf_1 and not button_buf_2;

-- counter with debouncer
process (clock_100MHz)
    begin
     if clock_100MHz'event and clock_100MHz = '1' then
         if reset = '1' then
            temp2 <= (others => '0');
         elsif enable = '1' then
            temp2 <= std_logic_vector(unsigned(temp2) + 1);
         end if;
     end if;
end process;

pulse_output <= temp2;

end Behavioral;
