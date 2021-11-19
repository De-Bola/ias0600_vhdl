----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/03/2021 05:59:51 PM
-- Design Name: 
-- Module Name: 7_SegDecoder_tb - Behavioral
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

entity SevenSegDecoder_tb is
--  Port ( );
end SevenSegDecoder_tb;

architecture Behavioral of SevenSegDecoder_tb is

signal a_tb: std_logic_vector(3 downto 0);
signal output_tb : std_logic_vector(6 downto 0);

begin

UUT : entity work.Bin_2_7_SegDecoder port map (sw_input => a_tb, seg_output => output_tb);

stimuli : process
begin
 
for i in 0 to 15 loop
    a_tb <= std_logic_vector(to_unsigned(i, 4));
    wait for 10 ns;
end loop;

wait;
end process;

end Behavioral;
