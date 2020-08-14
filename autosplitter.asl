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
	vars.splittrigger = false;
	vars.catchable = false;
	vars.done = false;
	vars.donable2 = false;
	vars.armorcomplete = false;
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
	//split to senekal weapons
	if(current.level == @"casino\casino.ptx" && vars.splitbreaker >= 4 && vars.armorcomplete == true){
		return true;
	}
	//configuring casino
	if (current.breastplate > 0 && current.level == @"casino\casino.ptx"){
		vars.splitbreaker += 1;
	}
	//configuring jewel of mankind
	if(current.level == @"casino\casino.ptx" && vars.splitbreaker == 4 && vars.catchable == false){
		vars.cathcable = true;
		vars.splitbreaker = 0;
	}
	//split to jewel of mankind
	if (current.level == @"casino\casino.ptx" && vars.splitbreaker >= 3 && vars.catchable == true && vars.done == false){
		vars.catchable = false;
		vars.splitbreaker = 0;
		vars.done = true;
		vars.armorcomplete = true;
		return true;
	}
	//configuring royal jewel
	if (current.granslak > 0 && current.breastplate == 1 && current.level == @"monast1\monast1.ptx"){
		vars.splittrigger = true;
	}
	if (vars.splittrigger == true && vars.donable == false && current.breastplate == 0){
		vars.donable = true;
	}
	//split from royal jewel
	if (vars.splittrigger == true && vars.donable == true && current.breastplate == 1){
		vars.splittrigger = false;
		vars.donable = true;
		return true;
	}
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
	if (old.level == @"toras\toras.ptx" && current.level == @"toras2\toras2.ptx" && vars.donable2 == false){
		vars.donable2 = true;
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
