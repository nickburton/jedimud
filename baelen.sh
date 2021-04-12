#read common.sh
#read loop.sh
#read mobs-tg.sh
#read follow.sh

#variable {HP_MIN_PCT} {0.8}
#variable {MP_MIN_PCT} {0.0}
#variable {VP_MIN_PCT} {0.8}

#variable {COST_INSP} {20}
#variable {COST_BLUR} {10}
#variable {COST_CFLY} {15}
#variable {COST_MIRR} {35}

#variable {NEED_INSP} {FALSE}
#variable {NEED_BLUR} {FALSE}
#variable {NEED_CFLY} {FALSE}

#variable {CAN_HEAL} {FALSE}

#alias {loop-tg}
{
    mid-tg;
    #path load tg;
    lll;
}

#alias {check-bless}
{
    #variable STATUS BLESSING;
    #if {"$NEED_INSP" == "TRUE" || "$NEED_BLUR" == "TRUE" || "$NEED_CFLY" == "TRUE"}
    {
        prep;    
    };
    #variable NEED_FREP FALSE;
	#if {"$NEED_INSP" == "TRUE"}
    {
        sing 'inspire';   
        #variable LAST_CAST insp;
        #variable NEED_FREP TRUE;
    };
    #if {"$NEED_BLUR" == "TRUE"}
    {
        sing 'blur';   
        #variable LAST_CAST blur;
        #variable NEED_FREP TRUE;
    };
    #if {"$NEED_CFLY" == "TRUE"}
    {
        sing 'fly';   
        #variable LAST_CAST cfly;
        #variable NEED_FREP TRUE;
    };
    #if {"$NEED_FREP" == "TRUE"}
    {
        frep;
    };
    mirr;
    #variable STATUS READY;
}

#action {Raelen disappears.}
{
    get recall chest;
    rec recall;
}

#alias {check-next}
{
    #variable STATUS READY;
    tg-mid;
    #2 s;
    fc;
    #2 n;
    get-bread;
    mid-tg;
    #delay {5}
    {
        #path load tg;
        #variable STATUS READY;
        lll;
    }
}

#alias {sleep-gear}
{
    #showme Wearing Sleep Gear....;
    
}

#alias {wake-gear}
{
    #if {$MP > $COST_MIRR}
    {
        mirr
    };   
}

#alias {con-gear}
{
	get bag chest;
    get hover bag; eq hover; put sandals bag;
    get ornate bag; rem golden; wear ornate; put golden bag;
    get ornate bag; rem golden; wear ornate; put golden bag;
    put bag chest;
}

#alias {dam-gear}
{
	get bag chest;
    get sandals bag; eq sandals; put hover bag;
    
    get golden bag; rem ornate; wear golden; put ornate bag;
    get golden bag; rem ornate; wear golden; put ornate bag;
    put bag chest;
}

#alias {mid-trainer}
{
	#5 s;
	#2 e;
	s;
}

#alias {trainer-mid}
{
	n;
    #2 w;
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
    get lyre chest;
    eq lyre;
}

#alias {frep}
{
    eq laced;
    put lyre chest;
}

#alias {insp}
{
    prep;
    sing 'inspire' %1;
    #variable LAST_CAST insp;
    frep;
}

#alias {cfly}
{
    prep;
    sing 'fly' %1;   
    #variable LAST_CAST cfly;
    frep;
}

#alias {illu}
{
    prep;
    sing 'illusion' %1;   
    frep;
}

#alias {blur}
{
    prep;
    sing 'blur' %1;   
    #variable LAST_CAST blur;
    frep;
}

#alias {mirr}
{
    #if {$MP > $COST_MIRR && $MP > 100}
    {
        prep;
        sing 'mirror image';
        #variable LAST_CAST mirr;
        frep;    
    };
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
        drink canteen;
        drink canteen;
    };
}

#action {By what name do you wish to be known?}
{
    Baelen
}

#action {You feel inspired.} {#variable NEED_INSP FALSE}
#action {As the song surrounds you, you feel it protect you.} {#variable NEED_BLUR FALSE}
#action {You feel your feet leave the ground.} {#variable NEED_CFLY FALSE}

#action {You feel less ready to fight.} {#variable NEED_INSP TRUE}
#action {Your shape coalesces.} {#variable NEED_BLUR TRUE}
#action {You slowly float back to the ground.} {#variable NEED_CFLY TRUE}