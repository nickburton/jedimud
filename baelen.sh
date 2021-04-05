#read common.sh

#variable {HEAL_PCT} {0.6}
#variable {MANA_MIN_PCT} {0.5}
#variable {MOVE_MIN_PCT} {0.8}

#variable {COST_PREV} {10}
#variable {COST_ARMR} {20}
#variable {COST_BLES} {5}
#variable {COST_AURA} {80}
#variable {COST_CAID} {20}

#variable {COST_HEAL} {20}

#variable {COST_CRFO} {5}
#variable {COST_CRWA} {5}

#variable {NEED_ARMR} {FALSE}
#variable {NEED_BLES} {FALSE}
#variable {NEED_PREV} {FALSE}
#variable {NEED_AURA} {FALSE}
#variable {NEED_CAID} {FALSE}

#action {By what name do you wish to be known?}
{
    Baelen
}

#alias {check-bless}
{
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
    #if {"$NEED_AURA" == "TRUE"}
    {
        aura
    };
    #if {"$NEED_CAID" == "TRUE"}
    {
        caid
    };
}

#alias {crwa}
{
    #showme Trying to CRWA...;
    #variable THIRSTY FALSE;
    #if {"$STATUS" != "READY" || $MANA < $COST_CRWA}
    {
        #delay {5} {crwa};
        #return
    };
    cast 'create water' canteen;
    #variable LAST_CAST crwa;
    drink canteen;
    drink canteen;
    #variable THIRSTY FALSE
}

#alias {crfo}
{
    #showme Trying to CRFO...$STATUS";
    #variable HUNGRY TRUE;
    #if {"$STATUS" != "READY" || $MANA < $COST_CRFO}
    {
        #delay {5} {crfo};
        #return
    };
    cast 'create food';
    #variable LAST_CAT crfo;
    eat parmesan;
    #variable HUNGRY FALSE
}

#alias {heal}
{
    #showme Trying to HEAL...;
    #if {$MANA < $COST_HEAL}
    {
        #delay {5} {heal};
        #return
    };
    #if {"%1" == ""}
    {
    	cast 'cure critic' baelen;
    };
    #else 
    {
    	cast 'cure critic' %1;
    };	
    #variable LAST_CAST heal
}

#alias {caid}
{
    #variable NEED_CAID TRUE;
    #if {"$STATUS" == "SLEEPING"}
    {
        #return
    };
    #showme Trying to CAID...;
    #if {$STATUS != "READY" || $MANA < $COST_CAID}
    {
        #delay {10} {caid};
        #return
    };
    #if {"%1" == ""}
    {
    	cast 'aid' baelen;
    };
    #else 
    {
    	cast 'aid' %1;
    };	
    #variable LAST_CAST caid
}

#alias {hk}
{
	heal kaelen
}

#alias {prev}
{
    #variable NEED_PREV TRUE;
    #if {"$STATUS" == "SLEEPING"}
    {
        #return
    };
    #showme Trying to PREV...;
    #if {$STATUS != "READY" || $MANA < $COST_PREV}
    {
        #delay {10} {prev};
        #return
    };
    cast 'protection from evil';
    #variable LAST_CAST prev
}

#alias {armr}
{
    #variable NEED_ARMR TRUE;
    #if {"$STATUS" == "SLEEPING"}
    {
        #return
    };
    #showme Trying to ARMR...;
    #if {"$STATUS" != "READY" || $MANA < $COST_ARMR}
    {
        #delay {10} {armr};
        #return
    };
    cast 'armor';
    #variable LAST_CAST armr
}

#alias {dinv}
{
    #variable NEED_DINV TRUE;
    #if {"$STATUS" == "SLEEPING"}
    {
        #return
    };
    #showme Trying to DINV...;
    #if {"$STATUS" != "READY" || $MANA < $COST_ARMR}
    {
        #delay {10} {dinv};
        #return
    };
	cast 'detect invisibility';
    #variable LAST_CAST dinv
}

#alias {bles}
{
    #variable NEED_BLES TRUE;
    #if {"$STATUS" == "SLEEPING"}
    {
        #return
    };
    #showme Trying to BLES...;
    #if {"$STATUS" != "READY" || $MANA < $COST_BLES}
    {
        #delay {10} {bles};
        #return
    };
    cast 'bless';
    #variable LAST_CAST bles
}

#alias {aura}
{
    #variable NEED_AURA TRUE;
    #if {"$STATUS" == "SLEEPING"}
    {
        #return
    };
    #showme Trying to AURA...;
    #if {"$STATUS" != "READY" || $MANA < $COST_AURA}
    {
        #delay {10} {aura};
        #return
    };
    cast 'aura of protection';
    #variable LAST_CAST aura
}

#alias {sleep}
{
	#if {"$STATUS" != "SLEEPING" && "$STATUS" != "ATTACKING"}
	{
		rem stellar; put stellar chest;
		get jewel chest; wear jewel;
        rem wristguard;put wristguard chest;
        get ivory chest; wear ivory; 
		sle;
	    #variable STATUS SLEEPING;
	    #ticker {sleep-check} 
	    {
	    	#cr
	    } {20}
    }
}

#alias {wake}
{
    wak;
    stand;
    #variable STATUS READY;
    check-food;
    check-water;
    check-bless;

    #unticker {sleep-check};
    rem jewel; put jewel chest;
	get stellar chest; wear stellar;
    rem ivory;put ivory chest;
    get wristguard chest;wear wristguard;
}

#action {You awake, and sit up.}
{
    stand
}

#action {You feel less protected from evil.} {prev}
#action {You feel less protected from the rigors of the world.} {armr}
#action {You feel less righteous.} {bles}
#action {The aura around your body fades.} {aura}
#action {The detect invisible wears off.} {dinv}
#action {You feel less prepared for combat.} {caid}

#action {You feel protected from the evils of this world!} {#variable NEED_PREV FALSE}
#action {You feel someone protecting you.} {#variable NEED_ARMR FALSE}
#action {You feel righteous.} {#variable NEED_BLES FALSE}
#action {You start glowing.} {#variable NEED_AURA FALSE}

#action {You feel ready for combat!} {#variable NEED_CAID FALSE}
#action {You feel a lot better!} {#variable STATUS HEALED}

#action {But Baelen is already protected!}{#variable NEED_ARMR FALSE}
#action {Poof!  You're an even brighter candle now.} {#variable NEED_AURA FALSE}

#action {You are surrounded by a small cloud of light.} {#variable NEED_AURA FALSE}

#alias {con-gear}
{
	rem gauntlets; put gauntlets chest;
	get gloves chest; wear gloves;
	#2 rem ring;#2 put ring chest;
	#2 get ornate chest;#2 wear ornate;
}

#alias {dam-gear}
{
	rem gloves;put gloves chest;
	get gauntlets chest; wear gauntlets;
	#2 get ring chest;
	#2 rem ornate;#2 put ornate chest;
	#2 wear ring;
}

#alias {mid-trainer}
{
	#5 s;
	#3 e;
	#3 n;
}

#alias {trainer-mid}
{
	#3 s;
	#3 w;
	#5 n;
}

#action {It's already empty}
{
    crwa
}

#alias {feedme}
{
    crfo
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