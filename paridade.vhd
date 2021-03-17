--biblioteca
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--entidade
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity paridade is
    --Entradas: sinal com 8-bits, enable.
    --Saída: um bit (paridade par ou ímpar).
    
    port(
        par_input:   in std_logic_vector(7 downto 0);
        par_enable : in std_logic;
        par_out:     out std_logic
    );
end entity paridade;

--arquitetura
--architecture RTL of entityName is
architecture RTL of paridade is 
begin
    process (par_input, par_enable)
        variable paridade : std_logic;
    begin
        --A contagem só deve ser executada quando enable = '1'.
        --Use uma xor.
        --0   0 | 0
        --0   1 | 1
        --1   0 | 1
        --1   1 | 0
        
        --ex:1111 -> 0xor1 = par=1 => 1xor1 => 0 =>  ate o ultimo bit = 0 no final (n é impar)
        
        paridade := '0';
        if par_enable = '1' then
            for i in par_input'range loop
                paridade := paridade xor par_input(i);
            end loop;
            par_out <= paridade;
        end if; 
    end process;      
    
end architecture RTL;
