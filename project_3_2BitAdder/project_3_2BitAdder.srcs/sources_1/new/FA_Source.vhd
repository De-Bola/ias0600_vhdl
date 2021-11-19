----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/06/2021 04:56:43 PM
-- Design Name: 
-- Module Name: FA_Source - Behavioral
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

entity FA_Source is
    Port ( a_in : in STD_LOGIC;
           b_in : in STD_LOGIC;
           carry_in : in STD_LOGIC;
           sum : out STD_LOGIC;
           carry_out : out STD_LOGIC);
end FA_Source;

architecture Structural of FA_Source is

signal sum_ha1, carry_ha1, carry_ha2 : std_logic;

begin

HA1 : entity work.HA_source port map(a_in, b_in, sum_ha1, carry_ha1);
HA2 : entity work.HA_source port map(sum_ha1, carry_in, sum, carry_ha2);
HA3 : entity work.HA_source port map(carry_ha1, carry_ha2, carry_out, open);

end Structural;
