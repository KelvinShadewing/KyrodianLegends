////////////
// GLOBAL //
////////////

::gvGameMode <- 0;
::game <- {
	//Global variables for gameplay
	//Stored in player save files
	health = 4,
	maxHealth = 4,
	mana = 0,
	maxMana = 0,
	stamina = 0,
	maxStamina = 0,
	xpr = 0,
	level = 1,

	//Pointer to player actor
	player = 0,
	//Starting character
	char0 = "Midi",
	//Character to swap to
	char1 = 0,
	charUnlocked = ["Midi"]
};

::config <- {
	//Configuration data is stored in this table.

	key = {
		down = k_down,
		up = k_up,
		left = k_left,
		right = k_right,
		jump = k_d,
		attack = k_f,
		spec0 = k_g,
		spec1 = k_s,
		spec2 = k_a,
		menu = k_tab,
		swap = k_backspace,
		aim = k_e
	},

	joy = {
		jump = 0,
		attack = 0,
		spec0 = 0,
		spec1 = 0,
		spec2 = 0,
		menu = 0,
		swap = 0,
		aim = 0
	}
};

::gvScreen <- null;
::camx <- 0;
::camy <- 0;
