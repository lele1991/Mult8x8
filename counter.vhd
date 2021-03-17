--biblioteca
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--entidade
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
    --registrador de n-bits (GENERICS).

    port(
        clk:            in std_logic;
        aclr_n:         in std_logic;
        
        counter_out:    out std_logic_vector(1 downto 0)
    );
end entity counter;

--arquitetura
--architecture RTL of entityName is
architecture RTL of counter is 
begin
    process (clk, aclr_n)
        variable aux : unsigned(1 downto 0);
              
    begin
        --A saída vai para "00" imediatamente quando aclr_n é baixo
        if aclr_n = '0' then
            aux := "00";
        --Se aclr_n não é baixo, o contador é incrementado em 1 na subida do clock
        --aclr_n tem prioridade sobre a verificação da subida do clk
        elsif rising_edge(clk) then
            aux := aux + 1;
        end if;
        counter_out <= std_logic_vector(aux);  

    end process;    
end architecture RTL;
