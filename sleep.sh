#alias {wake}
{
    wak;
    stand;
    #variable STATUS READY;
    check-food;
    check-water;
    check-bless;
    wake-gear;
    start-looker;
    #unticker {sleep-check};
}

#alias {sleep}
{
    #if {"$STATUS" != "SLEEPING" && "$STATUS" != "ATTACKING"}
    {
        #variable STATUS SLEEPING;
        #showme $STATUS;
        sleep-gear;
        sle;
        #ticker {sleep-check} 
        {
            #cr;
            #variable STATUS SLEEPING;
        } {20}
    }
}

#action {You awake, and sit up.}
{
    stand
}
