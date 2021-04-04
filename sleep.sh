#alias {sleep}
{
    sle;
    #variable STATUS SLEEPING;
    #ticker {sleep-check} 
    {
    	#cr
    } {20}
}

#alias {wake}
{
    wak;
    stand;
    check-food;
    check-water;
    #variable STATUS READY;
    #unticker {sleep-check}
}

#action {You awake, and sit up.}
{
    stand
}
