----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/24/2021 06:34:02 PM
-- Design Name: 
-- Module Name: gcd_fsm - Behavioral
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

entity gcd_fsm is
   Port ( in1 : in STD_LOGIC_VECTOR(11 downto 0);
           start, reset, clock, confirm : in STD_LOGIC;
           done : out STD_LOGIC;
           answer : out STD_LOGIC_VECTOR(11 downto 0));
end gcd_fsm;

architecture Behavioral of gcd_fsm is

-- FSM signals
type state is (IDLE, INPUT_1, INPUT_2, ISNEG, EQUAL, NOTEQUAL, CALC, READY, CHECKEQUALITY);
signal current_state, next_state : state;

-- Registers signals
signal reg1, reg2, next_reg1, next_reg2 : STD_LOGIC_VECTOR(11 downto 0);
signal output, next_output : STD_LOGIC_VECTOR(11 downto 0);

-- ALU signals
signal op1, op2, result : STD_LOGIC_VECTOR(11 downto 0);
signal op_code : STD_LOGIC;--_VECTOR(1 downto 0);
signal equalBit, greaterBit, enable : std_logic := '0';

signal button_buf_1, button_buf_2 : std_logic;

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
end process registers;

-- Cocurrent signal assignment for the answer port
answer <= output;

-- ALU Block
ALU : process(op1, op2, op_code)
begin
    case op_code is
        when '0' =>
            result <= std_logic_vector(unsigned(op1) + unsigned(op2));
        when '1' =>
            result <= std_logic_vector(unsigned(op1) - unsigned(op2));
        when others =>
            result <= (others => '0');
    end case;  
              
    if op1 = op2 then
        equalBit <= '1';
    else
        equalBit <= '0';
    end if;
    
    if unsigned(op1) < unsigned(op2) then
        greaterBit <= '1';
    else
        greaterBit <= '0';
    end if;
end process ALU;

-- Edge detection
button_buf_1 <= confirm when rising_edge(clock);
button_buf_2 <= button_buf_1 when rising_edge(clock);
enable <= button_buf_1 and not button_buf_2;

----- FSM controller -----
-- FSM state register
fsm_seq_part : process(reset, clock)
begin
    if reset = '1' then
        current_state <= IDLE;
    elsif clock'event and clock = '1' then
        current_state <= next_state;
    end if;
end process fsm_seq_part;

-- Make sure that all inputs of this combinational process
-- are included in the sensitivity list
-- In this small example next state function and output function
-- of the FSM are combined into one process, however, for the lab
-- it might be better to divide them into different processes
fsm_comb_part : process(current_state, enable, start, reg1, reg2, result, equalBit, greaterBit, output)
begin
    -- default values for the outputs
	-- note that default values for registers are their current values
    done <= '0';
    next_reg1 <= reg1;
    next_reg2 <= reg2;
    next_output <= output;
    op_code <= '1';
    op1 <= (others => '0');
    op2 <= (others => '0');
    case current_state is
        when IDLE =>
            if start = '1' then
                next_state <= INPUT_1;
            else
                next_state <= IDLE;
            end if;
            
        when INPUT_1 =>
            if enable = '1' then
                next_reg1 <= in1;
                next_state <= INPUT_2;
            else
                next_reg1 <= in1;
                next_state <= INPUT_1;
            end if;

        when INPUT_2 =>
            if enable = '1' then
                next_reg2 <= in1;
                next_state <= ISNEG;
            else
                next_reg2 <= (others => '0');
                next_state <= INPUT_2;
            end if;            
           
        when ISNEG =>
            if reg1(11) = '0' and reg2(11) = '0' then -- leading 0's
                next_state <= CHECKEQUALITY;
            elsif reg1(11) = '1' then -- leading 1's
                next_reg1 <= (others => '0');
                next_reg2 <= (others => '0');
                next_state <= INPUT_1;
            else  -- reg2(11) = '1' then [this should be auto because I don't see any other possibilities]
                next_reg2 <= (others => '0');
                next_state <= INPUT_2;
            end if;
            
        when CHECKEQUALITY =>
            op1 <= reg1;
            op2 <= reg2;
            
            if equalBit = '1' then
                next_output <= reg1;
                next_reg1 <= reg1;
                next_reg2 <= reg2;
                next_state <= READY;         
            else
                next_reg1 <= reg1;
                next_reg2 <= reg2;
                next_output <= result;
                next_state <= CALC;
             end if;
            
            if greaterBit = '1' then -- means op2 is larger
                    next_reg1 <= reg2;
                    next_reg2 <= reg1;                   
            end if;
            
        when CALC =>
            op_code <= '1';
            op1 <= reg1;
            op2 <= reg2;
            next_output <= result;
            next_reg1 <= result; 
            next_reg2 <= reg2;
            
            next_state <= CHECKEQUALITY;       
            
        when READY =>
            done <= '1';
            next_state <= IDLE;
            
        when others =>
            NULL; -- this gave some headache
            
    end case;
end process fsm_comb_part;

end Behavioral;
