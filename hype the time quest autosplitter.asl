state("MAIDFXVR_BLEU")
{
    //string40 level : 0x1ECC5E;
	byte boss : 0x1E682C;
	byte breastplate : 0x323AE8;
	string40 level : 0x1ECC5E;
	byte loadingnow : 0x3141E8;
	byte cutscene : 0x2107FC
}

init
{
	vars.timesbar = 0;
	vars.startcounting = false;
	vars.timeslast = 0;
}

start
{
	//split to start the game
	if(current.loadingnow == 0 && current.level == @"manoir\manoir.ptx")
	{
		vars.timesbar = 0;
		vars.startcounting = false;
		vars.timeslast = 0;
		return true;
	}
}

reset
{
	//split to reset the game
	if (current.level == "fix.ptx")
	{
		return true;
	}
}

split
{
	if (current.level == @"toptower\toptower.ptx" && current.cutscene == 1 && old.cutscene == 0)
	{
		vars.timeslast += 1;
	}
	if (vars.timeslast == 3)
	{
		return true;
	}
}

isLoading
{
	//pauses the count during the loading screen
	if (current.loadingnow == 1)
	{
		return true;
	}
	else
	{
		return false;
	}
}