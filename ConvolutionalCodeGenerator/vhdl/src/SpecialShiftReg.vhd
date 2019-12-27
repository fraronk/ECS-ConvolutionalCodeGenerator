-- SpecialShiftRegister.vhd
library IEEE;
use IEEE.std_logic_1164.all;

entity SpecialShiftReg is
    generic(NF : positive := 8);
  port (
    d : in std_logic;
    q : out std_logic_vector(NF-1 downto 0);
    clk, resetn : in std_logic
  ) ;
end SpecialShiftReg;

architecture parallelo of SpecialShiftReg is
    
    signal q_tmp : std_logic_vector(NF-1 downto 0);

    component FlipFlop is
        port(
            clk, resetn, d : in std_logic;
            q : out std_logic);
        end component FlipFlop;

        begin
        
        GEN: for i in 0 to NF-1 generate
            FIRST: if i = 0 generate
                FF1: FlipFlop port map(d => d,q => q_tmp(i),resetn => resetn,clk => clk);
            end generate FIRST;
            INTERNAL: if i>0 and i <= NF-1 generate
                FFI: FlipFlop port map(d => q_tmp(i-1),q => q_tmp(i),resetn => resetn,clk => clk);
                end generate INTERNAL;
        end generate GEN;

        q <= q_tmp;

end parallelo;