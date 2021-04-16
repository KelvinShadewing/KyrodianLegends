/*========*\
| CONTROLS |
\*========*/

//Keyboard or button press handler
::klPress <- function(button, player) {
	switch(button) {
		case "left":
			if(keyPress(klKeyLeft[player])) return true
			break
		case "right":
      if(keyPress(klKeyRight[player])) return true
			break
    case "up":
      if(keyPress(klKeyUp[player])) return true
			break
		case "down":
	  	if(keyPress(klKeyDown[player])) return true
			break
	}

	return false
}
