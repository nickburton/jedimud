#variable {FOLLOWING} {TRUE}

#action {You join the fight!}
{
	#variable STATUS ATTACKING
}

#action {[%0 %1/%2H %3/%4M %5/%6V  %7 Align] %8 (Leader)}
{
	#if {"$LEADING" == "TRUE"}
    {
        #return
    };

	#math {HEALTH_PCT} {%1 / %2 * 1.0};

    #showme Partner HP: $HEALTH_PCT;

	#if {$HEALTH_PCT <= $HP_MIN_PCT && $MP > $COST_HEAL && "$CAN_HEAL" == "TRUE" && $MP > $COST_SANC}
	{
		cure %8;
	}
}
