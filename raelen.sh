#read common.sh
#read loop.sh
#read follow.sh
#read mobs.sh
#read mobs-tg.sh
#read mobs-tg-L18.sh

#action {By what name do you wish to be known?}
{
    Raelen
}

#variable {HP_MIN_PCT} {0.9}
#variable {MP_MIN_PCT} {0.4}
#variable {VP_MIN_PCT} {0.4}

#variable {COST_DINV} {10}

#variable {COST_HEAL} {15}

#variable {COST_CRFO} {5}
#variable {COST_CRWA} {5}

#variable {CAN_HEAL} {TRUE}i


#variable {LAST_PATH} {NIL}

#action {kill a filthy rat}
{
    crfo;
}

#alias {post-attack}
{
    dodge;
}

#alias {check-next}
{
    mmm;
    #var STATUS READY;
    #path load tg;
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
    #if {"$NEED_DINV" == "TRUE"}
    {
        dinv
    };
    #variable STATUS READY;
}

#alias {crwa}
{
    #variable THIRSTY FALSE;
    #if {("$STATUS" == "READY" || "$STATUS" == "BLESSING")}
    {
        #showme Trying to CRWA...;
        #variable STATUS BLESSING;
        forage water canteen;
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
    #if {("$STATUS" == "READY" || "$STATUS" == "BLESSING")}
    {
        #showme Trying to CRFO...;
        #variable STATUS BLESSING;
        forage food;
        #variable LAST_CAST crfo;
        eat rabbit;
        eat mouse;
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
    	cast 'cure serious' raelen;
        #variable LAST_CAST heal
    };
    #else 
    {
    	cast 'cure critic' %1;
        #variable LAST_CAST "heal %1"
    };	
    
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

#alias {resc}
{
    rescue %1
}

#alias {sleep-gear}
{
    #showme Wearing Sleep Gear....;
}

#alias {wake-gear}
{
    #showme Wearing Wake Gear....;
}

#action {Your eyes tingle.}{#variable NEED_DINV FALSE}

#action {You feel much better!} {#variable STATUS HEALED}


#alias {con-gear}
{
	
}

#alias {dam-gear}
{

}

#alias {mid-trainer}
{
	mid-weeden;
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
