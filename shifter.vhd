--biblioteca
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--entidade
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shifter is
    generic(
        SIZE_2:   integer := 2;
        SIZE_8:   integer := 8;
        SIZE_16:  integer := 16
    );     
    port(
        --entrada e saida (unsigned - pode ser necessário mudar)
        input : in unsigned(SIZE_8-1 downto 0);
        shift_cntrl : in std_logic_vector(SIZE_2-1 downto 0);
        shift_out : out unsigned(SIZE_16-1 downto 0)
    );
end entity shifter;

--arquitetura
--architecture RTL of entityName is
architecture RTL of shifter is 
begin
    process (input, shift_cntrl)
    begin
        --Se shift_cntrl é zero, shift_out[7:0] igual a input[7:0]
        --se o control for zero, deixa 7:0 igual à entrada e os bits 15:8 não fazem nada, logo são zerados

        -- número depois do parenteses(0) e preenche até data_out'length(retorna a quantidade de bits do data_out)
        --data_out <= to_unsigned(0, data_out'length);
        
        --garante o recebimento
        shift_out <= (others => '0');
        if shift_cntrl = "00" then
            shift_out(7 downto 0) <= input(7 downto 0);
        elsif shift_cntrl = "01" then
            shift_out(11 downto 4) <= input(7 downto 0);
        elsif shift_cntrl = "10" then
            shift_out(15 downto 8) <= input(7 downto 0);
        else
            shift_out(7 downto 0) <= input(7 downto 0);
        end if;
    end process;    
    
end architecture RTL;
