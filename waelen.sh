#read common.sh
#read loop.sh
#read follow.sh
#read mobs.sh

#variable {HP_MIN_PCT} {0.9}
#variable {MP_MIN_PCT} {0.5}
#variable {VP_MIN_PCT} {0.3}

#variable {CAN_HEAL} {FALSE}

#variable {LAST_PATH} {NIL}

#alias {crwa}
{
    #variable THIRSTY FALSE;
    drink canteen;
    #variable THIRSTY FALSE;
}

#alias {crfo}
{
    eat waybread;
}

#alias {post-attack}
{
    block;
}

#alias {check-next}
{
    mmm;
    get recall chest;
    recite recall;
    get-recs;
    get-bread;
    s;s;
    fc;
    n;n;

    #if {"$LAST_PATH" == "CHESS"}
    {
        #ticker {mage-run} 
        {
            wake;
            #showme +++MID-MAGES+++;
            mid-knights;
            #path load mages;
            lll;
            #unticker mage-run;
            #variable LAST_PATH MAGES;
        } {100};
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
        } {1500};
    };  
}

#alias {fc}
{
    get canteen chest;
    fill canteen fountain;
    drop canteen;
    get canteen chest;
    fill canteen fountain;
    get canteen;
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
    put canteen chest;
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

#action {By what name do you wish to be known?}
{
    Waelen
}

