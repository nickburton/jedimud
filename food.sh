#variable {HUNGRY} {FALSE}
#variable {THIRSTY} {FALSE}

#alias {check-food} 
{
	#if {"$HUNGRY" == "TRUE"}
    {
        feedme
    };
}

#alias {check-water}
{
	#if {"$THIRSTY" == "TRUE"}
    {
        drinkme
    };
}

#alias {get-bread}
{
    #4 s;
    w;
    n;
    visible;
    buy 5 waybread;
    s;
    e;
    #4 n;
}

#action {You are famished!} { feedme }
#action {You are starting to get really hungry.} { feedme }
#action {You could use a bite to eat soon.} { feedme }
#action {You feel a faint gnawing in your stomach.} { feedme }

#action {You are getting quite thirsty.} { drinkme }
#action {You are parched!} { drinkme }
#action {You feel somewhat thirsty.} { drinkme }
#action {Your mouth is a little dry.} { drinkme }