library IEEE;
use IEEE.std_logic_1164.all;

entity CCG_tb is
    end entity CCG_tb;

    architecture bench of CCG_tb is

      constant T_CLK   : time := 8 ns;
      constant T_RESET : time := 20 ns;
      
        signal end_sim : std_logic := '1';
        signal clk_tb : std_logic := '0';
        signal rst_tb  : std_logic := '1';
        
        signal a_in_tb : std_logic :='1';
        signal a_out_tb : std_logic;
        signal c_out_tb : std_logic;

        component CCG is
          port (
            clk : in std_logic;
            rst : in std_logic;
            a_in: in std_logic;
            a_out: out std_logic;
            c: out std_logic
          ) ;
        end component;

    begin

      clk_tb <= (not(clk_tb) and end_sim) after T_CLK / 2;
      rst_tb <= '0' after T_RESET;


        test_CCG: CCG
        port map(
            clk => clk_tb,
            rst => rst_tb,
            a_in => a_in_tb,
            a_out => a_out_tb,
            c => c_out_tb
        );

        d_process: process(clk_tb, rst_tb) 
                variable t : integer := 0; 
              begin
                if(rst_tb = '1') then
                  t := 0;
                elsif(rising_edge(clk_tb)) then
                  case(t) is   
                    when 4096 => end_sim <= '0'; 
                    when others => null;  
                  end case;
                  t := t + 1; 
                end if;
              end process;
    end bench;
