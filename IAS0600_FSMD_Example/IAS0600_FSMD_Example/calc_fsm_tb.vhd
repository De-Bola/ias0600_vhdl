library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity calc_fsm_tb is
--  Port ( );
end calc_fsm_tb;

architecture Behavioral of calc_fsm_tb is

component calc_fsm is
    Port ( in1 : in STD_LOGIC_VECTOR(7 downto 0);
           in2 : in STD_LOGIC_VECTOR(7 downto 0);
           op : in STD_LOGIC_VECTOR(1 downto 0);
           start : in STD_LOGIC;
           reset : in STD_LOGIC;
           clock : in STD_LOGIC;
           done : out STD_LOGIC;
           answer : out STD_LOGIC_VECTOR(7 downto 0));
end component;

signal in1_tb, in2_tb : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
signal op_tb : STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
signal answer_tb : STD_LOGIC_VECTOR(7 downto 0);
signal start_tb, reset_tb, done_tb : STD_LOGIC;
signal clock_tb : STD_LOGIC := '0';
signal is_done : STD_LOGIC := '0';

begin

UUT : calc_fsm port map (in1 => in1_tb, in2 => in2_tb, op => op_tb,
                         start => start_tb, reset => reset_tb, clock => clock_tb,
                         done => done_tb, answer => answer_tb);

clock_tb <= not clock_tb after 5 ns when is_done /= '1' else '0';

stimuli : process
begin
    reset_tb <= '1';
    wait for 20 ns;
    reset_tb <= '0';
    wait for 10 ns;
    in1_tb <= std_logic_vector(to_unsigned(12,8));
    in2_tb <= std_logic_vector(to_unsigned(4,8));
    start_tb <= '1';
    op_tb <= "01"; -- subtraction
    wait for 10 ns;
    start_tb <= '0';
    wait for 20 ns;
	is_done <= '1';
wait;
end process;
                 
end Behavioral;
