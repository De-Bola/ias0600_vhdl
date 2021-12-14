library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity calc_fsm_tb is
--  Port ( );
end calc_fsm_tb;

architecture Behavioral of calc_fsm_tb is

--component calc_fsm is
--    Port ( in1 : in STD_LOGIC_VECTOR(7 downto 0);
--           in2 : in STD_LOGIC_VECTOR(7 downto 0);
--           op : in STD_LOGIC_VECTOR(1 downto 0);
--           start : in STD_LOGIC;
--           reset : in STD_LOGIC;
--           clock : in STD_LOGIC;
--           done : out STD_LOGIC;
--           answer : out STD_LOGIC_VECTOR(7 downto 0));
--end component;

--signal in1_tb, in2_tb : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
signal in3_tb, in4_tb : STD_LOGIC_VECTOR(11 downto 0) := (others => '0');
signal answer_tb_5 : STD_LOGIC_VECTOR(11 downto 0);
--signal op_tb_1, op_tb_2, op_tb_3, op_tb_4 : STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
--signal answer_tb_1, answer_tb_2, answer_tb_3, answer_tb_4 : STD_LOGIC_VECTOR(7 downto 0);
signal start_tb, reset_tb, done_tb, confirm_tb : STD_LOGIC;
signal clock_tb, op_tb : STD_LOGIC := '0';
signal is_done : STD_LOGIC := '0';

begin

--UUT_1 : calc_fsm port map (in1 => in1_tb, in2 => in2_tb, op => op_tb_1,
--                         start => start_tb, reset => reset_tb, clock => clock_tb,
--                         done => done_tb, answer => answer_tb_1);
                         
--UUT_2 : calc_fsm port map (in1 => in1_tb, in2 => in2_tb, op => op_tb_2,
--                         start => start_tb, reset => reset_tb, clock => clock_tb,
--                         done => done_tb, answer => answer_tb_2);

--UUT_3 : calc_fsm port map (in1 => in1_tb, in2 => in2_tb, op => op_tb_3,
--                         start => start_tb, reset => reset_tb, clock => clock_tb,
--                         done => done_tb, answer => answer_tb_3);
                        
--UUT_4 : calc_fsm port map (in1 => in1_tb, in2 => in2_tb, op => op_tb_4,
--                         start => start_tb, reset => reset_tb, clock => clock_tb,
--                         done => done_tb, answer => answer_tb_4); 
                         
UUT_5 : entity work.gcd_fsm port map (in3_tb, op_tb, confirm_tb, start_tb, reset_tb, clock_tb, done_tb, answer_tb_5);                                                                                          

clock_tb <= not clock_tb after 5 ns when is_done /= '1' else '0';

--stimuli_1 : process
--begin
--    reset_tb <= '1';
--    wait for 20 ns;
--    reset_tb <= '0';
--    wait for 10 ns;
--    in1_tb <= std_logic_vector(to_unsigned(12,8));
--    in2_tb <= std_logic_vector(to_unsigned(4,8));
--    start_tb <= '1';
--    op_tb_1 <= "00"; -- addition
--    wait for 10 ns;
--    start_tb <= '0';
--    wait for 20 ns;
--	is_done <= '1';
--wait;
--end process stimuli_1;

--stimuli_2 : process
--begin
--    reset_tb <= '1';
--    wait for 20 ns;
--    reset_tb <= '0';
--    wait for 10 ns;
--    in1_tb <= std_logic_vector(to_unsigned(12,8));
--    in2_tb <= std_logic_vector(to_unsigned(4,8));
--    start_tb <= '1';
--    op_tb_2 <= "01"; -- subtraction
--    wait for 10 ns;
--    start_tb <= '0';
--    wait for 20 ns;
--	is_done <= '1';
--wait;
--end process stimuli_2;

--stimuli_3 : process
--begin
--    reset_tb <= '1';
--    wait for 20 ns;
--    reset_tb <= '0';
--    wait for 10 ns;
--    in1_tb <= std_logic_vector(to_unsigned(12,8));
--    in2_tb <= std_logic_vector(to_unsigned(4,8));
--    start_tb <= '1';
--    op_tb_3 <= "10"; -- and
--    wait for 10 ns;
--    start_tb <= '0';
--    wait for 20 ns;
--	is_done <= '1';
--wait;
--end process stimuli_3;

--stimuli_4 : process
--begin
--    reset_tb <= '1';
--    wait for 20 ns;
--    reset_tb <= '0';
--    wait for 10 ns;
--    in1_tb <= std_logic_vector(to_unsigned(12,8));
--    in2_tb <= std_logic_vector(to_unsigned(4,8));
--    start_tb <= '1';
--    op_tb_4 <= "11"; -- or
--    wait for 10 ns;
--    start_tb <= '0';
--    wait for 20 ns;
--	is_done <= '1';
--wait;
--end process stimuli_4;

stimuli_5 : process
begin
    reset_tb <= '1';
    wait for 20 ns;
    reset_tb <= '0';
    wait for 10 ns;
        start_tb <= '1';
        wait for 300 ns;
    in3_tb <= std_logic_vector(to_unsigned(12,12));
    wait for 10 ns;
--    in4_tb <= std_logic_vector(to_unsigned(4,12));
--    start_tb <= '1';
        wait for 300 ns;
confirm_tb <= '0';
    start_tb <= '0';
      wait for 10 ns;
    confirm_tb <= '1';
    wait for 300 ns;
    confirm_tb <= '0';
    -- op_tb_5 <= "11"; -- or
--    wait for 200 ns;
--    start_tb <= '1';
       wait for 400 ns;
    in3_tb <= std_logic_vector(to_unsigned(6,12));
    wait for 10 ns;
--    in4_tb <= std_logic_vector(to_unsigned(4,12));
--    start_tb <= '0';
        wait for 300 ns;
--    start_tb <= '0';
--      wait for 10 ns;
    confirm_tb <= '1';
    -- op_tb_5 <= "11"; -- or
        wait for 300 ns;
    confirm_tb <= '0';
    wait for 200 ns;
--    start_tb <= '0';
    wait for 1000 ms;
--    if done_tb = '1' then
	   is_done <= '1';
--	end if;
wait;
end process stimuli_5;
                 
end Behavioral;
