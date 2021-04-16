#alias {mid-tg}
{
    #4 s;
    #5 e;
    #3 n;
    #3 ne;
    e;
    open gate;
    e;
    e
}

#alias {tg-mid}
{
    w;
    open gate;
    w;
    w;
    #3 sw;
    #3 s;
    #5 w;
    #4 n
}

#alias {mid-rug}
{
	#6 s;
	e;
	s;
}

#alias {rug-mid}
{
	n;
	w;
	#6 n;
}

#alias {mid-bakery}
{
	#4 s;
	w;
	n;
}

#alias {mid-bank}
{
	#4 s;
	#3 e;
	n;
}

#alias {bank-mid}
{
	s;
	#4 w;
	#3 n;
}

#alias {rent}
{
	s;
	s;
	e;
	e;
	u;
	ren;
	0;
}

#alias {toy-nt}
{
	enter toybox;
	e;
	d;
	s;
	#2 e;
	#4 n;	
}

#alias {nt-toy}
{
	#4 s;
	#2 w;
	n;
	u;
	w;
	enter toybox;
}

#alias {dep-all}
{
	#4 s;
	#3 e;
	n;
	deposit all;
	s;
	#3 w;
	#4 n;
}

#alias {mid-knights}
{
	#6 s;
	#2 e;
	#2 s;
	#2 e;
	#3 s;
	#3 w;
	n;
	w;
	n; 
	#2 w;
	u; 
	#7 n;
	#3 e; 
	s; 
	e; 
	n; 
	e; 
	s;
}

#alias {mid-nt}
{
	#6 s;
	#2 e;
	#2 s;
	#11 e;
	#3 n;
	open gate;
	#7 n;
}

#alias {nt-mid}
{
	#5 s;
	d;
	#22 w;
	s;
	#6 w;
	n;
	#2 w;
	#7 n;
	#4 e;
	#4 n;
}

#alias {nt-sp}
{
	#5 s;
	d;
	#13 w;
	#8 n;
}

#alias {nt-chess}
{
	#6 n;
	#6 e;
	s;
	play chess;
}

#alias {chess-nt}
{
	hit clock;
	n;
	#6 w;
	#6 s;
}

#alias {nt-attendants}
{
	#4 s;
	#6 e;
	#3 s;
	e;
	#3 s;
	e;
}

#alias {attendants-nt}
{
	w;
	#3 n;
	w;
	#3 n;
	#6 w;
	#4 n;
}

#alias {mid-mages}
{
	mid-knights;
	n;
	e;
	n;
	e;
	#3 n;
}

#alias {mid-weeden}
{
	 #4 s;
	 #5 w;
	 #2 n;
	 #5 w;
	 #3 s;
	 #5 w;
	 s; 
	 w;
}

#alias {mid-welmar}
{
	#4 s;
	#5 e;
	#3 n;
	#3 ne;
	#4 n;
}

#alias {get-rug}
{
	#4 s;
	#3 e;
	n;
	with 5000;
	s;
	#3 w;
	#2 s;
	e;
	s;
	visible;
	buy rug;
	n;
	w;
	#6 n;
}

#alias {mid-shire}
{
	#4 s;
	#5 w;
	#2 n;
	w;
	#3 n;
}

#alias {shire-mid}
{
	#3 s;
	e;
	#2 s;
	#5 e;
	#4 n;
}

#alias {mid-sanc}
{
	#4 s;
	#7 e;
	#10 n;
	#2 e;
	s;
	d;
}

#alias {mid-magic}
{
	#4 s;
	#3 w;
	n;
}

#alias {get-rec}
{
	#4 s;
	#3 w;
	n;
	buy recall;
	put recall chest;
	s;
	#3 e;
	#4 n;
}

#alias {get-recs}
{
	#4 s;
	#3 w;
	n;
	#2 buy recall;
	#2 put recall chest;
	s;
	#3 e;
	#4 n;
}

#alias {mid-evil}
{
	op w;
	w;
	n;
	n;
	op n;
	n;
	n;
	u;
}

#alias {nt-skara}
{
	#19 e;
	n;
	#6 e;
	#2 n;
	#2 e;
	#7 n;
	#2 e;
	s;
}

#alias {skara-ravenna}
{
	#7 e; 
	n; 
	e; 
	#3 n;
	d; 
	w;
	#2 n; 
	#2 e; 
	#2 n; 
	e; 
	n;
	#2 e;
}

#alias {evil-mid}
{
	d;s;s;op s;s;s;open e;e;
}

#variable {toy} {e;e;n;n;n;w;w;w;w;s;s;s;s;s;s;e;e;n;n;n;n;n;n;e;e;s;s;s;s;s;s;w;w;n;n;n;}
#variable {tg} {s;s;n;n;n;n;e;s;s;s;s;e;n;n;n;n;e;s;s;s;s;n;n;w;w;w;}
#variable {mages} {e;e;e;e;w;w;w;w;}
#variable {chess} {e;#4 s;e;e;n;#3 e;s;e;e;#7 n;w;w;s;#3 w;n;w;w;}
