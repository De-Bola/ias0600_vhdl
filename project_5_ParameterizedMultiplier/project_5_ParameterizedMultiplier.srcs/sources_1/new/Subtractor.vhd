----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/18/2021 03:10:38 PM
-- Design Name: 
-- Module Name: Subtractor - Behavioral
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

entity Subtractor is generic (width : natural);
    Port ( input_A : in STD_LOGIC_VECTOR ((width - 1) downto 0); 
           input_B : in STD_LOGIC_VECTOR ((width - 1) downto 0);
           carry_input : in STD_LOGIC;
           difference : out STD_LOGIC_VECTOR (width downto 0));
end Subtractor;

architecture Behavioral of Subtractor is

signal temp_diff, a_temp, b_temp : std_logic_vector (width - 1 downto 0);
signal temp_carry : std_logic_vector (width downto 0);

begin

temp_carry(0) <= carry_input;   

n_Subtractor: for i in 1 to width generate
        temp_carry(i) <= (not input_A(i - 1) and input_B(i - 1)) or (input_B(i - 1) and temp_carry(i - 1)) or (not input_A(i - 1) and temp_carry(i - 1));        
        temp_diff(i - 1) <= input_A(i - 1) xor input_B(i - 1) xor temp_carry(i - 1);
    end generate n_Subtractor;

difference <=   temp_carry(width) & temp_diff((width - 1) downto 0);  

end Behavioral;
