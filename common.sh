#read food.sh
#read path.sh
#read sleep.sh

#variable {STATUS} {READY}
#variable {KILL} {FALSE}
#variable {IN_GROUP} {FALSE}

#action {%0 is dead! R.I.P}
{
    #variable STATUS READY;
    check-bless;
    check-water;
    check-food;
    check-loop;
    look;
}

#action {A big pile of gold coins is lying here.}
{
    get coins;
}

#action {Your condition: }
{
    #variable STATUS ATTACKING
}

#action {()>}
{
    #variable STATUS READY;
}

#event {PROGRAM START}
{
    #session jedimud jedimud.com 4000
}

#action {*** PRESS RETURN:%0}
{
    #cr;
    1;
    #split 12 1
}

#alias {aaa}
{
    #variable STATUS READY;
    #variable KILL TRUE;
}

#alias {invite}
{
    beckon %1;
}

#alias {inv}
{
    beckon %1;
}

#action {Alas, you cannot go that way}
{
    #bell
}

#action {You lost your concentration!}
{
    #if {"$STATUS" != "HEALING"}
    {
        $LAST_CAST;
    }
}

#action {You have a hard time remembering all the words to your song!}
{
    $LAST_CAST;
}

#action {That player is not here.}
{
    #variable STATUS READY;
    look;
}

#action {~%1 tells you, %2}
{
    showtowin %1 tells you %2;
}

#action {~%1 gossips, %2}
{
    showtowin %1 gossips %2;
}

#action {~%1 group-says, %2}
{
	showtowin %1 group-says %2;
}

#action {~%1 group-say, %2}
{
	showtowin %1 group-say %2;
}

#action {~%1 gossip, %2}
{
    showtowin %1 gossip %2
}

#action {%0 beckons for everyone to follow.}
{
	fol %0;
    #var IN_GROUP TRUE;
}

#action {%0 beckons for you to follow.}
{
	fol %0;
    #var IN_GROUP TRUE;
    group-looker;
}

#action {starts following you}
{
	ga;
}

#action {%0 is talking to the teller.}
{
	deposit all;
}

#action {You rise a level!}
{
	save;
    dam-gear;
}

#alias {eq}
{
    wear %1
}

#alias {iden}
{
    rec identify %1
}

#alias {ga}
{
	group all;
    #variable {IN_GROUP} {TRUE};
}

#alias {group-looker}
{
    #ticker {group-ticker} 
    {
        #if {"$IN_GROUP" == "TRUE"}
        {
            group
        }
    }{5}
}

#alias {recall}
{
	get recall chest;
	rec recall;
}

#alias {showtowin}
{
	 #list window ins -1 {%0};
     #draw green rounded box 1 1 12 100 $window[-10..-1]
}

#gag {yells}
#gag {Nox says}

#config {AUTO TAB} {5000}
#config {BUFFER SIZE} {10000}
#config {CHARSET} {BIG-5}
#config {COLOR MODE} {TRUE}
#config {COLOR PATCH} {OFF}
#config {COMMAND COLOR} {\e[0;37m}
#config {COMMAND ECHO} {ON}
#config {CONNECT RETRY} {0.0}
#config {HISTORY SIZE} {1000}
#config {LOG MODE} {RAW}
#config {MOUSE} {OFF}
#config {PACKET PATCH} {AUTO OFF}
#config {RANDOM SEED} {276273369}
#config {REPEAT CHAR} {!}
#config {REPEAT ENTER} {OFF}
#config {SCREEN READER} {OFF}
#config {SCROLL LOCK} {ON}
#config {SPEEDWALK} {OFF}
#config {TAB WIDTH} {8}
#config {TELNET} {ON}
#config {TINTIN CHAR} {#}
#config {VERBATIM} {OFF}
#config {VERBATIM CHAR} {\}
#config {VERBOSE} {OFF}
#config {WORDWRAP} {ON}

#pathdir {d} {u} {32}
#pathdir {e} {w} {2}
#pathdir {n} {s} {1}
#pathdir {ne} {sw} {3}
#pathdir {nw} {se} {9}
#pathdir {s} {n} {4}
#pathdir {se} {nw} {6}
#pathdir {sw} {ne} {12}
#pathdir {u} {d} {16}
#pathdir {w} {e} {8}

#alias {clear-window} 
{
    #variable {window}
    {
     {1} {}
     {2} {}
     {3} {}
     {4} {}
     {5} {}
     {6} {}
     {7} {}
     {8} {}
     {9} {}
     {10} {}
    }
} 

#variable {window}
{
     {1} {}
     {2} {}
     {3} {}
     {4} {}
     {5} {}
     {6} {}
     {7} {}
     {8} {}
     {9} {}
     {10} {}
}
