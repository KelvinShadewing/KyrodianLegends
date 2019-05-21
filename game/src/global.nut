////////////
// GLOBAL //
////////////

::gvGameMode <- 0;
::Game <- {
	//Global variables for gameplay
	//Stored in player save files
};
::gvCfg <-{
	//Configuration data is stored in this table.

	klKeyDown = [k_down, 0],
	klKeyUp = [k_up, 0],
	klKeyLeft = [k_left, 0],
	klKeyRight = [k_right, 0],
	klKeyJump = [k_s, 0],
	klKeyAttack = [k_d, 0],
	klKeyDash = [k_lshift, 0],
	klKeySpecP = [k_w, 0],
	klKeySpecS = [k_a, 0],
	klKeySpecT = [k_f, 0],
	klKeyMenu = [k_tab, 0],
	klKeySwitch = [k_, 0],

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
};
