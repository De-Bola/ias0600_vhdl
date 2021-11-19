----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/16/2021 05:46:12 PM
-- Design Name: 
-- Module Name: RCA_Source - Behavioral
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

entity RCA_Source is
    generic (width :  natural := 4);
    Port ( input_A : in STD_LOGIC_VECTOR (width - 1 downto 0);
           input_B : in STD_LOGIC_VECTOR (width - 1 downto 0);
           carry_input : in STD_LOGIC;
           sum_out : out STD_LOGIC_VECTOR (width downto 0));
end RCA_Source;

architecture Behavioral of RCA_Source is

signal temp_sum : std_logic_vector (width - 1 downto 0);
signal temp_carry : std_logic_vector (width downto 0);

begin

temp_carry(0) <= carry_input;

-- for ... generate statement for variable sized adder
RCA: for i in 0 to (width - 1) generate
    FA_i : entity work.FA_Source port map (input_A(i), input_B(i), temp_carry(i), temp_sum(i), temp_carry(i + 1));
end generate RCA;    

sum_out(width - 1 downto 0) <= temp_sum;
sum_out(width) <= temp_carry(width);

end Behavioral;
