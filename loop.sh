#read baelen.sh;
#read mobs.sh
#read paths.sh;

#variable {LOOP} {FALSE}
#variable {CHECKING} {FALSE}

#variable {LOOPING_CHESS} {FALSE}
#variable {LOOPING_MAGES} {FALSE}
#variable {NEED_CHESS} {FALSE}
#variable {NEED_MAGES} {FALSE}

#alias {timed-start}
{
    #ticker {delayed-chess} {loop-chess} {900};
    #ticker {delayed-mages} {loop-mages} {2100};
}

#alias {loop-chess}
{
    #if {"$LOOPING_MAGES" == "TRUE"}
    {
        #variable NEED_CHESS TRUE;
        #return;
    };

    #delay {10}
    {
        #variable LOOPING_CHESS TRUE;
        #variable NEED_CHESS FALSE;
        #if {"$STATUS" == "SLEEPING"}
        {
            wake
        };
        mid-nt;
        nt-chess;
        #path load chess;
        lll;
    }
}

#alias {loop-mages}
{
    
    #if {"$LOOPING_CHESS" == "TRUE"}
    {
        #variable NEED_MAGES TRUE;
        #return;
    };

    #delay {10}
    {
        #variable LOOPING_MAGES TRUE;
        #variable NEED_MAGES FALSE;
        #if {"$STATUS" == "SLEEPING"}
        {
            wake
        };
        mid-mages;
        #path load mages;
        lll;
    }
}

#alias {k}
{
    #if {("$STATUS" == "READY" || "$STATUS" == "HEALED" || "$STATUS" == "HEALING") && "$KILL" == "TRUE"}
    {
        #showme Attacking %1...;
        #variable STATUS ATTACKING;
        kill %1
    }
}

#action {END OF PATH}
{
    mmm;
    #variable LOOP FALSE;
    #variable KILL FALSE;
    #variable LOOPING_CHESS FALSE;
    #variable LOOPING_MAGES FALSE;
    recall;
    get-recs;
    dep-all;
    #if {"$NEED_CHESS" == "TRUE"}
    {
        loop-chess;
    };
    #if {"$NEED_MAGES" == "TRUE"}
    {
        loop-mages;
    };
    sleep;
}

#action {[ Exits:}
{
	#if {"$LOOP" == "TRUE" && "$CHECKING" == "FALSE" && "$STATUS" != "SLEEPING" && "$STATUS" != "ATTACKING"}
	{
        #delay {5} 
        {
            #if {"$LOOP" == "TRUE" && "$CHECKING" == "FALSE" && "$STATUS" != "SLEEPING" && "$STATUS" != "ATTACKING"}
            {
                #showme ++++Walking++++;
                #path walk;
            };    
        };
	};
    #variable CHECKING TRUE;
}

#action {[%0/%1H %2/%3M %4/%5V}
{
    #variable HEALTH %0;
    #variable HEALTH_MAX %1;
    #variable MANA %2;
    #variable MANA_MAX %3;

    #math {HEALTH_PCT} {%0 / %1 * 1.0};
    #math {MANA_PCT} {%2 / %3 * 1.0};
    #math {MOVE_PCT} {%4 / %5 * 1.0};
    #showme $STATUS;

    #if {$HEALTH_PCT <= $HEAL_PCT && $MANA > $HEAL_COST && "$STATUS" != "HEALING"}
    {
        heal;
        #variable STATUS HEALING;
        #return
    };
    #if {$MANA_PCT < $MANA_MIN_PCT && "$STATUS" != "ATTACKING" && "$STATUS" != "SLEEPING"}
    {
        #delay {5}
        {
            #if {"$STATUS" != "SLEEPING"}
            {
                sleep
            }
        };
        #return
    };
    #if {$MANA_PCT == 1.0 && "$STATUS" == "SLEEPING" && $MOVE_PCT > $MOVE_MIN_PCT}
    {
        wake
    }
}

#alias {lll}
{
    #variable STATUS READY;
    #variable LOOP TRUE;
    #variable KILL TRUE;

    #ticker {move-check}
    {
    	#if {"$STATUS" != "SLEEPING" && "$CHECKING" == "FALSE" && "$STATUS" != "ATTACKING"}
    	{
    		#showme Looking...;
    		look
    	};
    } {10};

    #ticker {move-max}
    {
        #variable CHECKING FALSE;
    } {5}
}

#alias {mmm}
{
    #variable LOOP FALSE;
    #variable KILL FALSE;
    #variable STATUS READY;
    #unticker {move-check}
}



