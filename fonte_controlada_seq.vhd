library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity fonte_controlada_seq is 
      Port (
      clk          : in std_logic;
	   reset        : in std_logic;
	   enable       : in std_logic;
	   tensao_in    : in std_logic_vector(7 downto 0);
	   corrente_out : out std_logic_vector(15 downto 0)
		);
end fonte_controlada_seq;

architecture comportamento of fonte_controlada_seq is
    signal ganho       : std_logic_vector (7 downto 0)  := "00000010";
	 signal acumulador : std_logic_vector(15 downto 0) := (others => '0');
begin
     
	  process(clk, reset)
	     variable a,b  : unsigned (7 downto 0); 
		  variable correnteout : unsigned (15 downto 0);   
	  begin 
	      if reset = '1' then 
	           acumulador <= std_logic_vector(correnteout);
		   elsif rising_edge (clk) then 
			    if enable = '1' then 
				    a := unsigned (tensao_in);
		          b := unsigned (ganho);  			
			       correnteout := a *b;
					 acumulador <= std_logic_vector (correnteout);
             end if;
			end if;
		end process;
	   corrente_out <= acumulador;
end comportamento;