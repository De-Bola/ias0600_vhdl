----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Adebola Gbiri
-- 
-- Create Date: 11/03/2021 04:27:32 PM
-- Design Name: 
-- Module Name: Bin_2_7_SegDecoder - Behavioral
-- Project Name: Binary to Seven Segment Decoder
-- Target Devices: Devices with common anode
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

entity Bin_2_7_SegDecoder is
    Port ( sw_input : in STD_LOGIC_VECTOR (3 downto 0);
           seg_output : out std_logic_vector(6 downto 0));
--           ANode : out STD_LOGIC_VECTOR (7 downto 0));
end Bin_2_7_SegDecoder;

architecture Behavioral of Bin_2_7_SegDecoder is

--signal temp : std_logic_vector(6 downto 0);
signal CA, CB, CC, CD, CE, CF, CG : std_logic;

begin

--ANode <= "11111110";

-- uncomment line 42 and this part if 7 segment has common cathode
--temp  <=      "1111110" when (sw_input = "0000") else --0
--              "0110000" when (sw_input = "0001") else --1
--              "1101101" when (sw_input = "0010") else --2
--              "1111001" when (sw_input = "0011") else --3
--              "0110011" when (sw_input = "0100") else --4
--              "1011011" when (sw_input = "0101") else --5
--              "1011111" when (sw_input = "0110") else --6
--              "1110000" when (sw_input = "0111") else --7
--              "1111111" when (sw_input = "1000") else --8
--              "1111011" when (sw_input = "1001") else --9
--              "1110111" when (sw_input = "1010") else --A
--              "0011111" when (sw_input = "1011") else --b
--              "1001110" when (sw_input = "1100") else --C
--              "0111101" when (sw_input = "1101") else --d
--              "1001111" when (sw_input = "1110") else --E
--              "1000111" when (sw_input = "1111") else --F
--              "0000000"; --others
--seg_output <= temp;

-- uncomment this part if 7 segment has common anode
--seg_output <= not temp;
--temp <= "0000001" when (sw_input = "0000") else --0
--              "1001111" when (sw_input = "0001") else --1
--              "0010010" when (sw_input = "0010") else --2
--              "0000110" when (sw_input = "0011") else --3
--              "1001100" when (sw_input = "0100") else --4
--              "0100100" when (sw_input = "0101") else --5
--              "0100000" when (sw_input = "0110") else --6
--              "0001111" when (sw_input = "0111") else --7
--              "0000000" when (sw_input = "1000") else --8
--              "0000100" when (sw_input = "1001") else --9
--              "0001000" when (sw_input = "1010") else --A
--              "1100000" when (sw_input = "1011") else --b
--              "0110001" when (sw_input = "1100") else --C
--              "1000010" when (sw_input = "1101") else --d
--              "0110000" when (sw_input = "1110") else --E
--              "0111000" when (sw_input = "1111") else --F
--              "0000000"; --others
--seg_output <= temp;

-- For boolean logic:
-- sw_input and temp are buses with size 4, representing ABCD
-- CA : A'B'C'D + A'BC'D' + ABC'D + AB'CD
CA <=  ((not sw_input(3) and not sw_input(2)) and (not sw_input(1) and sw_input(0))) or 
       ((not sw_input(3) and sw_input(2)) and (not sw_input(1) and  not sw_input(0))) or
       ((sw_input(3) and sw_input(2)) and (not sw_input(1) and sw_input(0))) or
       ((sw_input(3) and not sw_input(2)) and (sw_input(1) and sw_input(0)));
       
-- CB : A'BC'D + BCD' + ABD' + ACD       
CB <=  ((not sw_input(3) and sw_input(2)) and (not sw_input(1) and sw_input(0))) or 
       (sw_input(2) and (sw_input(1) and  not sw_input(0))) or
       ((sw_input(3) and sw_input(2)) and not sw_input(0)) or
       (sw_input(3) and (sw_input(1) and sw_input(0)));
       
-- CC : A'B'CD' + ABD' + ABC
CC <=  ((not sw_input(3) and not sw_input(2)) and (sw_input(1) and not sw_input(0))) or 
       ((sw_input(3) and sw_input(2)) and not sw_input(0)) or
       ((sw_input(3) and sw_input(2)) and sw_input(1));
       
-- CD : A'B'C'D + A'BC'D' + BCD + AB'CD'
CD <=  ((not sw_input(3) and not sw_input(2)) and (not sw_input(1) and sw_input(0))) or 
       ((not sw_input(3) and sw_input(2)) and (not sw_input(1) and  not sw_input(0))) or
       (sw_input(2) and (sw_input(1) and sw_input(0))) or
       ((sw_input(3) and not sw_input(2)) and (sw_input(1) and not sw_input(0)));

-- CE : B'C'D + A'BC' + A'D       
CE <=  (not sw_input(2) and (not sw_input(1) and sw_input(0))) or 
       ((not sw_input(3) and sw_input(2)) and not sw_input(1)) or
       (not sw_input(3) and sw_input(0));

-- CF : A'B'D + A'B'C + A'CD + ABC'D       
CF <=  ((not sw_input(3) and not sw_input(2)) and sw_input(0)) or 
       ((not sw_input(3) and not sw_input(2)) and sw_input(1)) or
       (not sw_input(3) and (sw_input(1) and sw_input(0))) or
       ((sw_input(3) and sw_input(2)) and (not sw_input(1) and sw_input(0)));

-- CG : A'B'C' + A'BCD + ABC'D'       
CG <=  ((not sw_input(3) and not sw_input(2)) and not sw_input(1)) or 
       ((not sw_input(3) and sw_input(2)) and (sw_input(1) and sw_input(0))) or
       ((sw_input(3) and sw_input(2)) and (not sw_input(1) and not sw_input(0)));
       
seg_output(6) <= CA;
seg_output(5) <= CB;
seg_output(4) <= CC;
seg_output(3) <= CD;
seg_output(2) <= CE;
seg_output(1) <= CF;
seg_output(0) <= CG;
     
end Behavioral;
