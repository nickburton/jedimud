#read common.sh
#read loop.sh
#read follow.sh
#read mobs.sh

#action {By what name do you wish to be known?}
{
    Raelen
}

#variable {HP_MIN_PCT} {0.7}
#variable {MP_MIN_PCT} {0.4}
#variable {VP_MIN_PCT} {0.4}

#variable {COST_AURA} {80}
#variable {COST_ARMR} {20}
#variable {COST_BLES} {5}
#variable {COST_CAID} {20}
#variable {COST_DIVI} {40}
#variable {COST_DINV} {10}
#variable {COST_PREV} {10}
#variable {COST_SANC} {100}

#variable {COST_HEAL} {20}

#variable {COST_CRFO} {5}
#variable {COST_CRWA} {5}

#variable {NEED_ARMR} {FALSE}
#variable {NEED_BLES} {FALSE}
#variable {NEED_PREV} {FALSE}
#variable {NEED_AURA} {FALSE}
#variable {NEED_CAID} {FALSE}
#variable {NEED_DIVI} {FALSE}
#variable {NEED_DINV} {FALSE}

#variable {CAN_HEAL} {TRUE}

#variable {LAST_PATH} {NIL}

#alias {check-next}
{
    mmm;
    get recall chest;
    recite recall;
    get-recs;

    #if {"$LAST_PATH" == "CHESS"}
    {
        #ticker {mage-run} 
        {
            wake;
            #showme +++MID-MAGES+++;
            mid-mages;
            #path load mages;
            lll;
            #unticker mage-run;
            #variable LAST_PATH MAGES;
        } {10};
    };
    #else 
    {
        #ticker {chess-run} 
        {
            wake;
            #showme +++MID-NT+++;
            mid-nt;
            #showme +++NT-CHESS+++;
            nt-chess;
            #path load chess;
            lll;
            #unticker chess-run;
            #variable LAST_PATH CHESS;
        } {1200};
    };    
}

#action {[%0 %1/%2H %3/%4M %5/%6V  %7 Align] %8 (Tank)}
{
    #math {HEALTH_PCT} {%1 / %2 * 1.0};

    #showme Partner HP: $HEALTH_PCT;

    #if {$HEALTH_PCT <= $HP_MIN_PCT && $MP > $COST_HEAL}
    {
        heal %8;
    }
}

#alias {fc}
{
    fill canteen fountain;
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
    #if {"$NEED_AURA" == "TRUE"}
    {
        aura
    };
    #if {"$NEED_CAID" == "TRUE"}
    {
        caid
    };
    #if {"$NEED_DINV" == "TRUE"}
    {
        dinv
    };
    #variable STATUS READY;
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
    	cast 'cure critic' raelen;
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
            cast 'armor' raelen;
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
            cast 'bless' raelen;
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

#alias {caid}
{
    #variable NEED_CAID TRUE;
    
    #if {("$STATUS" == "READY" || "$STATUS" == "BLESSING") && $MP > $COST_CAID}
    {
        #showme Trying to CAID...;
        #if {"%1" == ""}
        {
            cast 'aid' raelen;
            #variable LAST_CAST caid
        };
        #else 
        {
            cast 'aid' %1;
            #variable LAST_CAST "caid %1"
        };  
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
            cast 'detect invisibility' raelen;
            #variable LAST_CAST dinv
        };
        #else 
        {
            cast 'detect invisibility' %1;
            #variable LAST_CAST "dinv %1"
        };  
    };
}

#alias {divi}
{
    #variable NEED_DIVI TRUE;
    #if {("$STATUS" == "READY" || "$STATUS" == "BLESSING") && $MP > $COST_DIVI}
    {
        #showme Trying to DIVI...;
        #if {"%1" == ""}
        {
            cast 'blessing of the divine' raelen;
            #variable LAST_CAST divi
        };
        #else 
        {
            cast 'blessing of the divine' %1;
            #variable LAST_CAST "divi %1"
        };  
    };
}

#alias {hrsy}
{
    cast 'cleanse heresy' %1;
    #variable LAST_CAST hrsy
}

#alias {prev}
{
    #variable NEED_PREV TRUE;
    
    #if {("$STATUS" == "READY" || "$STATUS" == "BLESSING") && $MP > $COST_PREV}
    {
        #showme Trying to PREV...;
        #if {"%1" == ""}
        {
            cast 'protection from evil' raelen;
            #variable LAST_CAST prev
        };
        #else 
        {
            cast 'protection from evil' %1;
            #variable LAST_CAST "prev %1"
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
            cast 'sanctuary' raelen;
            #variable LAST_CAST sanc
        };
        #else 
        {
            cast 'sanctuary' %1;
            #variable LAST_CAST "sanc %1"
        };  
    };
}

#alias {summ}
{
    #showme Trying to SUMM...;
    cast 'summon' %1;
    #var LAST_CAST "summ %1"
}

#alias {resc}
{
    rescue %1
}

#alias {sleep-gear}
{
    #showme Wearing Sleep Gear....;
    get jewel chest; hold jewel; put surah chest;
}

#alias {wake-gear}
{
    #showme Wearing Wake Gear....;
    get surah chest; hold surah; put jewel chest;
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
#action {You feel protected by the power of the divine.}{#variable NEED_DIVI FALSE}
#action {Your eyes tingle.}{#variable NEED_DINV FALSE}

#action {You feel a lot better!} {#variable STATUS HEALED}

#action {But raelen is already protected!}{#variable NEED_ARMR FALSE}
#action {Poof!  You're an even brighter candle now.} {#variable NEED_AURA FALSE}

#action {You are surrounded by a small cloud of light.} {#variable NEED_AURA FALSE}

#alias {con-gear}
{
	#2 rem ring;#2 put ring chest;
	#2 get ornate chest;#2 wear ornate;
}

#alias {dam-gear}
{
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

#alias {hk}
{
    heal kaelen
}
