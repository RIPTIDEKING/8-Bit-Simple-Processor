library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Instruction is
  port(
    instr_addr : in std_logic_vector(1 downto 0);    -- instruction address

    op         : out std_logic_vector(1 downto 0);   -- operation code
    rs_addr    : out std_logic_vector(1 downto 0);   -- source register 1 address
    rt_addr    : out std_logic_vector(1 downto 0);   -- source register 2 address
    rd_addr    : out std_logic_vector(1 downto 0)    -- destination register address
  );
end Instruction;


architecture behavioral of Instruction is

  type instruction_set is array(0 to 3) of std_logic_vector(7 downto 0);
  constant instr : instruction_set := (
    "10000110",
    "00000000",
    "10011100",
    "00000000"
  );

begin

  op <= instr(to_integer(unsigned(instr_addr)))(7 downto 6);
  rs_addr <= instr(to_integer(unsigned(instr_addr)))(5 downto 4);
  rt_addr <= instr(to_integer(unsigned(instr_addr)))(3 downto 2);
  rd_addr <= instr(to_integer(unsigned(instr_addr)))(1 downto 0);

end behavioral;