#variable {COST_ARMR} {20}
#variable {COST_AURA} {80}
#variable {COST_BLES} {5}
#variable {COST_CAID} {20}
#variable {COST_CSTR} {30}
#variable {COST_CURE} {20}
#variable {COST_CRFO} {5}
#variable {COST_CRWA} {5}
#variable {COST_DINV} {10}
#variable {COST_HSTR} {25}
#variable {COST_FRWA} {35}
#variable {COST_FRFO} {35}
#variable {COST_PREV} {10}
#variable {COST_SANC} {100}

#variable {NEED_ARMR} {FALSE}
#variable {NEED_BLES} {FALSE}
#variable {NEED_PREV} {FALSE}
#variable {NEED_AURA} {FALSE}
#variable {NEED_CAID} {FALSE}
#variable {NEED_HSTR} {FALSE}
#variable {NEED_DINV} {FALSE}

#action {You feel less protected from evil.} {prev}
#action {You feel less protected from the rigors of the world.} {armr}
#action {You feel less righteous.} {bles}
#action {The aura around your body fades.} {aura}
#action {The detect invisible wears off.} {dinv}
#action {You feel less prepared for combat.} {caid}

#action {You feel strengthened by the power of your god.} {#variable NEED_HSTR FALSE}
#action {You feel protected from the evils of this world!} {#variable NEED_PREV FALSE}
#action {You feel someone protecting you.} {#variable NEED_ARMR FALSE}
#action {You feel righteous.} {#variable NEED_BLES FALSE}
#action {You start glowing.} {#variable NEED_AURA FALSE}
#action {You are surrounded by a small cloud of light.} {#variable NEED_AURA FALSE}
#action {You feel ready for combat!} {#variable NEED_CAID FALSE}
#action {You feel protected by the power of the divine.}{#variable NEED_DIVI FALSE}
#action {Your eyes tingle.}{#variable NEED_DINV FALSE}
#action {You feel stronger!}{#variable NEED_CSTR FALSE}

#action {You feel a lot better!} {#variable STATUS HEALED}
#action {You feel much better!} {#variable STATUS HEALED}

#action {But paelen is already protected!}{#variable NEED_ARMR FALSE}
#action {Poof!  You're an even brighter candle now.} {#variable NEED_AURA FALSE}

#alias {armr}
{
    #variable NEED_ARMR TRUE;
    #if {("$STATUS" == "READY" || "$STATUS" == "BLESSING" || "$STATUS" == "MOVING") && $MP > $COST_ARMR}
    {
        #showme Trying to ARMR...;
        #if {"%1" == ""}
        {
            cast 'armor' $CHAR;
            #variable LAST_CAST armr
        };
        #else 
        {
            cast 'armor' %1;
            #variable LAST_CAST {armr %1}
        };  
    };
}

#alias {aura}
{
    #variable NEED_AURA TRUE;
    #if {("$STATUS" == "READY" || "$STATUS" == "BLESSING" || "$STATUS" == "MOVING") && $MP > $COST_AURA}
    {
        #showme Trying to AURA...;
        cast 'aura of protection';
        #variable LAST_CAST aura
    };
}

#alias {bles}
{
    #variable NEED_BLES TRUE;
    #if {("$STATUS" == "READY" || "$STATUS" == "BLESSING" || "$STATUS" == "MOVING") && $MP > $COST_BLES}
    {
        #showme Trying to BLES...;
        #if {"%1" == ""}
        {
            cast 'bless' $CHAR;
            #variable LAST_CAST bless
        };
        #else 
        {
            cast 'bless' %1;
            #variable LAST_CAST {bles %1}
        };  
        #variable LAST_CAST bles    
    };
}

#alias {blnd}
{
    cast 'blindness' %1;
    #variable LAST_CAST {blnd %1}
}

#alias {caid}
{
    #variable NEED_CAID TRUE;
    
    #if {("$STATUS" == "READY" || "$STATUS" == "BLESSING" || "$STATUS" == "MOVING") && $MP > $COST_CAID}
    {
        #showme Trying to CAID...;
        #if {"%1" == ""}
        {
            cast 'aid' $CHAR;
            #variable LAST_CAST caid
        };
        #else 
        {
            cast 'aid' %1;
            #variable LAST_CAST {caid %1}
        };  
    };
}

#alias {crwa}
{
    #variable THIRSTY FALSE;
    #if {("$STATUS" == "READY" || "$STATUS" == "BLESSING" || "$STATUS" == "MOVING") && $MP > $COST_CRWA}
    {
        #showme Trying to CRWA...;
        #variable STATUS BLESSING;
        cast 'create water' canteen;
        #variable LAST_CAST crwa;
        drink canteen;
        #variable THIRSTY FALSE;
        #variable STATUS READY;
    };
}

#alias {crfo}
{
    #variable HUNGRY TRUE;
    #if {("$STATUS" == "READY" || "$STATUS" == "BLESSING" || "$STATUS" == "MOVING") && $MP > $COST_CRFO}
    {
        #showme Trying to CRFO...;
        #variable STATUS BLESSING;
        cast 'create food';
        #variable LAST_CAST crfo;
        eat parmesan;
        #variable HUNGRY FALSE;
        #variable STATUS READY;    
    };
}

