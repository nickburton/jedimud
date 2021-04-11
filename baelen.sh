#read common.sh
#read loop.sh
#read mobs-tg.sh
#read follow.sh

#variable {HP_MIN_PCT} {0.6}
#variable {MP_MIN_PCT} {0.5}
#variable {VP_MIN_PCT} {0.8}


#variable {CAN_HEAL} {FALSE}


#alias {check-bless}
{
    #variable STATUS BLESSING;
	#if {"$NEED_PREV" == "TRUE"}
    {
        prev

    };
    #variable STATUS READY;
}

#alias {check-next}
{
    #variable STATUS READY;
    #path load toy;
    lll;
}

#alias {sleep-gear}
{
    #showme Wearing Sleep Gear....;
    
}

#alias {wake-gear}
{
    #showme Wearing Wake Gear....;
}

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
	#2 e;
	s;
}

#alias {trainer-mid}
{
	#3 s;
	#3 w;
	#5 n;
}

#alias {feedme}
{
    get waybread chest;
    eat waybread
}

#alias {drinkme}
{
    drca
}

#alias {prep}
{
    get recorder chest;
    eq recorder;
}

#alias {frep}
{
    eq laced;
    put recorder chest;
}

#alias {insp}
{
    sing 'inspire' %1;
}

#alias {cfly}
{
    sing 'fly' %1;   
}

#alias {illu}
{
    sing 'illusion' %1;   
}

#alias {blur}
{
    sing 'blur' %1;   
}

#alias {grec}
{
    tell haelen grec-now;
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
    Baelen
}

