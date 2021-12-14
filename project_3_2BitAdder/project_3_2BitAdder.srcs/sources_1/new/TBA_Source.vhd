----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/06/2021 05:45:40 PM
-- Design Name: 
-- Module Name: TBA_Source - Behavioral
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

entity TBA_Source is
    Port ( a_vector : in STD_LOGIC_VECTOR (1 downto 0);
           b_vector : in STD_LOGIC_VECTOR (1 downto 0);
           sum_and_carry_vector : out STD_LOGIC_VECTOR (2 downto 0));
end TBA_Source;

architecture Structural of TBA_Source is

component HA_Source is
    Port ( a, b : in STD_LOGIC;
           sum, carry : out STD_LOGIC);
     end component;
           
component FA_Source is
    Port ( a_in : in STD_LOGIC;
           b_in : in STD_LOGIC;
           carry_in : in STD_LOGIC;
           sum : out STD_LOGIC;
           carry_out : out STD_LOGIC);
    end component;
    
signal temp1 : std_logic;
    
begin

HA: HA_Source port map(a => a_vector(0), b => b_vector(0), sum => sum_and_carry_vector(0), carry => temp1);

FA: FA_Source port map(a_in => a_vector(1), b_in => b_vector(1), carry_in => temp1, sum => sum_and_carry_vector(1), carry_out => sum_and_carry_vector(2) );

end Structural;
