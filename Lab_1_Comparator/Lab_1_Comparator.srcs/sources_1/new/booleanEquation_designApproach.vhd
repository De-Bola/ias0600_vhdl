----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/22/2021 06:45:53 PM
-- Design Name: 
-- Module Name: booleanEquation_designApproach - Behavioral
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

entity booleanEquation_designApproach is
    Port ( a : in STD_LOGIC_VECTOR (1 downto 0);
           b : in STD_LOGIC_VECTOR (1 downto 0);
           equal : out STD_LOGIC;
           aGreater : out STD_LOGIC;
           aLesser : out STD_LOGIC);
end booleanEquation_designApproach;

architecture Behavioral of booleanEquation_designApproach is

signal aLesserTemp: STD_LOGIC;
signal aGreaterTemp: STD_LOGIC;

begin
-- my ref : https://www.geeksforgeeks.org/magnitude-comparator-in-digital-logic/ 
-- A=B: A1'A0'B1'B0' + A1'A0B1'B0 + A1A0B1B0 + A1A0'B1B0'
--   : A1'B1' (A0'B0' + A0B0) + A1B1 (A0B0 + A0'B0')
--   : (A0B0 + A0'B0') (A1B1 + A1'B1')
--   : (A0 Ex-Nor B0) (A1 Ex-Nor B1)

aLesserTemp <= (not a(1) and b(1)) or (not a(0) and b(0) and b(1)) or (not a(0) and not a(1) and b(0)); -- A<B:A1'B1 + A0'B1B0 + A1'A0'B0
aGreaterTemp <=  (a(1) and not b(1)) or (a(0) and not b(0) and not b(1)) or (a(0) and a(1) and not b(0)); -- A>B:A1B1' + A0B1'B0' + A1A0B0'

aLesser <= aLesserTemp;
aGreater <= aGreaterTemp;

equal <= aLesserTemp nor aGreatertemp;

end Behavioral;
