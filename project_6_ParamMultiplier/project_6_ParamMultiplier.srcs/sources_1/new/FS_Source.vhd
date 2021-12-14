----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/19/2021 07:53:50 PM
-- Design Name: 
-- Module Name: FS_Source - Behavioral
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

entity FS_Source is
    Port ( a_in : in STD_LOGIC;
           b_in : in STD_LOGIC;
           borrow_in : in STD_LOGIC;
           borrow_out : out STD_LOGIC;
           difference : out std_logic);
end FS_Source;

architecture Behavioral of FS_Source is

begin

borrow_out <= ((not a_in) and b_in) or ((not a_in) and borrow_in) or (borrow_in and b_in);
difference <= a_in xor b_in xor borrow_in;

end Behavioral;
