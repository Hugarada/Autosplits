state("MAIDFXVR_BLEU")
{
    string40 level : 0x1ECC5E;
	byte granslak : 0x1E682C;
	byte breastplate : 0x323AE8;
}

update
{
	print(current.level);
	print(vars.actualsplit);
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
	vars.unrepeatable = false;
	vars.hereonce = false;
	vars.t1f = false;
	vars.t2f = false;
	vars.t3f = false;
	vars.enostkilled = false;
	vars.voithded = false;
	vars.splitbreaker = 0;
	vars.firsttime = false;
	vars.unchanged = false;
	vars.actualsplit = "";
}

start
{
	//split to start the game
	if (old.level == "fix.ptx" && current.level == @"manoir\manoir.ptx"){
		vars.granslakkilled = false;
		vars.donable = false;
		vars.db2 = false;
		vars.db = false;
		vars.once = false;
		vars.ooc = false;
		vars.taken = false;
		vars.takenbreat = false;
		vars.atlciv = false;
		vars.bltorras = false;
		vars.splittrigger = false;
		vars.catchable = false;
		vars.done = false;
		vars.donable2 = false;
		vars.armorcomplete = false;
		vars.unrepeatable = false;
		vars.hereonce = false;
		vars.t1f = false;
		vars.t2f = false;
		vars.t3f = false;
		vars.enostkilled = false;
		vars.voithded = false;
		vars.splitbreaker = 0;
		vars.firsttime = false;
		vars.unchanged = false;
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
		vars.actualsplit = "Senekal split";
	}
	//configuring jewel of mankind
	if(current.level == @"casino\casino.ptx" && vars.splitbreaker >= 4 && vars.catchable == false){
		vars.cathcable = true;
		vars.splitbreaker = 0;
	}
	if (current.breastplate > 0 && current.level == @"casino\casino.ptx"){
		vars.splitbreaker += 1;
	}
	if (vars.catchable == true && current.granslak > 0){
		vars.unrepeatable = true;
		vars.catchable = false;
	}
	if (old.level == @"casino\casino.ptx" && current.level == @"toras2\toras2.ptx"){
		vars.done = false;
	}
	//split to jewel of mankind
	if (vars.splitbreaker >= 2 && vars.unrepeatable == true && vars.done == false){
		vars.unrepeatable = false;
		vars.splitbreaker = 0;
		vars.done = true;
		vars.armorcomplete = true;
		return true;
		vars.actualsplit = "jewel of mankind";
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
		vars.donable = false;
		return true;
		vars.actualsplit = "split of royal jewel";
	}
	//split to torras I
	if (current.level == @"toras\toras.ptx" && vars.bltorras == false){
		vars.bltorras = true;
		return true;
		vars.actualsplit = "torras split";
	}
	//configurating breastplate
	if (old.level == @"fort\fort.ptx" && current.level == @"cachots\cachots.ptx"){
		vars.firsttime = true;
	}
	if (vars.taken == true && old.level == @"fort\fort.ptx" && current.level == @"toras\toras.ptx"){
		vars.taken = false;
		vars.hereonce = true;
	}
	//split to breastplate
	if (current.level == @"fort\fort.ptx" && vars.firsttime == true && vars.hereonce == false && old.breastplate == 0 && current.breastplate > 0){
		vars.splitbreaker += 1;
	}
	if (current.level == @"fort\fort.ptx" && vars.splitbreaker == 2 && vars.takenbreat == false){
		vars.splitbreaker = 0;
		vars.takenbreat = true;
		return true;
	}
	//split from torras to torras 2
	if (old.level == @"toras\toras.	ptx" && current.level == @"toras2\toras2.ptx" && vars.donable2 == false){
		vars.donable2 = true;
		return true;
		vars.actualsplit = "era 2 split";
	}
	//split from torras II to torras III
	if (old.level == @"toras2\toras2.ptx" && current.level == @"toras3\toras3.ptx" && vars.db == false){
		vars.db = true;
		return true;
		vars.actualsplit = "era 3 split";
	}
	//split to jewel of virtue
	if (current.level == @"cite3\cite3.ptx" && vars.splitbreaker >= 9 && current.breastplate == 0){
		vars.splitbreaker = 0;
		return true;
		vars.actualsplit = "jewel of virtue split";
	}
	else if (current.level == @"cite3\cite3.ptx" && old.breastplate == 0) {
		vars.splitbreaker += 1;
	}
	//split to era IV in torras
	if (old.level == @"toras3\toras3.ptx" && current.level == @"toras4\toras4.ptx" && vars.once == false){
		vars.once = true;
		return true;
		vars.actualsplit = "era 4 split";
	}
	//split from Dungeons to fortress
	if (old.level == @"cachots4\cachots4.ptx" && current.level == @"fort4\fort4.ptx"){
		return true;
		vars.actualsplit = "Hype's room split";
	}
	//configuring lost city IV
	if (current.level == @"cite4\cite4.ptx"){
		vars.ooc = false;
		vars.takenbreat = false;
		vars.atlciv = true;
		vars.taken = false;
	}
	//split lost city IV
	if (vars.atlciv == true){
		if (vars.splitbreaker >= 6 && current.breastplate > 0 && vars.ooc == false && vars.taken == false && vars.takenbreat == false){
			vars.ooc = true;
			vars.taken = true;
			vars.takenbreat = true;
			vars.atlciv = false;
			return true;
			vars.actualsplit = "jewel of the gods split";
		}
		else if (current.breastplate > 0 && old.breastplate == 0){
				vars.splitbreaker += 1;
		}
	}
	//configuring boots & spliting boots
	if (current.level == @"brigand3\brigand3.ptx" && current.breastplate == 1 && vars.splitbreaker >= 5){
		vars.splitbreaker = 0;
		return true;
		vars.actualsplit = "boots split";
	}
	else if (current.level == @"brigand3\brigand3.ptx" && old.breastplate == 0){
		vars.splitbreaker += 1;
	}
	//configuring laboratories almanac
	if (current.level == @"labo3\labo3.ptx" && old.granslak == 0 && vars.unrepeatable == false){
		vars.unrepeatable = true;
	}
	//splting laboratories almanac
	if (vars.unrepeatable == true && vars.breastplate == 1){
		vars.unrepeatable = false;
		return true;
		vars.actualsplit = "laboratories split";
	}
	//configuring monastery almanac
	if (current.level == @"monast3\monast3.ptx" && old.breastplate == 0){
		vars.splitbreaker += 1;
	}
	//spliting monastery almanac
	if (current.level == @"monast3\monast3.ptx" && current.breastplate == 1 && vars.splitbreaker >= 2){
		vars.splitbreaker = 0;
		return true;
		vars.actualsplit = "monastery split";
	}
	//spliting enost almanac
	if (current.level == @"tour3\tour3.ptx" && old.level != "fix.ptx" && current.breastplate == 1 && vars.splitbreaker >= 5){
		vars.splitbreaker = 0;
		return true;
		vars.actualsplit = "Enost split";
	}
	else if (current.level == @"tour3\tour3.ptx" && old.breastplate == 0){
			vars.splitbreaker += 1;
	}
	if (current.level == @"tour3\tour3.ptx" && old.level == "fix.ptx" && current.breastplate == 1 && vars.splitbreaker >= 2){
		vars.splitbreaker = 0;
		return true;
		vars.actualsplit = "Enost split";
	}
	//spliting to T3 flag
	if (current.level == @"casino3\casino3.ptx" && current.breastplate == 1 && vars.splitbreaker >= 2){
		vars.splitbreaker = 0;
		vars.t3f = true;
		return true;
		vars.actualsplit = "T3 split";
	}
	//config T3 flag
	if(current.level == @"casino3\casino3.ptx" && old.breastplate == 0){
		vars.splitbreaker += 1;
	}
	//split T1 flag
	if (vars.hereonce == true && current.level == @"fort\fort.ptx" && vars.splitbreaker >= 2 && current.breastplate == 1){
		vars.splitbreaker = 0;
		vars.t1f = true;
		return true;
		vars.actualsplit = "T1 split";
	}
	//split T2 flag
	if (current.level == @"monast2\monast2.ptx" && vars.splitbreaker >= 2 && current.breastplate == 1){
		vars.splitbreaker = 0;
		vars.t2f = true;
		return true;
		vars.actualsplit = "T2 split";
	}
	//split to T4
	if (current.level == @"toras4\toras4.ptx" && vars.splitbreaker >= 3 && current.breastplate == 1 && vars.t1f == true && vars.t2f == true && vars.t3f == true){	
		vars.splitbreaker = 0;
		return true;
		vars.actualsplit = "T4 split";
	}
	//split to enost
	if (vars.splitbreaker >= 7 && current.breastplate == 1 && vars.enostkilled == false && current.level == @"tour\tour.ptx"){
		vars.enostkilled = true;
		vars.splitbreaker = 0;
		return true;
		vars.actualsplit = "enost boss split";
	}
	else if (current.level == @"tour\tour.ptx" && old.breastplate == 0){
		vars.splitbreaker += 1;
	}
	//configuring barnak
	if (vars.splitbreaker == 9 && current.level == @"toptower\toptower.ptx"){
		vars.voithded = true;
	}
	//split barnak
	if (vars.voithded == true && old.granslak > 0 && current.granslak == 0){
		return true;
		vars.actualsplit = "barnak split";
	}
}
