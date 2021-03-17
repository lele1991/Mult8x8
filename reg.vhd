--biblioteca
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--entidade
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg is
    --registrador de n-bits (GENERICS).
    generic(
        constant SIZE_16: integer := 16
    );
    
    port(
        clk:            in  std_logic;
        sclr_n:         in  std_logic;
        clk_ena:        in  std_logic;
        datain:         in  unsigned(SIZE_16-1 downto 0);
        prod_reg_out:   out unsigned(SIZE_16-1 downto 0)
    );
end entity reg;

--arquitetura
--architecture RTL of entityName is
architecture RTL of reg is 
begin
    process (clk, sclr_n)
        --as operações ocorrem na subida de clk, com exceção de sclr_n
    begin
        --sclr_n é baixo
        if sclr_n = '0' then
            --limpe a saída (prioridade mais alta)
            --palavra fixa "0000"
            prod_reg_out <= (others => '0');
        elsif rising_edge(clk) then
        --Detecta a borda ascendente e retorna verdadeiro quando o sinal muda de um valor baixo ('0' ou 'L') para um valor alto ('1' ou 'H')
            --na subida do clock, verifique se clk_ena é alto   
            if clk_ena = '1' then
                -- as saídas são atribuídas às entradas
                prod_reg_out <= datain;
            end if;
        end if;
    end process;    
end architecture RTL;
