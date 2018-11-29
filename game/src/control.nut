/*========*\
| CONTROLS |
\*========*/

//Key
gvCfg.klKeyDown <- [k_down, 0];
gvCfg.klKeyUp <- [k_up, 0];
gvCfg.klKeyLeft <- [k_left, 0];
gvCfg.klKeyRight <- [k_right, 0];
gvCfg.klKeyJump <- [0, 0];
gvCfg.klKeyAttack <- [0, 0];
gvCfg.klKeyDash <- [0, 0];
gvCfg.klKeySpecP <- [0, 0];
gvCfg.klKeySpecS <- [0, 0];
gvCfg.klKeySpecT <- [0, 0];
gvCfg.klKeyMenu <- [0, 0];
gvCfg.klKeySwitch <- [0, 0];

gvCfg.klJoyDown <- [0, 0];
gvCfg.klJoyUp <- [0, 0];
gvCfg.klJoyLeft <- [0, 0];
gvCfg.klJoyRight <- [0, 0];
gvCfg.klJoyJump <- [0, 0];
gvCfg.klJoyAttack <- [0, 0];
gvCfg.klJoyDash <- [0, 0];
gvCfg.klJoySpecP <- [0, 0];
gvCfg.klJoySpecS <- [0, 0];
gvCfg.klJoySpecT <- [0, 0];
gvCfg.klJoyMenu <- [0, 0];
gvCfg.klJoySwitch <- [0, 0];

::klBtnPress <- function(button, player){
	switch(button){
		case "left":
			if(keyPress(klKeyLeft[player])) return true;
			break;
		case "right":
      if(keyPress(klKeyRight[player])) return true;
			break;
    case "up":
      if(keyPress(klKeyUp[player])) return true;
			break;
		case "up":
	  	if(keyPress(klKeyUp[player])) return true;
			break;
	};

	return false;
};
