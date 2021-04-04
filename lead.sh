#read baelen.sh;
#read mobs.sh
#read paths.sh;

#variable {KILL} {FALSE}

#action {[%0/%1H %2/%3M}
{
    #variable HEALTH %0;
    #variable HEALTH_MAX %1;
    #variable MANA %2;
    #variable MANA_MAX %3;

    #math {HEALTH_PCT} {%0 / %1 * 1.0};
    #math {MANA_PCT} {%2 / %3 * 1.0};
    #showme {$STATUS};
    #if {$HEALTH_PCT <= $HEAL_PCT && $MANA > $HEAL_COST && "$STATUS" != "HEALING"}
    {
        heal;
        #variable STATUS HEALING;
        #return
    };
    #if {$MANA_PCT < $MANA_MIN_PCT && "$STATUS" != "ATTACKING" && "$STATUS" != "SLEEPING" && "$STATUS" != "HEALING" && "$STATUS" != "HEALED"}
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
    #if {$MANA_PCT == 1.0 && "$STATUS" == "SLEEPING"}
    {
        wake
    }
}

#alias {aaa}
{
    #variable STATUS READY;
    #variable KILL TRUE;

    #ticker {looking}
    {
    	#if {"$STATUS" != "SLEEPING"}
    	{
    		#showme {Looking...};
    		look
    	};
    } {15}
}

#alias {sss}
{
    #variable KILL FALSE;
    #variable STATUS READY;
    #unticker {looking}
}

#alias {k}
{
	#if {("$STATUS" == "READY" || "$STATUS" == "HEALED") && "$KILL" == "TRUE"}
    {
    	#showme {Attacking %1...};
 	   	#variable STATUS ATTACKING;
    	kill %1
	}
}
