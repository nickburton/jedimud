#read common.sh
#read loop.sh
#nop no follow.sh

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

#alias {debuff}
{
    sing 'slow' %1;
    sing 'illusion' %1;
    frep;
}

#alias {first}
{
    n;n;n;n;e;u;s;s;w;prep;unlock door;open door;sing 'mirror image';n;debuff master;
}

#alias {second}
{
    e;e;e;u;s;w;w;n;prep;unlock door;open door;sing 'mirror image';e;debuff master;
}

#alias {third}
{
    w;w;w;n;n;e;e;u;prep;unlock door;open door;sing 'mirror image';w;debuff master;
}

#alias {fourth}
{
    s;s;s;w;w;u;n;e;prep;unlock door;open door;sing 'mirror image';s;debuff master;
}

#alias {dean}
{
    prep;unlock door;open door;sing 'mirror image';u;debuff dean;
}

#alias {rfirst}
{
    n;n;n;n;e;u;s;s;w;prep;sing 'mirror image';n;sing 'illusion' master;frep;kill master;
}

#alias {rsecond}
{
    e;e;e;u;s;w;w;n;prep;sing 'mirror image';e;sing 'illusion' master;frep;kill master;
}

#alias {rthird}
{
    w;w;w;n;n;e;e;u;prep;sing 'mirror image';w;sing 'illusion' master;frep;kill master;
}

#alias {rfourth}
{
    s;s;s;w;w;u;n;e;prep;;sing 'mirror image';s;sing 'illusion' master;frep;kill master;
}

#alias {rdean}
{
    prep;sing 'mirror image';u;sing 'illusion' dean;frep;kill dean;
}

#alias {ans}
{
    transport anstruth;
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
    get waybread;
    get canteen;
    #delay {5}
    {
        #path load tg;
        #variable STATUS READY;
        lll;
    }
}

#action {It's already empty}
{
    put canteen chest;
}

#alias {sleep-gear}
{
    get essence chest;hold essence;put might chest;
    #2 get helical chest;
    #2 rem red;
    #2 wear helical;
    #2 put red chest;
}

#alias {wake-gear}
{
    #if {$MP > $COST_MIRR}
    {
        #show nothing for now;
    };   
    get might chest;hold might;put essence chest;
    #2 get red chest;
    #2 rem helical;
    #2 wear red;
    #2 put helical chest;   
}

#alias {con-gear}
{
	get bag chest;
    get hover bag; eq hover; put nike bag;
    get ornate bag; rem golden; wear ornate; put golden bag;
    get ornate bag; rem golden; wear ornate; put golden bag;
    put bag chest;
}

#alias {dam-gear}
{
	get bag chest;
    get nike bag; eq nike; put hover bag;
    
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
    eq guitar;
}

#alias {frep}
{
    eq sword;
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
    #if {$MP > $COST_MIRR && $MP > $COST_MIRR}
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

#alias {fc}
{
    get canteen chest;
    fill canteen fountain;
    drop canteen;
    get canteen chest;
    fill canteen fountain;
    get canteen;
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