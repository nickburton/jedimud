#read common.sh
#read loop.sh
#read mobs.sh
#read follow.sh

#variable NEED_ARMR FALSE;
#variable NEED_DINV FALSE;
#variable NEED_CORB FALSE;

#variable {HP_MIN_PCT} {0.7}
#variable {MP_MIN_PCT} {0.0}
#variable {VP_MIN_PCT} {0.8}

#variable {COST_ARMR} {20}
#variable {COST_DINV} {10}
#variable {COST_DRAI} {50}
#variable {COST_CORB} {50}

#variable {CAN_HEAL} {FALSE}
#variable {DRAIN_COUNT} {0}

#action {By what name do you wish to be known?}
{
    Kaelen
}

#action {Baelen recites a scroll of recall.}
{
    #3 s;
    w;
    chess-nt;
    n;
    sleep;
}

#alias {feedme}
{
    #if {"$STATUS" != "SLEEPING"}
    {
        get waybread chest;
        eat waybread;       
    }
}

#alias {drinkme}
{
    #if {"$STATUS" != "SLEEPING"}
	{
        drink canteen;
        drink canteen;
    }
}

#alias {sleep-gear}
{
    #showme no sleep gear;
}


#alias {wake-gear}
{
    #showme no sleep gear;
}

#alias {check-bless}
{
    #if {"$NEED_ARMR" == "TRUE"}
    {
        armr
    };
    #if {"$NEED_DINV" == "TRUE"}
    {
        dinv
    };
    #if {"$NEED_CORB" == "TRUE"}
    {
        corb
    };
}

#alias {armr}
{
    #variable NEED_ARMR TRUE;
    #if {("$STATUS" == "READY" || "$STATUS" == "BLESSING") && $MP > $COST_ARMR}
    {
        #showme {Trying to ARMR...};
        cast 'armor';
        #variable LAST_CAST armr;
    };
}

#alias {dinv}
{
    #variable NEED_DINV TRUE;
    #if {("$STATUS" == "READY" || "$STATUS" == "BLESSING") && $MP > $COST_DINV}
    {
        cast 'detect invisibility';
        #variable LAST_CAST dinv
    };
}

#alias {drai}
{
    #if {$MP > $COST_DRAI}
    {
        #showme {Trying to DRAI...};
        cast 'energy drain' %1;
        #variable LAST_CAST "drai %1";
    };
}

#alias {corb}
{
    #variable NEED_CORB TRUE;
    #if {$MP > $COST_CORB}
    {
        #showme {Trying to CORB...};
        cast 'orb';
        #variable LAST_CAST corb;
    };
}

#alias {check-next}
{
    #path load tg;
    lll;
}

#alias {infr}
{
	cast 'infravision' %1;
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

#action {You feel someone protecting you.} {#variable NEED_ARMR FALSE}
#action {Your eyes tingle.}{#variable NEED_DINV FALSE}
#action {You encase yourself in a protective orb.} {#variable NEED_CORB FALSE}

#action {You feel less protected from the rigors of the world.} {armr}
#action {The detect invisible wears off.} {dinv}
#action {The orb of protection around you dissolves into nothingness.} {corb}