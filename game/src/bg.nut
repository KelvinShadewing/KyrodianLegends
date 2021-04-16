::drawBG <- function(bg) {
	if(bg.len() == 0) return

	foreach(i in bg) {
		local xtile = ceil(320 / spriteW(i)) + 1
		local ytyle = ceil(180 / spriteH(i)) + 1

		for(local j = 0; j < xtile; j++) {
			for(local k = 0; k < ytile; k++) {

			}
		}
	}
}