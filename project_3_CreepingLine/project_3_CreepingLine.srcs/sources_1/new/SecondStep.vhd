----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/10/2021 05:39:25 PM
-- Design Name: 
-- Module Name: SecondStep - Behavioral
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

entity SecondStep is
    Port ( input_1, input_2, input_3, input_4 : std_logic_vector(3 downto 0);
           anode_out : out STD_LOGIC_VECTOR (7 downto 0);
           seven_seg_out : out STD_LOGIC_VECTOR (6 downto 0);
           clock_100MHz, reset : in STD_LOGIC);
end SecondStep;

architecture Behavioral of SecondStep is

component Bin_2_7_SegDecoder is
    Port ( sw_input : in STD_LOGIC_VECTOR (3 downto 0);
           seg_output : out std_logic_vector(6 downto 0));
end component;

signal temp_anode : std_logic_vector(7 downto 0);
signal clock_250Hz : std_logic;
signal temp : std_logic_vector(1 downto 0);
signal counter : integer range 0 to 399999; -- time for 62.5 * 4 Hz in ticks
signal output : STD_LOGIC_VECTOR (3 downto 0);
--signal mux_input : std_logic_vector(15 downto 0);

begin
-- slow down the 100 MHz clock to 62.5 Hz
--down conversion
process (clock_100MHz)
begin
    if clock_100MHz'event and clock_100MHz = '1' then
        if counter < 399999 then
            counter <= counter + 1;
            clock_250Hz <= '0';
        else
            counter <= 0;
            clock_250Hz <= '1';
        end if;
    end if;
end process;

--counter
process (clock_100MHz)
    begin
     if clock_100MHz'event and clock_100MHz = '1' then
         if reset = '1' then
            temp <= "00";
         elsif clock_250Hz = '1' then
            temp <= std_logic_vector(unsigned(temp) + 1);
         end if;
     end if;
end process;

-- counter decoder
temp_anode <= "00000001" when (temp = "00") else
             "00000010" when (temp = "01") else
             "00000100" when (temp = "10") else
             "00001000" when (temp = "11") else
             "00000000";
anode_out <= not temp_anode; -- anode_out has inverse logic 

-- MUX             
with temp select
output <= input_1 when "00",
          input_2 when "01",
          input_3 when "10",
          input_4 when "11",
          "0000" when others;
          
--MUX : -- mux_input
--    entity work.MUX port map (input_1 & input_2 & input_3 & input_4, temp, output);

-- bin to 7 seg
SSeg: Bin_2_7_SegDecoder port map (sw_input => output, seg_output => seven_seg_out);
             
end Behavioral;
