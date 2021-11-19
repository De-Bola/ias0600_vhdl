library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity HA_source is
    Port ( a, b : in STD_LOGIC;
           sum, carry : out STD_LOGIC);
end HA_source;

architecture Behavioral of HA_source is

begin

sum <= a XOR b;
carry <= a AND b;

end Behavioral;