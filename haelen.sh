#read common.sh
#read loop.sh
#read follow.sh

#variable {HP_MIN_PCT} {0.8}
#variable {MP_MIN_PCT} {0.0}
#variable {VP_MIN_PCT} {0.3}

#variable {CAN_HEAL} {TRUE}
#variable {CAN_REJU} {TRUE}

#variable {COST_HEAL} {20}

#variable {COST_ARMR} {20}
#variable {COST_BLES} {5}
#variable {COST_DINV} {10}
#variable {COST_PREV} {10}
#variable {COST_SANC} {100}

#variable {NEED_ARMR} {FALSE}
#variable {NEED_BLES} {FALSE}
#variable {NEED_DINV} {FALSE}
#variable {NEED_PREV} {FALSE}
#variable {NEED_SANC} {FALSE}

#action {You feel less protected from evil.} {prev}
#action {You feel less protected from the rigors of the world.} {armr}
#action {You feel less righteous.} {bles}
#action {The detect invisible wears off.} {dinv}
#action {You feel less prepared for combat.} {caid}

#action {You feel protected from the evils of this world!} {#variable NEED_PREV FALSE}
#action {You feel someone protecting you.} {#variable NEED_ARMR FALSE}
#action {You feel righteous.} {#variable NEED_BLES FALSE}
#action {Your eyes tingle.}{#variable NEED_DINV FALSE}

#action {You feel a lot better!} {#variable STATUS HEALED}

#action {By what name do you wish to be known?}
{
    Haelen
}

#alias {feedme}
{
    crfo;
}

#alias {drinkme}
{
    drca
}

#alias {drca}
{
    #showme Trying to Drink...;
    #variable THIRSTY TRUE;
    #if {"$STATUS" != "SLEEPING"}
    {
        drink canteen
    };
}

#action {[%0 %1/%2H %3/%4M %5/%6V  %7 Align] %8 (Leader)}
{
	#math {HEALTH_PCT} {%1 / %2 * 1.0};

    #showme Partner HP: $HEALTH_PCT;

	#if {$HEALTH_PCT <= $HP_MIN_PCT && $MP > $COST_HEAL}
	{
		heal %8;
	}
}

#alias {heal}
{
    #if {$MP < $COST_HEAL}
    {
        #return;
    };
    #showme Trying to HEAL...;
    #variable STATUS HEALING;
    #if {"%1" == ""}
    {
    	cast 'cure critic' haelen;
        #variable LAST_CAST heal
    };
    #else 
    {
    	cast 'cure critic' %1;
        #variable LAST_CAST "heal %1"
    };	
    
}

#alias {sleep-gear}
{
    say no sleep gear; 
}

#alias {wake-gear}
{
    say no sleep gear;
}

#alias {crwa}
{
    #variable THIRSTY FALSE;
    #if {("$STATUS" == "READY" || "$STATUS" == "BLESSING") && $MP > $COST_CRWA}
    {
        #showme Trying to CRWA...;
        #variable STATUS BLESSING;
        cast 'create water' canteen;
        #variable LAST_CAST crwa;
        drink canteen;
        drink canteen;
        #variable THIRSTY FALSE;
        #variable STATUS READY;
    };
}

#alias {crfo}
{
    #variable HUNGRY TRUE;
    #if {("$STATUS" == "READY" || "$STATUS" == "BLESSING") && $MP > $COST_CRFO}
    {
        #showme Trying to CRFO...;
        #variable STATUS BLESSING;
        cast 'create food';
        #variable LAST_CAST crfo;
        eat parmesan;
        #variable HUNGRY FALSE;
        #variable STATUS READY;    
    };
}

#alias {heal}
{
    #if {$MP < $COST_HEAL}
    {
        #return;
    };
    #showme Trying to HEAL...;
    #variable STATUS HEALING;
    #if {"%1" == ""}
    {
    	cast 'cure critic' haelen;
        #variable LAST_CAST heal
    };
    #else 
    {
    	cast 'cure critic' %1;
        #variable LAST_CAST "heal %1"
    };	
    
}

