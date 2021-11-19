----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/22/2021 06:45:53 PM
-- Design Name: 
-- Module Name: whenStatement_designApproach - Behavioral
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

entity whenStatement_designApproach is
    Port ( a, b : in STD_LOGIC_VECTOR (1 downto 0);
           equal, aGreater, aLesser : out STD_LOGIC);
end whenStatement_designApproach;

architecture Behavioral of whenStatement_designApproach is

begin

aGreater <= '1' when (a = "01" and b = "00") else
            '1' when (a = "10" and (b = "01" or b = "00")) else
            '1' when (a = "11" and (b = "01" or b = "00" or b = "10")) else
            '0'; 
            
aLesser <= '1' when (b = "01" and a = "00") else
           '1' when (b = "10" and (a = "01" or a = "00")) else
           '1' when (b = "11" and (a = "01" or a = "00" or a = "10")) else
           '0';             

equal <= '1' when a = "00" and b = "00" else 
         '1' when a = "01" and b = "01" else 
         '1' when a = "10" and b = "10" else 
         '1' when a = "11" and b = "11" else 
         '0';

end Behavioral;
