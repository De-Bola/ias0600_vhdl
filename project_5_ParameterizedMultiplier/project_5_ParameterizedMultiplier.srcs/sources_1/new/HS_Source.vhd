----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/19/2021 07:34:01 PM
-- Design Name: 
-- Module Name: HS_Source - Behavioral
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

entity HS_Source is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           borrow_out : out STD_LOGIC;
           difference : out std_logic);
end HS_Source;

architecture Behavioral of HS_Source is

begin

borrow_out <= (not a) and b;
difference <= a xor b;

end Behavioral;
