entity decto7 is
port (
		 sum0,sum1,sum2,sum3,sum4,sum5,sum6,sum7,light 	: in BIT;
		 a1,b1,c1,d1,e1,f1,g1,a2,b2,c2,d2,e2,f2,g2,led  : out BIT);
end decto7;

architecture func of decto7 is
begin
	a1 <= (not sum3 and not sum2 and not sum1 and sum0) or (sum2 and not sum1 and not sum0);
	b1 <= (sum2 and not sum1 and sum0) or (sum2 and sum1 and not sum0);
	c1 <= (not sum2 and sum1 and not sum0);
	d1 <= (not sum2 and not sum1 and sum0) or (sum2 and not sum1 and not sum0) or (sum2 and sum1 and sum0);
	e1 <= (sum2 and not sum1) or sum0;
	f1 <= (not sum3 and not sum2 and sum0) or (not sum2 and sum1) or (sum1 and sum0);
	g1 <= (not sum3 and not sum2 and not sum1) or (sum2 and sum1 and sum0);

	a2 <= (not sum7 and not sum6 and not sum5 and sum4) or (sum6 and not sum5 and not sum4);
	b2 <= (sum6 and not sum5 and sum4) or (sum6 and sum5 and not sum4);
	c2 <= (not sum6 and sum5 and not sum4);
	d2 <= (not sum6 and not sum5 and sum4) or (sum6 and not sum5 and not sum4) or (sum6 and sum5 and sum4);
	e2 <= (sum6 and not sum5) or sum4;
	f2 <= (not sum7 and not sum6 and sum4) or (not sum6 and sum5) or (sum5 and sum4);
	g2 <= (not sum7 and not sum6 and not sum5) or (sum6 and sum5 and sum4);
	
	led <= light;
end func;