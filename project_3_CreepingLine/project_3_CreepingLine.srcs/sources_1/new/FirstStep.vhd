----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/16/2021 01:01:19 PM
-- Design Name: 
-- Module Name: FirstStep - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FirstStep is
    Port ( sw_input : in STD_LOGIC_VECTOR (3 downto 0);
           anode_out : out STD_LOGIC_VECTOR (7 downto 0);
           seven_seg_out : out STD_LOGIC_VECTOR (6 downto 0));
end FirstStep;

architecture Behavioral of FirstStep is

component Bin_2_7_SegDecoder is
    Port ( sw_input : in STD_LOGIC_VECTOR (3 downto 0);
           seg_output : out std_logic_vector(6 downto 0));
end component;

begin
anode_out <= "11111110";

-- bin to 7 seg
SSeg: Bin_2_7_SegDecoder port map (sw_input => sw_input, seg_output => seven_seg_out);

end Behavioral;
