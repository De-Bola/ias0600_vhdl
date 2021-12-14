----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/10/2021 05:22:06 PM
-- Design Name: 
-- Module Name: CounterDecoder - Behavioral
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

entity CounterDecoder is
    Port ( counter : in STD_LOGIC_VECTOR (1 downto 0);
           decoder : out STD_LOGIC_VECTOR (3 downto 0));
end CounterDecoder;

architecture Behavioral of CounterDecoder is

begin

--decoder(counter)
decoder <= "11111110" when (counter = "00") else
           "11111101" when (counter = "01") else
           "11111011" when (counter = "10") else
           "11110111" when (counter = "11") else
           "11111111";

end Behavioral;
