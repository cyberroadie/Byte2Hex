----------------------------------------------------------------------------------
-- Company: Robot Motel Limited 
-- Engineer: Olivier Van Acker
-- 
-- Create Date: 28.08.2016 20:34:12
-- Design Name: 
-- Module Name: Byte2Dec - Behavioral
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

entity Byte2Dec is
    Port ( b0        : in STD_LOGIC;
           b1        : in STD_LOGIC;
           b2        : in STD_LOGIC;
           b3        : in STD_LOGIC;
           led0     : out std_logic;
           led1     : out std_logic;
           led2     : out std_logic;
           led3     : out std_logic;
           S_a		: out std_logic;
           S_b      : out std_logic;
           S_c      : out std_logic;
           S_d      : out std_logic;
           S_e      : out std_logic;
           S_f      : out std_logic;
           S_g      : out std_logic;
           S_DP     : out std_logic);
end Byte2Dec;

architecture Behavioral of Byte2Dec is
    signal inputs	: std_logic_vector(3 downto 0);
    signal outputs	: std_logic_vector(7 downto 0);
    signal leds     : std_logic_vector(3 downto 0);
begin

inputs <= b3 & b2 & b1 & b0;
led0 <= leds(0);
led1 <= leds(1);
led2 <= leds(2);
led3 <= leds(3);
S_a  <= outputs(7);
S_b  <= outputs(6);
S_c  <= outputs(5);
S_d  <= outputs(4);
S_e  <= outputs(3);
S_f  <= outputs(2);
S_g  <= outputs(1);
S_DP <= outputs(0);

-- Process that determines output based on the inputs
-- Note the similarity between this and the Full_Adder_2
-- truth table
b2d_proc : process(inputs)
begin
    leds <= inputs;    
	case inputs is
		when "0000" => 
			outputs <= "00000001";  -- 0
		when "0001" =>
			outputs <= "01100000";  -- 1
		when "0010" =>
			outputs <= "11011010";  -- 2
		when "0011" =>
			outputs <= "11110010";  -- 3
		when "0100" =>
			outputs <= "01100110";  -- 4
		when "0101" =>
			outputs <= "10110110";  -- 5
		when "0110" =>
			outputs <= "00111110";  -- 6
		when "0111" =>
			outputs <= "11100000";  -- 7
		when "1000" => 
            outputs <= "11111110";  -- 8
        when "1001" => 
            outputs <= "11110110";  -- 9
        when "1010" => 
            outputs <= "11101110";  -- a
        when "1011" => 
            outputs <= "00111110";  -- b
        when "1100" => 
            outputs <= "10011100";  -- c
        when "1101" => 
            outputs <= "01111010";  -- d
        when "1110" => 
            outputs <= "10011110";  -- e
        when "1111" => 
            outputs <= "10001110";  -- f 
		when others =>
			outputs <= (others => 'X');
	end case;
end process b2d_proc;
end Behavioral;
