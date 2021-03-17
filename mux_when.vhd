--biblioteca
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--entidade
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux_when is
    generic (
        SIZE : integer := 4
    ); 
    port(
        mux_in_a : in unsigned (SIZE-1 downto 0);
        mux_in_b : in unsigned (SIZE-1 downto 0);
        mux_out : out unsigned (SIZE-1 downto 0);
        --seletor
        mux_sel : in std_logic
    );
end entity mux_when;

--arquitetura
--architecture RTL of entityName is
architecture RTL of mux_when is 
begin
    mux_out <= mux_in_a when mux_sel = '0' else 
                mux_in_b; 
    
end architecture RTL;