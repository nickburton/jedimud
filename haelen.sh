#read common.sh
#read loop.sh
#read follow.sh

#variable {HP_MIN_PCT} {0.8}
#variable {MP_MIN_PCT} {0.6}
#variable {VP_MIN_PCT} {0.3}

#variable {CAN_HEAL} {TRUE}
#variable {CAN_REJU} {TRUE}

#variable {CHAR} {NIL}
#action {By what name do you wish to be known?}
{
    #variable {CHAR} {Haelen};
    $CHAR;
}

#alias {check-bless}
{
    #variable STATUS BLESSING;
    #if {"$NEED_DINV" == "TRUE"}
    {
        dinv
    };
    #variable STATUS READY;
}

#action {% gives you a canteen.}
{
    crfo;
    crwa;
    crwa;
    given cateen %0;
}

#action {It's already empty}
{
    crwa
}

#action {grec-now}
{
    grec;    
}



#action {%0 tells you, 'sanc'}
{
    sanc %0;
}

#action {%0 says, 'buff'}
{
    buff %0;
}

#action {%0 tells you, 'buff'}
{
    buff %0;
}

#alias {buff}
{
    bles %1;
    armr %1;
    skin %1;
    caid %1;
    sanc %1;
}

#alias {feedme}
{
    crfo;
}

#alias {drinkme}
{
    drca
}

#alias {mid-trainer}
{
    #5 s;
    e;
    #3 n;
}

#alias {trainer-mid}
{
    #3 s;
    w;
    #5 n;
}
