library IEEE;
use IEEE.std_logic_1164.all;
entity sequence is
port( clk,resetn,data_in: in std_logic;
data_out: out std_logic));
end sequence;
architecture state_machine of SEQUENCE is
type StateType is (ST0,ST1,ST2,ST3,ST4,ST5,ST6,ST7);
signal Current_State:StateType;
begin
state_comb: process(clk,resetn, Current_State)
variable REG: std_logic_vector(2 downto 0);
begin
if clk ‘event and clk=’1’ and resetn=’1’ then
 case Current_State is
 when ST0 =>
if data_in=’0’ then Current_State<=ST0;
else Current_State<=ST1;
end if;
 when ST1 =>
if data_in=’0’ then Current_State<=ST2;
else Current_State<=ST3;
end if;
when ST2 =>
if data_in=’0’ then Current_State<=ST4;
else Current_State<=ST5;
end if;
when ST3 =>
if data_in=’0’ then Current_State<=ST6;
else Current_State<=ST7;
end if;
when ST4 =>
if data_in=’0’ then Current_State<=ST0;
else Current_State<=ST1;
end if;
when ST5 =>
if data_in=’0’ then Current_State<=ST0;
else Current_State<=ST1;
end if;
when ST6 =>
if data_in=’0’ then Current_State<=ST4;
else Current_State<=ST5;
end if;
when ST7 =>
if data_in=’0’ then Current_State<=ST6;
else Current_State<=ST7;
end if;
end case;
 REG:=data_in&REG(2 downto 1);
elsif resetn=’0’ then
Current_State<=ST0;
REG(2 downto 0):=(‘0’,’0’,’0’);
end if;
data_out<=REG(0);
end process state_comb;
end architecture state_machine;
