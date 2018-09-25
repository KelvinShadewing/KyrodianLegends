/*========*\
| CONTROLS |
\*========*/

gvCfg.keyDown <- [k_down, 0];
gvCfg.keyUp <- [k_up, 0];
gvCfg.keyLeft <- [k_left, 0];
gvCfg.keyRight <- [k_right, 0];
gvCfg.keyJump <- [0, 0];
gvCfg.keyAttack <- [0, 0];
gvCfg.keyDash <- [0, 0];
gvCfg.keySpecP <- 0;
gvCfg.keySpecS <- 0;
gvCfg.keySpecT <- 0;
gvCfg.keyMenu <- 0;
gvCfg.keySwitch <- 0;

gvCfg.joyDown <- 0;
gvCfg.joyUp <- 0;
gvCfg.joyLeft <- 0;
gvCfg.joyRight <- 0;
gvCfg.joyJump <- 0;
gvCfg.joyAttack <- 0;
gvCfg.joyDash <- 0;
gvCfg.joySpecP <- 0;
gvCfg.joySpecS <- 0;
gvCfg.joySpecT <- 0;
gvCfg.joyMenu <- 0;
gvCfg.joySwitch <- 0;

::klBtnPress <- function(button){
	switch(button){
		case "left":
			if(keyPress(klKeyLeft)) return true;
			break;
		case "right":
      if(keyPress(klKeyRight)) return true;
			break;
    case "up":
      if(keyPress(klKeyUp)) return true;
	};

	return false;
};
