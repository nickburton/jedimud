#read common.sh
#read loop.sh
#read follow.sh
#read mobs.sh
#read mobs-tg.sh

#variable {HP_MIN_PCT} {0.6}
#variable {MP_MIN_PCT} {0.5}
#variable {VP_MIN_PCT} {0.8}

#variable {CAN_HEAL} {FALSE}

#alias {crwa}
{
    #variable THIRSTY FALSE;
    drink canteen;
    drink canteen;
    #variable THIRSTY FALSE;
}

#alias {crfo}
{
    eat waybread;
}

#alias {check-next}
{
    mmm;
    #path load tg;
    lll; 
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

