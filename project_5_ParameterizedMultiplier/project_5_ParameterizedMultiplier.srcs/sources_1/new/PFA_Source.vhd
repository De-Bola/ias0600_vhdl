----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/18/2021 01:49:41 AM
-- Design Name: 
-- Module Name: PFA_Source - Behavioral
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

entity PFA_Source is
    Port ( A, B, carry_in : in STD_LOGIC;
    Sum, Prop, Gen : out std_logic);
end PFA_Source;
 
architecture Behavioral of PFA_Source is
 
begin
 
Sum <= A xor B xor carry_in;
Prop <= A xor B;
Gen <= A and B;

end Behavioral;
