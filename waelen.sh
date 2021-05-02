#read common.sh
#read loop.sh
#read follow.sh

#variable {HP_MIN_PCT} {0.7}
#variable {MP_MIN_PCT} {0.0}
#variable {VP_MIN_PCT} {0.4}

#variable {CAN_HEAL} {FALSE}
#variable {CAN_REJU} {FALSE}

#variable {CHAR} {NIL}
#action {By what name do you wish to be known?}
{
    #variable {CHAR} {Waelen};
    $CHAR;
}

#alias {check-next}
{
    #path load tg;
    lll;
}

#alias {post-attack}
{
    #nop
}

#alias {mana-gear}
{
    #11 {rem skin;put skin bag};
    get staff chest;hold staff;put might chest;
    get al-hakim chest;wear al-hakim;put golden chest;
    #2 {get ankh chest;wear ankh};
    get sandals chest;wear sandals;
    get beak chest;wear beak;put lightning, chest;
    get scales chest;hold scales;put rock chest;
}

#alias {mana-dam}
{
    get rock chest;hold rock;put scales chest;
    get lightning, chest;wear lightning,;put beak chest;
    rem sandals;put sandals chest;
    #2 {rem ankh;put ankh chest};
    get golden chest;rem al-hakim;put al-hakim chest;wear golden;
    get might chest;hold might;put staff chest;
    #11 {get skin bag;wear skin};
}

#action {You anticipate}
{
    dodge;
    dodge;
    dodge;
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

#alias {get-bag}
{
    get-recs;
    mid-knights;
    get bag;
    get all bag;
    wear all;
    recall;
}

#alias {hide-bag}
{
    get-recs;
    mid-knights;
    #13 {rem skin;put skin bag};
    drop bag;
    camo bag;
    recall;
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
