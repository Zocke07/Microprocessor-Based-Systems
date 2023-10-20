entity lab1_1 is
port (
		 W,X,Y,Z 	: in BIT;
		 a,b,c,d,e,f,g: out BIT);
end lab1_1;

architecture func of lab1_1 is
begin
	a <= (X and not Y and not Z) or (W and X and not Y) or (not W and not X and not Y and Z) or (W and not X and Y and Z);
	b <= (X and Y and not Z) or (W and Y and Z) or (W and X and not Z) or (not W and X and not Y and Z);
	c <= (not W and not X and Y and not Z) or (W and X and not Z) or (W and X and Y);
	d <= (not X and not Y and Z) or (not W and X and not Y and not Z) or (X and Y and Z) or (W and not X and Y and not Z);
	e <= (not W and Z) or (not W and X and not Y) or (not X and not Y and Z);
	f <= (not W and not X and Z) or (not W and not X and Y) or (not W and Y and Z) or (W and X and not Y);
	g <= (not W and not X and not Y) or (not W and X and Y and Z);
end func;