#alias {armr}
{
    #variable NEED_ARMR TRUE;
    #if {("$STATUS" == "READY" || "$STATUS" == "BLESSING") && $MP > $COST_ARMR}
    {
        #showme Trying to ARMR...;
        #if {"%1" == ""}
        {
            cast 'armor' haelen;
            #variable LAST_CAST armr
        };
        #else 
        {
            cast 'armor' %1;
            #variable LAST_CAST "armr %1"
        };  
        
    };
}

#alias {aura}
{
    #variable NEED_AURA TRUE;
    #if {("$STATUS" == "READY" || "$STATUS" == "BLESSING") && $MP > $COST_AURA}
    {
        #showme Trying to AURA...;
        cast 'aura of protection';
        #variable LAST_CAST aura
    }
}

#alias {bles}
{
    #variable NEED_BLES TRUE;
    #if {("$STATUS" == "READY" || "$STATUS" == "BLESSING") && $MP > $COST_BLES}
    {
        #showme Trying to BLES...;
        #if {"%1" == ""}
        {
            cast 'bless' haelen;
            #variable LAST_CAST bless
        };
        #else 
        {
            cast 'bless' %1;
            #variable LAST_CAST "bles %1"
        };  
        #variable LAST_CAST bles    
    };
}

#alias {dinv}
{
    #variable NEED_DINV TRUE;
    #if {("$STATUS" == "READY" || "$STATUS" == "BLESSING") && $MP > $COST_DINV}
    {
        #showme Trying to DINV...;
        #if {"%1" == ""}
        {
            cast 'detect invisibility' haelen;
            #variable LAST_CAST dinv
        };
        #else 
        {
            cast 'detect invisibility' %1;
            #variable LAST_CAST "dinv %1"
        };  
    };
}

#alias {sanc}
{
    #variable NEED_SANC TRUE;
    
    #if {("$STATUS" == "READY" || "$STATUS" == "BLESSING") && $MP > $COST_SANC}
    {
        #showme Trying to SANC...;
        #if {"%1" == ""}
        {
            cast 'sanctuary' haelen;
            #variable LAST_CAST sanc
        };
        #else 
        {
            cast 'sanctuary' %1;
            #variable LAST_CAST "sanc %1"
        };  
    };
}

#action {It's already empty}
{
    crwa
}

#action {grec-now}
{
    grec;
    
}

#alias {grec}
{
    cast 'group recall';
    #variable LAST_CAST grec;
}

#alias {wrec}
{
    cast 'word of recall';
    #variable LAST_CAST wrec;
}

#alias {caid}
{
    cast 'aid' %1;
    #variable LAST_CAST {caid %1}
}

#alias {blnd}
{
    cast 'blindness' %1;
    #variable LAST_CAST {blnd %1}
}

#alias {reju}
{
    cast 'rejuvenate' %1;
    #variable LAST_CAST {reju %1}
}

#alias {summ}
{
    cast 'summon' %1;
    #variable LAST_CAST {summ %1}
}

#alias {skin}
{
    cast 'stone skin' %1;
    #variable LAST_CAST {skin %1}
}

#alias {check-bless}
{
    #variable STATUS BLESSING;
	#if {"$NEED_PREV" == "TRUE"}
    {
        prev

    };
    #if {"$NEED_BLES" == "TRUE"}
    {
        bles
    };
    #if {"$NEED_ARMR" == "TRUE"}
    {
        armr
    };
    #if {"$NEED_DINV" == "TRUE"}
    {
        dinv
    };
    #variable STATUS READY;
}

#alias {mid-trainer}
{
	#5 s;
	e;
	#3 n;
}

#alias {trainer-mid}
{
	#3 s;
	w;
	#5 n;
}
