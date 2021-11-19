----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/16/2021 01:30:30 PM
-- Design Name: 
-- Module Name: ThirdStep - Behavioral
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

entity ThirdStep is
    Port ( clock_100MHz, reset : in STD_LOGIC;
           anode_out : out STD_LOGIC_VECTOR (7 downto 0);
           seven_seg_out : out STD_LOGIC_VECTOR (6 downto 0));
end ThirdStep;

architecture Behavioral of ThirdStep is

component Bin_2_7_SegDecoder is
    Port ( sw_input : in STD_LOGIC_VECTOR (3 downto 0);
           seg_output : out std_logic_vector(6 downto 0));
end component;

signal clock_250Hz, clock_1Hz : std_logic;
signal temp : std_logic_vector(2 downto 0);
signal counter_1 : integer range 0 to 399999; -- for counter
signal counter_2 : integer range 0 to 99999999; -- for shift register
signal output : STD_LOGIC_VECTOR (3 downto 0); -- bcd for 7seg
signal circular_shift_reg : std_logic_vector(0 to 31) := "00000000000110000100011000000011"; -- the circular shift register to be used
-- the circular shift register is initialized with the value 00184603

begin

-- slow down the 100 MHz clock to 62.5 Hz
--down conversion for counter
process (clock_100MHz)
begin
    if clock_100MHz'event and clock_100MHz = '1' then
        if counter_1 < 399999 then
            counter_1 <= counter_1 + 1;
            clock_250Hz <= '0';
        else
            counter_1 <= 0;
            clock_250Hz <= '1';
        end if;
    end if;
end process;

--3-bit counter
process (clock_100MHz)
    begin
     if clock_100MHz'event and clock_100MHz = '1' then
         if reset = '1' then
            temp <= (others => '0');
         elsif clock_250Hz = '1' then
            temp <= std_logic_vector(unsigned(temp) + 1);
         end if;
     end if;
end process;

-- slow down the 100 MHz clock to 1 Hz
--down conversion for shift register
process (clock_100MHz)
begin
    if clock_100MHz'event and clock_100MHz = '1' then
        if counter_2 < 99999999 then
            counter_2 <= counter_2 + 1;
            clock_1Hz <= '0';
        else
            counter_2 <= 0;
            clock_1Hz <= '1';
        end if;
    end if;
end process;

--shift register
process(clock_100MHz)
begin
 if clock_100MHz'event and clock_100MHz = '1' then 
    if clock_1Hz = '1' then     
          circular_shift_reg(4 to 31) <= circular_shift_reg(0 to 27); 
          circular_shift_reg(0 to 3) <= circular_shift_reg(28 to 31);
    end if;
 end if;
end process;

-- counter decoder
anode_out <= "11111110" when (temp = "000") else
             "11111101" when (temp = "001") else
             "11111011" when (temp = "010") else
             "11110111" when (temp = "011") else
             "11101111" when (temp = "100") else
             "11011111" when (temp = "101") else
             "10111111" when (temp = "110") else
             "01111111" when (temp = "111") else
             "11111111";

-- MUX             
with temp select
output <= circular_shift_reg(0 to 3) when "111",
          circular_shift_reg(4 to 7) when "110",
          circular_shift_reg(8 to 11) when "101",
          circular_shift_reg(12 to 15) when "100",
          circular_shift_reg(16 to 19) when "011",
          circular_shift_reg(20 to 23) when "010",
          circular_shift_reg(24 to 27) when "001",
          circular_shift_reg(28 to 31) when "000",
          output when others;

-- bin to 7 seg
SSeg: Bin_2_7_SegDecoder port map (sw_input => output, seg_output => seven_seg_out);

end Behavioral;
