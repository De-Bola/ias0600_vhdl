----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/16/2021 06:37:01 PM
-- Design Name: 
-- Module Name: CLA_Adder - Behavioral
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

entity CLA_Adder is generic (width :  natural);
    Port ( input_A : in STD_LOGIC_VECTOR (width - 1 downto 0);
           input_B : in STD_LOGIC_VECTOR (width - 1 downto 0);
           carry_input : in STD_LOGIC;
           sum_out : out STD_LOGIC_VECTOR (width downto 0));
end CLA_Adder;

architecture Behavioral of CLA_Adder is

signal temp_sum : std_logic_vector (width - 1 downto 0);
signal temp_carry : std_logic_vector (width downto 0);

begin

temp_carry(0) <= carry_input;

CLA: for i in 1 to width generate
--                              previous_generators                    previous_propagators               previous_carry
        temp_carry(i) <= (input_A(i - 1) and input_B(i - 1)) or ((input_A(i - 1) xor input_B(i - 1)) and temp_carry(i - 1));        
        temp_sum(i - 1) <= input_A(i - 1) xor input_B(i - 1) xor temp_carry(i - 1);
    end generate CLA;

sum_out <= temp_carry(width) & temp_sum((width - 1) downto 0);    

end Behavioral;
