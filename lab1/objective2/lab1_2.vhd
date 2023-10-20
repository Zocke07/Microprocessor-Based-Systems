entity lab1 is
port (
		 W,X,Y,Z,W1,X1,Y1,Z1,W2,X2,Y2,Z2 	: in BIT;
		 a,b,c,d,e,f,g,a1,b1,c1,d1,e1,f1,g1,a2,b2,c2,d2,e2,f2,g2	: out BIT);
end lab1;

architecture func of lab1 is
begin
	a <= (X and not Y and not Z) or (W and X and not Y) or (not W and not X and not Y and Z) or (W and not X and Y and Z);
	b <= (X and Y and not Z) or (W and Y and Z) or (W and X and not Z) or (not W and X and not Y and Z);
	c <= (not W and not X and Y and not Z) or (W and X and not Z) or (W and X and Y);
	d <= (not X and not Y and Z) or (not W and X and not Y and not Z) or (X and Y and Z) or (W and not X and Y and not Z);
	e <= (not W and Z) or (not W and X and not Y) or (not X and not Y and Z);
	f <= (not W and not X and Z) or (not W and not X and Y) or (not W and Y and Z) or (W and X and not Y);
	g <= (not W and not X and not Y) or (not W and X and Y and Z);
	a1 <= (X1 and not Y1 and not Z1) or (W1 and X1 and not Y1) or (not W1 and not X1 and not Y1 and Z1) or (W1 and not X1 and Y1 and Z1);
	b1 <= (X1 and Y1 and not Z1) or (W1 and Y1 and Z1) or (W1 and X1 and not Z1) or (not W1 and X1 and not Y1 and Z1);
	c1 <= (not W1 and not X1 and Y1 and not Z1) or (W1 and X1 and not Z1) or (W1 and X1 and Y1);
	d1 <= (not X1 and not Y1 and Z1) or (not W1 and X1 and not Y1 and not Z1) or (X1 and Y1 and Z1) or (W1 and not X1 and Y1 and not Z1);
	e1 <= (not W1 and Z1) or (not W1 and X1 and not Y1) or (not X1 and not Y1 and Z1);
	f1 <= (not W1 and not X1 and Z1) or (not W1 and not X1 and Y1) or (not W1 and Y1 and Z1) or (W1 and X1 and not Y1);
	g1 <= (not W1 and not X1 and not Y1) or (not W1 and X1 and Y1 and Z1);
	a2 <= (X2 and not Y2 and not Z2) or (W2 and X2 and not Y2) or (not W2 and not X2 and not Y2 and Z2) or (W2 and not X2 and Y2 and Z2);
	b2 <= (X2 and Y2 and not Z2) or (W2 and Y2 and Z2) or (W2 and X2 and not Z2) or (not W2 and X2 and not Y2 and Z2);
	c2 <= (not W2 and not X2 and Y2 and not Z2) or (W2 and X2 and not Z2) or (W2 and X2 and Y2);
	d2 <= (not X2 and not Y2 and Z2) or (not W2 and X2 and not Y2 and not Z2) or (X2 and Y2 and Z2) or (W2 and not X2 and Y2 and not Z2);
	e2 <= (not W2 and Z2) or (not W2 and X2 and not Y2) or (not X2 and not Y2 and Z2);
	f2 <= (not W2 and not X2 and Z2) or (not W2 and not X2 and Y2) or (not W2 and Y2 and Z2) or (W2 and X2 and not Y2);
	g2 <= (not W2 and not X2 and not Y2) or (not W2 and X2 and Y2 and Z2);
end func;