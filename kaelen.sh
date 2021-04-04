#read common.sh

#action {By what name do you wish to be known?}
{
    Kaelen
}

#alias {feedme}
{
	get chicken bag;
	eat chicken;	
}

#alias {drinkme}
{
	drink canteen;
	drink canteen;
}

#action {It's already empty}
{
    #bell
}

#alias {armr}
{
    #variable NEED_ARMR TRUE;
    #if {"$STATUS" == "SLEEPING"}
    {
        #delay {30} {armr};
        #return
    };
    #showme {Trying to ARMR...};
    #if {"$STATUS" != "READY" || $MANA < $ARMR_COST}
    {
        #delay {10} {armr};
        #return
    };
    #else
    {
        cast 'armor'
    };
    #variable LAST_CAST armr
}

#alias {dinv}
{
    #variable NEED_DINV TRUE;
    #if {"$STATUS" == "SLEEPING"}
    {
        #delay {30} {dinv};
        #return
    };
    #showme {Trying to DINV...};
    #if {"$STATUS" != "READY" || $MANA < $ARMR_COST}
    {
        #delay {10} {dinv};
        #return
    };
    #else
    {
        cast 'detect invisibility'
    };
    #variable LAST_CAST dinv
}

#alias {fc}
{
	fill canteen fountain
}

#alias {infr}
{
	cast 'infravision' kaelen;
}

#alias {blnd}
{
	cast 'blindness' %1;
}

#alias {mid-trainer}
{
	#5 s;
	#2 e;
	n;
	e;
	n;
}

#alias {trainer-mid}
{
	s;
	w;
	s;
	#2 w;
	#5 n;
}
