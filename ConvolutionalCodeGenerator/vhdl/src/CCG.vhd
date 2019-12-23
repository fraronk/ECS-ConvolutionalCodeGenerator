library IEEE;
use IEEE.std_logic_1164.all;

entity CCG is
  port (
    clk : in std_logic;
    rst : in std_logic;
    a_in: in std_logic;
    a_out: out std_logic;
    c: out std_logic
  ) ;
end CCG;

architecture arc of CCG is

    signal out_a_reg : std_logic_vector(3 downto 0);
    signal out_c_reg : std_logic_vector(9 downto 0);
    signal out_xor : std_logic;

    component SpecialShiftReg is
        generic(NF : positive := 8);
      port (
        d : in std_logic;
        q : out std_logic_vector(NF-1 downto 0);
        clk, resetn : in std_logic
      ) ;
    end component;

begin

    AKregister: SpecialShiftReg
        generic map(NF => 4) 
        port map(
            d       => a_in,
            q       => out_a_reg,
            clk     => clk,
            resetn => rst
        );

    CKregister: SpecialShiftReg
        generic map(NF => 10) 
        port map(
            d       => out_xor,
            q       => out_c_reg,
            clk     => clk,
            resetn => rst
        );
    
    out_xor <= a_in XOR out_a_reg(3) XOR out_a_reg(2) XOR out_c_reg(9) XOR out_c_reg(7);
    
    a_out <= out_a_reg(0);
    c <= out_c_reg(0);
    

end arc ; -- arc