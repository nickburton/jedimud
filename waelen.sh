#read common.sh
#read loop.sh
#read follow.sh
#read mobs.sh

#variable {HP_MIN_PCT} {0.7}
#variable {MP_MIN_PCT} {0.5}
#variable {VP_MIN_PCT} {0.7}

#variable {CAN_HEAL} {FALSE}

#variable {LAST_PATH} {NIL}

#action {The aura around your body fades.} 
{
    tell haelen sanc;
}

#alias {crwa}
{
    #variable THIRSTY FALSE;
    drink canteen;
    #variable THIRSTY FALSE;
}

#alias {check-bless}
{
    #showme nothing to bless;
}

#alias {crfo}
{
    eat waybread;
}

#alias {post-attack}
{
    #showme no post attack;
}

#alias {check-next}
{
    mmm;
    #var STATUS READY;
    #path load toy;
    lll;
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

#action {You don't seem to have a waybread.}
{
    eat chicken;
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

