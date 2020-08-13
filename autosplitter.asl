state("MAIDFXVR_BLEU")
{
    string40 level : 0x1ECC5E;
	byte granslak : 0x1E682C;
	byte breastplate : 0x323AE8;
}

update
{
	print(current.level);
}

init
{
	vars.granslakkilled = false;
	vars.donable = false;
	vars.db2 = false;
	vars.db = false;
	vars.once = false;
	vars.ooc = false;
	vars.taken = false;
	vars.takenbreat = true;
	vars.atlciv = false;
	vars.bltorras = false;
}

start
{
	//split to start the game
	if (old.level == "fix.ptx" && current.level == @"manoir\manoir.ptx"){
		return true;
	}
}

reset
{
	//split to reset the game
	if (current.level == "fix.ptx"){
		return true;
	}
}

split
{
	//split to torras I
	if (current.level == @"toras\toras.ptx" && vars.bltorras == false){
		vars.bltorras = true;
		return true;
	}
	//configurating breastplate
	if(current.breastplate > 0 && vars.ooc == false &&  current.level == @"fort\fort.ptx"){
		vars.ooc = true;
	}
	if (vars.ooc == true && current.breastplate == 0){
		vars.takenbreat= false;
	}
	//split to breastplate
	if (current.breastplate > 0 && vars.taken == false && vars.takenbreat == false && current.level == @"fort\fort.ptx"){
		vars.takenbreat = true;
		vars.taken = true;
		return true;
	}
	//split from torras to torras 2
	if (old.level == @"toras\toras.ptx" && current.level == @"toras2\toras2.ptx" && vars.donable == false){
		vars.donable = true;
		return true;
	}
	//split from field of courage to torras
	if (old.level == @"casino\casino.ptx" && current.level == @"toras2\toras2.ptx" && vars.db2 == false){
		vars.db2 = true;
		return true;
	}
	//split from torras II to torras III
	if (old.level == @"toras2\toras2.ptx" && current.level == @"toras3\toras3.ptx" && vars.db == false){
		vars.db = true;
		return true;
	}
	//split to lost city
	if (current.level == @"cite3\cite3.ptx"){
		return true;
	}
	//split to era IV in torras
	if (old.level == @"toras3\toras3.ptx" && current.level == @"toras4\toras4.ptx" && vars.once == false){
		vars.once = true;
		return true;
	}
	//split from Dungeons to fortress
	if (old.level == @"cachots4\cachots4.ptx" && current.level == @"fort4\fort4.ptx"){
		return true;
	}
	//configuring lost city IV
	if (current.level == @"cite4\cite4.ptx"){
		vars.ooc = false;
		vars.takenbreat = false;
		vars.atlciv = true;
		vars.taken = false;
	}
	if (vars.atlciv == true){
		if (vars.splitbreaker == 6 && current.breastplate > 0 && vars.ooc == false && vars.taken == false && vars.takenbreat == false){
			vars.ooc = true;
			vars.taken = true;
			vars.takenbreat = true;
			vars.atlciv = false;
			return true;
		}
		else{
			if (current.breastplate > 0 && old.breastplate == 0){
				vars.splitbreaker += 1;
			}
		}
	}
}