----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/17/2021 05:58:16 PM
-- Design Name: 
-- Module Name: Multiplier - Behavioral
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

entity Multiplier is 
    generic (msb_1 : natural := 4;
--            adder_type : string := "ripple-carry"; 
            adder_type : string := "look-ahead");
    Port (multiplier : in std_logic_vector((msb_1 - 1) downto 0);
        multiplicand : in std_logic_vector((msb_1 - 1) downto 0);
        product : out std_logic_vector((msb_1 + msb_1 - 1) downto 0);
        anode_out : out STD_LOGIC_VECTOR (7 downto 0);
        seven_seg_out : out STD_LOGIC_VECTOR (6 downto 0);
        clock_100MHz, reset : in STD_LOGIC);
end Multiplier;

architecture Behavioral of Multiplier is

type constr_array_1 is array (0 to msb_1 - 1) of std_logic_vector ((msb_1 - 1) downto 0);
type constr_array_2 is array (0 to (msb_1 - 1)) of std_logic_vector((msb_1) downto 0);

signal temp_1 : constr_array_1; -- contains partial sums
signal temp_product : constr_array_2;
signal display_cable : std_logic_vector(15 downto 0) := "0000000000000000";

begin

-- making partial sums
Partial_Sums_i : for i in 0 to msb_1 - 1 generate
    Partial_Sums_j : for j in 0 to msb_1 - 1 generate
        temp_1(i)(j) <= multiplier(i) and multiplicand(j);
    end generate Partial_Sums_j;
end generate Partial_Sums_i;    

temp_product(0) <= '0'&temp_1(0);

Multiplication: for k in 1 to (msb_1 - 1) generate -- for n-bit multiplicands, n-bit - 1 RCAs are needed

    ripple_carry : if adder_type = "ripple-carry" generate
        RCA_i : entity work.RCA_Source generic map(msb_1) port map (temp_1(k), temp_product(k - 1)(msb_1 downto 1), '0', temp_product(k));
    end generate ripple_carry;
    
    carry_look_ahead : if adder_type = "look-ahead" generate
        CLA_i : entity work.CLA_Adder generic map(msb_1) port map (temp_1(k), temp_product(k - 1)(msb_1 downto 1), '0', temp_product(k));
    end generate carry_look_ahead;
    
end generate Multiplication;

Prod : for i in 0 to (msb_1 - 2) generate
    product(i) <= temp_product(i)(0);
    display_cable(i) <= temp_product(i)(0);
end generate Prod;

product((msb_1 + msb_1 - 1) downto msb_1 - 1) <= temp_product(msb_1 - 1);

display_cable((msb_1 + msb_1 - 1) downto msb_1 - 1) <=  temp_product(msb_1 - 1) when ((msb_1 + msb_1 - 1) < 16) else "0000000000000000";

display_out : entity work.SecondStep port map (display_cable(3 downto 0), display_cable(7 downto 4), 
             display_cable(11 downto 8), display_cable(15 downto 12), anode_out, seven_seg_out, clock_100MHz, reset);    

end Behavioral;
