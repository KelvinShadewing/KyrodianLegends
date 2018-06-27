/*========*\
| CONTROLS |
\*========*/

::klKeyDown <- k_down;
::klKeyUp <- k_up;
::klKeyLeft <- k_left;
::klKeyRight <- k_right;
::klKeyJump <- 0;
::klKeyAttack <- 0;
::klKeyDash <- 0;
::klKeySpec0 <- 0;
::klKeySpec1 <- 0;
::klKeySpec2 <- 0;
::klKeyMenu <- 0;
::klKeySwitch <- 0;

::klJoyDown <- 0;
::klJoyUp <- 0;
::klJoyLeft <- 0;
::klJoyRight <- 0;
::klJoyJump <- 0;
::klJoyAttack <- 0;
::klJoyDash <- 0;
::klJoySpec0 <- 0;
::klJoySpec1 <- 0;
::klJoySpec2 <- 0;
::klJoyMenu <- 0;
::klJoySwitch <- 0;


::klBtnPress <- function(button){
	switch(button){
		case "left":
			if(keyPress(klKeyLeft)) return true;
			break;
		case "right":
			break;
	};

	return false;
};
