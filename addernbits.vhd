--biblioteca
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--entidade
entity addernbits is
	generic (
		SIZE : integer := 16
	);
	port(
		dataa:    in unsigned (SIZE-1 downto 0);
		datab:    in unsigned (SIZE-1 downto 0);
		sum:      out unsigned (SIZE-1 downto 0)
	);
end entity addernbits;

--architecture RTL of entityName is
architecture RTL of addernbits is
	
begin
	sum <= dataa + datab;
	
end architecture RTL;
