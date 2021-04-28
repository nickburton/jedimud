#read common.sh
#read loop.sh
#nop no follow.sh

#variable {HP_MIN_PCT} {0.9}
#variable {MP_MIN_PCT} {0.5}
#variable {VP_MIN_PCT} {0.8}

#variable {CAN_HEAL} {TRUE}
#variable {CAN_REJU} {FALSE}

#variable {CHAR} {NIL}
#action {By what name do you wish to be known?}
{
    #variable {CHAR} {Paelen};
    $CHAR;
}

#alias {check-next}
{
    #path load toy;
    lll;
}

#alias {check-bless}
{
    #variable STATUS BLESSING;
    #if {"$NEED_BLES" == "TRUE"}
    {
        bles
    };
    #if {"$NEED_ARMR" == "TRUE"}
    {
        armr
    };
    #if {"$NEED_AURA" == "TRUE"}
    {
        aura
    };
    #if {"$NEED_CAID" == "TRUE"}
    {
        caid
    };
    #if {"$NEED_DINV" == "TRUE"}
    {
        dinv
    };
    #if {"$NEED_HSTR" == "TRUE"}
    {
        hstr
    };
    #variable STATUS READY;
}

#action {It's already empty}
{
    crwa
}

#alias {feedme}
{
    crfo
}

#alias {drinkme}
{
    drca
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
