#read mobs-chess-mages.sh
#read mobs.sh

#variable {LOOP} {FALSE}
#variable {NEED_HP} {FALSE}
#variable {NEED_MP} {FALSE}

#variable {MP} {0}


#alias {loop-chess}
{
    #delay {10}
    {
        #if {"$STATUS" == "SLEEPING"}
        {
            wake
        };
        #showme +++MID-NT+++;
        mid-nt;
        #showme +++NT-CHESS+++;
        nt-chess;
        #path load chess;
        lll;
        #variable LAST_PATH CHESS;
    }
}

#alias {loop-mages}
{  
    #delay {10}
    {
        #if {"$STATUS" == "SLEEPING"}
        {
            wake
        };
        #showme +++MID-MAGES+++;
        mid-mages;
        #path load mages;
        lll;
        #variable LAST_PATH MAGES;   
    }
}

#alias {loop-toy}
{   
    #delay {10}
    {
        #if {"$STATUS" == "SLEEPING"}
        {
            wake
        };
        #showme +++MID-NT+++;
        mid-nt;
        #showme +++NT-TOY+++;
        nt-toy;
        #path load toy;
        lll;
    }
}

#alias {k}
{
    #if {"$KILL" == "TRUE" && ("$STATUS" == "READY")}
    {
        #if {"$NEED_HP" != "TRUE" && "$NEED_MP" != "TRUE"}
        {
            #variable STATUS ATTACKING;
            kill %1;
            stop-looker;
        }
    };
}

#alias {attack-spell}
{

}

#alias {check-loop}
{
    #if {"$LOOP" == "TRUE"}
    {
        start-looker;
    }
}

#action {[ Exits:}
{
	#if {"$LOOP" == "TRUE" && "$STATUS" == "READY"}
	{
        #delay {2} 
        {
            #if {"$LOOP" == "TRUE" && "$STATUS" == "READY"}
            {
                #showme ++++Walking++++;
                #path describe;
                #path walk;
                #variable STATUS MOVING;
            };    
        };
	};
}

#action {[%0/%1H %2/%3M %4/%5V XP}
{
    #showme $STATUS;
    #variable MP %2;

    #if {"$LOOP" == "FALSE" && "$KILL" == "FALSE"}
    {
        #return;
    };

    #variable HP %0;
    #variable HP_MAX %1;
    
    #variable MP_MAX %3;

    #math {HP_PCT} {%0 / %1 * 1.0};
    #math {MP_PCT} {%2 / %3 * 1.0};
    #math {VP_PCT} {%4 / %5 * 1.0};


    #showme [$HP_PCT _ $MP_PCT _ $VP_PCT];

    #if {$HP_PCT < $HP_MIN_PCT} 
    {
        #variable NEED_HP TRUE
    };
    #else 
    {
        #variable NEED_HP FALSE
    };

    #if {"$STATUS" != "ATTACKING" && "$STATUS" != "SLEEPING"} 
    {
        #if {$HP_PCT < $HP_MIN_PCT || $MP_PCT < $MP_MIN_PCT || $VP_PCT < $VP_MIN_PCT} 
        {
            #if {$VP_PCT < $VP_MIN_PCT && "$CAN_REJU" == "TRUE"}
            {
                reju
            };
            #else
            {
                sleep
            };
        };
    };
    #elseif {"$STATUS" == "SLEEPING"}
    {
        #if {$HP_PCT == 1.0 && $MP_PCT == 1.0 && $VP_PCT > $VP_MIN_PCT}
        {
            wake
        };
    };
    #elseif {"$STATUS" != "HEALING"}
    {
        #if {$HP_PCT <= $HP_MIN_PCT && $MP > $HEAL_COST && "$CAN_HEAL" == "TRUE"}
        {
            heal;
            #variable STATUS HEALING;
            #return    
        };
    };
}

#alias {lll}
{
    #variable STATUS READY;
    #variable LOOP TRUE;
    #variable KILL TRUE;

    start-looker;
}

#alias {start-looker}
{
    #ticker {look-mover}
    {
        #if {"$STATUS" != "ATTACKING" && "$STATUS" != "BLESSING" && "$STATUS" != "SLEEPING"}
        {
            #showme Looking...;
            #var STATUS READY;
            look
        };
    } {5};
}

#alias {stop-looker}
{
    #unticker {look-mover};
    #variable STATUS READY;
}

#alias {mmm}
{
    #variable LOOP FALSE;
    #variable KILL FALSE;
    #unticker {move-max};
    stop-looker;
    #delay {2}
    {
        #variable {STATUS} {READY};
    }
}

#action {END OF PATH}
{
    mmm;
    check-next;
}
