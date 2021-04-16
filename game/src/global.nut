////////////
// GLOBAL //
////////////

::gvGameMode <- 0
::game <- {
	//Global variables for gameplay
	//Stored in player save files
	health = 4,
	maxHealth = 0,

	//Pointer to player actor
	player = 0,
	//Starting character
	char0 = Midi,
	//Character to swap to
	char1 = 0,
	charUnlocked = ["Midi"]
}

::config <-{
	//Configuration data is stored in this table.

	key = {
		down = k_down,
		up = k_up,
		left = k_left,
		right = k_right,
		jump = k_s,
		attack = k_d,
		run = k_lshift,
		specp = k_f,
		specs = k_a,
		spect = k_w,
		menu = k_tab,
		swap = k_backspace
	}

	klJoyDown = [0, 0],
	klJoyUp = [0, 0],
	klJoyLeft = [0, 0],
	klJoyRight = [0, 0],
	klJoyJump = [0, 0],
	klJoyAttack = [0, 0],
	klJoyDash = [0, 0],
	klJoySpecP = [0, 0],
	klJoySpecS = [0, 0],
	klJoySpecT = [0, 0],
	klJoyMenu = [0, 0],
	klJoySwitch = [0, 0]
}

::camx <- 0
::camy <- 0