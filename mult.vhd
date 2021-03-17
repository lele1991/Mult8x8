--biblioteca
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--entidade
entity mult is
	generic (
		SIZE : integer := 4
	);
	port(
		dataa : in unsigned (SIZE-1 downto 0);
		datab : in unsigned (SIZE-1 downto 0);
		prod : out unsigned ((SIZE*2)-1 downto 0)

	);
end entity mult;

--architecture RTL of entityName is
architecture RTL of mult is
	
begin
	prod <= dataa * datab;
	
end architecture RTL;