#alias {cure}
{
    #if {$MP < $COST_CURE}
    {
        #return;
    };
    #showme Trying to CURE...;
    #variable STATUS HEALING;
    #if {"%1" == ""}
    {
        cast 'cure critic' $CHAR;
        #variable LAST_CAST cure
    };
    #else 
    {
        cast 'cure critic' %1;
        #variable LAST_CAST {cure %1}
    };  
}

#alias {heal}
{
    #if {$MP < $COST_HEAL}
    {
        #return;
    };
    #showme Trying to HEAL...;
    #variable STATUS HEALING;
    #if {"%1" == ""}
    {
        cast 'heal' $CHAR;
        #variable LAST_CAST heal
    };
    #else 
    {
        cast 'heal' %1;
        #variable LAST_CAST {heal %1}
    };  
}

#alias {dinv}
{
    #variable NEED_DINV TRUE;
    #if {("$STATUS" == "READY" || "$STATUS" == "BLESSING" || "$STATUS" == "MOVING") && $MP > $COST_DINV}
    {
        #showme Trying to DINV...;
        #if {"%1" == ""}
        {
            cast 'detect invisibility' $CHAR;
            #variable LAST_CAST dinv
        };
        #else 
        {
            cast 'detect invisibility' %1;
            #variable LAST_CAST {dinv %1}
        };  
    };
}

#alias {grec}
{
    cast 'group recall';
    #variable LAST_CAST grec;
}

#alias {frwa}
{
    #variable THIRSTY FALSE;
    #if {("$STATUS" == "READY" || "$STATUS" == "BLESSING" || "$STATUS" == "MOVING") && $VP > $COST_FRWA}
    {
        #showme Trying to FRWA...;
        #variable STATUS BLESSING;
        forage water canteen;
        #variable LAST_CAST frwa;
        drink canteen;
        #variable THIRSTY FALSE;
        #variable STATUS READY;
    };
}

#alias {frfo}
{
    #variable HUNGRY TRUE;
    #if {("$STATUS" == "READY" || "$STATUS" == "BLESSING" || "$STATUS" == "MOVING") && $VP > $COST_FRFO}
    {
        #showme Trying to FRFO...;
        #variable STATUS BLESSING;
        forage food;
        #variable HUNGRY FALSE;
        #variable STATUS READY;    
    };
}

#alias {hstr}
{
    #variable NEED_HSTR TRUE;
    #if {("$STATUS" == "READY" || "$STATUS" == "BLESSING" || "$STATUS" == "MOVING") && $MP > $COST_HSTR}
    {
        #showme Trying to HSTR...;
        #if {"%1" == ""}
        {
            cast 'holy strength' $CHAR;
            #variable LAST_CAST hstr
        };
    };
}

#alias {hrsy}
{
    cast 'cleanse heresy' %1;
    #variable LAST_CAST hrsy
}

#alias {prev}
{
    #variable NEED_PREV TRUE;
    
    #if {("$STATUS" == "READY" || "$STATUS" == "BLESSING" || "$STATUS" == "MOVING") && $MP > $COST_PREV}
    {
        #showme Trying to PREV...;
        #if {"%1" == ""}
        {
            cast 'protection from evil' $CHAR;
            #variable LAST_CAST prev
        };
        #else 
        {
            cast 'protection from evil' %1;
            #variable LAST_CAST {prev %1}
        };  
    };
}

#alias {reju}
{
    cast 'rejuvenate' %1;
    #variable LAST_CAST {reju %1}
}

#alias {sanc}
{
    #variable NEED_SANC TRUE;
    
    #if {("$STATUS" == "READY" || "$STATUS" == "BLESSING" || "$STATUS" == "MOVING") && $MP > $COST_SANC}
    {
        #showme Trying to SANC...;
        #if {"%1" == ""}
        {
            cast 'sanctuary' $CHAR;
            #variable LAST_CAST sanc
        };
        #else 
        {
            cast 'sanctuary' %1;
            #variable LAST_CAST {sanc %1}
        };  
    };
}

#alias {skin}
{
    #variable NEED_SKIN TRUE;
    
    #if {("$STATUS" == "READY" || "$STATUS" == "BLESSING" || "$STATUS" == "MOVING") && $MP > $COST_SKIN}
    {
        #showme Trying to SKIN...;
        #if {"%1" == ""}
        {
            cast 'stone skin' $CHAR;
            #variable LAST_CAST SKIN
        };
        #else 
        {
            cast 'stone skin' %1;
            #variable LAST_CAST {skin %1}
        };  
    };
}

#alias {cstr}
{
    #variable NEED_CSTR TRUE;
    
    #if {("$STATUS" == "READY" || "$STATUS" == "BLESSING" || "$STATUS" == "MOVING") && $MP > $COST_CSTR}
    {
        #showme Trying to CSTR...;
        #if {"%1" == ""}
        {
            cast 'strength' $CHAR;
            #variable LAST_CAST CSTR
        };
        #else 
        {
            cast 'strength' %1;
            #variable LAST_CAST {cstr %1}
        };  
    };
}

#alias {summ}
{
    #showme Trying to SUMM...;
    cast 'summon' %1;
    #var LAST_CAST {summ %1}
}

#alias {wrec}
{
    cast 'word of recall';
    #variable LAST_CAST wrec;
}

#alias {resc}
{
    rescue %1
}
