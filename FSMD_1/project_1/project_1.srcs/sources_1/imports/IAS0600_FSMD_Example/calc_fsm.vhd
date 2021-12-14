library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity calc_fsm is
    Port ( in1 : in STD_LOGIC_VECTOR(7 downto 0);
           in2 : in STD_LOGIC_VECTOR(7 downto 0);
           op : in STD_LOGIC_VECTOR(1 downto 0);
           start : in STD_LOGIC;
           reset : in STD_LOGIC;
           clock : in STD_LOGIC;
           done : out STD_LOGIC;
           answer : out STD_LOGIC_VECTOR(7 downto 0));
end calc_fsm;

architecture Behavioral of calc_fsm is
-- FSM signals
type state is (IDLE, INPUT, CALC, READY);
signal current_state, next_state : state;
-- Registers signals
signal reg1, reg2, next_reg1, next_reg2 : STD_LOGIC_VECTOR(7 downto 0);
signal output, next_output : STD_LOGIC_VECTOR(7 downto 0);
-- ALU signals
signal op1, op2 : STD_LOGIC_VECTOR(7 downto 0);
signal result : STD_LOGIC_VECTOR(7 downto 0);
signal op_code : STD_LOGIC_VECTOR(1 downto 0);

begin
----- Datapath -----
-- All registers for inputs and outputs are combined in one process.
-- Note that anything implemented as a register should be declared as two signals:
-- one for the current value of the register and one for the next value
-- (register input). For unification, you can add prefix next_ to the
-- next value signals.
registers : process(reset, clock)
begin
    if reset = '1' then
        reg1 <= (others => '0');
        reg2 <= (others => '0');
        output <= (others => '0');
    elsif clock'event and clock = '1' then
        reg1 <= next_reg1;
        reg2 <= next_reg2;
        output <= next_output;
    end if;
end process;

-- Cocurrent signal assignment for the answer port
answer <= output;

-- Arithmetic Logic Unit
ALU : process(op1, op2, op_code)
begin
    case op_code is
        when "00" =>
            result <= std_logic_vector(unsigned(op1) + unsigned(op2));
        when "01" =>
            result <= std_logic_vector(unsigned(op1) - unsigned(op2));
        when "10" =>
            result <= op1 and op2;
        when "11" =>
            result <= op1 or op2;
        when others =>
            result <= (others => '0');
    end case;
end process;

----- FSM controller -----
-- FSM state register
fsm_seq_part : process(reset, clock)
begin
    if reset = '1' then
        current_state <= IDLE;
    elsif clock'event and clock = '1' then
        current_state <= next_state;
    end if;
end process;

-- Make sure that all inputs of this combinational process
-- are included in the sensitivity list
-- In this small example next state function and output function
-- of the FSM are combined into one process, however, for the lab
-- it might be better to divide them into different processes
fsm_comb_part : process(current_state, start, reg1, reg2, op, result)
begin
    -- default values for the outputs
	-- note that default values for registers are their current values
    done <= '0';
    next_reg1 <= reg1;
    next_reg2 <= reg2;
    next_output <= output;
    op_code <= "00";
    op1 <= (others => '0');
    op2 <= (others => '0');
    case current_state is
        when IDLE =>
            if start = '1' then
                next_state <= INPUT;
            else
                next_state <= IDLE;
            end if;
        when INPUT =>
            next_reg1 <= in1;
            next_reg2 <= in2;
            next_state <= CALC;
        when CALC =>
            op_code <= op;
            op1 <= reg1;
            op2 <= reg2;
            next_output <= result;
            next_state <= READY;
        when READY =>
            done <= '1';
            next_state <= IDLE;
    end case;
end process;

end Behavioral;
