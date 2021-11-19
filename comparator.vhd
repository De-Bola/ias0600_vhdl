----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Adebola Gbiri
-- 
-- Create Date: 11/18/2021 03:21:41 PM
-- Design Name: 
-- Module Name: Comparator - Behavioral
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

entity Comparator is generic (width : natural);
    Port ( input_A : in STD_LOGIC_VECTOR (width downto 0);
           input_B : in STD_LOGIC_VECTOR (width downto 0);
           B_greater : out STD_LOGIC;
           B_equal : out STD_LOGIC);
end Comparator;

architecture Behavioral of Comparator is

signal b_LesserTemp: STD_LOGIC;
signal b_GreaterTemp: STD_LOGIC;

begin

Compare : for i in 1 to width generate
-- A<B:A1'B1 + A0'B1B0 + A1'A0'B0
        b_LesserTemp <= (not input_A(i) and input_B(i)) or 
                        (not input_A(i - 1) and input_B(i - 1) and input_B(i)) or 
                        (not input_A(i - 1) and not input_A(i) and input_B(i - 1)); 

-- A>B:A1B1' + A0B1'B0' + A1A0B0'                        
        b_GreaterTemp <=  (input_A(i) and not input_B(i)) or 
                          (input_A(i - 1) and not input_B(i - 1) and not input_B(i)) or 
                          (input_A(i - 1) and input_A(i) and not input_B(i - 1)); 
end generate Compare;

B_greater <= b_GreaterTemp;
B_equal <= b_GreaterTemp nor b_LesserTemp;

end Behavioral; 
