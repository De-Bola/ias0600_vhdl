----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/22/2021 06:45:53 PM
-- Design Name: 
-- Module Name: withStatement_designApproach - Behavioral
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

entity withStatement_designApproach is
    Port ( a : in STD_LOGIC_VECTOR (1 downto 0);
           b : in STD_LOGIC_VECTOR (1 downto 0);
           equal : out STD_LOGIC;
           aGreater : out STD_LOGIC;
           aLesser : out STD_LOGIC);
end withStatement_designApproach;

architecture Behavioral of withStatement_designApproach is

begin

with b&a select           
aGreater <= '1' when "0001" | "0011" | "0010" | "0111" | "0110" | "1011",
            '0' when others;  

with a&b select            
aLesser <= '1' when "0001" | "0011" | "0010" | "0111" | "0110" | "1011",
           '0' when others;             

with a&b select
equal <= '1' when "0000" | "0101" | "1010" | "1111", 
         '0' when others;

end Behavioral;
