#read common.sh
#read loop.sh
#read follow.sh

#variable {HP_MIN_PCT} {0.9}
#variable {MP_MIN_PCT} {0.0}
#variable {VP_MIN_PCT} {0.4}

#variable {CAN_HEAL} {TRUE}
#variable {CAN_REJU} {FALSE}

#variable {CHAR} {NIL}
#action {By what name do you wish to be known?}
{
    #variable {CHAR} {Raelen};
    $CHAR;
}

#alias {check-next}
{
    mmm;
    #var STATUS READY;
    #path load tg;
    lll;
}

#alias {check-bless}
{
    #variable STATUS BLESSING;
    #if {"$NEED_DINV" == "TRUE"}
    {
        dinv
    };
    #if {"$NEED_CSTR" == "TRUE"}
    {
        cstr
    };
    #variable STATUS READY;
}

#action {The new skin appears to be highly decorative, maybe you can sell it.}
{
    junk skin;
}

#alias {mid-trainer}
{
	mid-weeden;
    e;
    n;
    e;
    #2 n;
    w;
    #2 n;
    w;
    s;
}

#alias {trainer-mid}
{
	#3 s;
	#3 w;
	#5 n;
}

#action {It's already empty}
{
    frwa
}

#alias {feedme}
{
    frfo
}

#alias {drinkme}
{
    drca
}

#alias {mid-trainer}
{
    mid-weeden;
    weeden-num;
}

#alias {trainer-mid}
{
    num-weeden;
    weeden-mid;
}
