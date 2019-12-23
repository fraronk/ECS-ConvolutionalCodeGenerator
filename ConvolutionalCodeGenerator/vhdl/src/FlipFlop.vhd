library IEEE;
use IEEE.std_logic_1164.all;

entity FlipFlop is
    port(
        clk, resetn, d : in std_logic;
        q : out std_logic
    );

end FlipFlop;

architecture rtl of FlipFlop is
    begin
        dfc_p : process(resetn, clk)
        begin
            if resetn = '1' then
                q <= '0';
            elsif (clk'event and clk = '1') then
                q <= d;
            end if;
        end process dfc_p; 

    end rtl;
