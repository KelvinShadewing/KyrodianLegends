//////////
// MIDI //
//////////

::Midi <- class extends Physical{
	state = idling;
	blink = 0;
	sprinting = 0;
	gravity = 0;
	xspeed = 0;
	yspeed = 0;
	mspeed = 0;
	fspeed = 1;
	anim = 0;

	//Frame indices
	aStand = [0];
	aIdle = [1, 2, 3, 4];
	aHold = [5];
	aCrouch = [6];
	aCrouchH = [7];
	aJumpU = [8, 9];
	aJumpT = [10, 11];
	aFall = [12, 13];
	aHurt = [14, 15];
	aWalk = [16, 17, 18, 19, 20, 21, 22, 23];
	aWalkH = [24, 25, 26, 27, 28, 29, 30, 31];
	aJog = [32, 33, 34, 35, 36, 37, 38, 39];
	aJogH = [40, 41, 42, 43, 44, 45, 46, 47];
	aRun = [48, 49, 50, 51, 52, 53, 54, 55];
	aRunH = [56, 57, 58, 59, 60, 61, 62, 63];
	aShootA = [64, 65, 66, 66, 77, 67];
	aShootT = [68, 69, 70, 70, 71, 71];
	aClimb = [72, 73, 74, 75, 74, 73];
	aClimbTop = [76, 77];
	aAttackA = [78, 79, 80, 81];
	aPlant = [82, 83, 84, 85, 86, 87];
	aAttackF1 = [88, 89, 90, 90, 91, 91];
	aAttackF2 = [92, 93, 94, 94, 95, 95];
	aAttackU1 = [96, 97, 98, 98, 99, 99];
	aAttackU2 = [100, 101, 102, 102, 103, 103];
	aAttackUF1 = [104, 105, 106, 106, 107, 107];
	aAttackUF2 = [108, 109, 110, 110, 111, 111];
	aAttackDF1 = [112, 113, 114, 114, 115, 115];
	aAttackDF2 = [116, 117, 118, 118, 119, 119];
	aAttackAU1 = [120, 121, 122, 122, 123, 123];
	aAttackAU2 = [124, 125, 126, 126, 127, 127];
	aAttackAD1 = [128, 129, 130, 130, 131, 131];
	aAttackAD2 = [132, 133, 134, 134, 135, 135];
	aAttackD1 = [136, 137, 138, 138, 139, 139];
	aAttackD2 = [140, 141, 142, 142, 143, 143];
	aSpin = [144, 145, 146, 147];
	aShootM = [148, 149, 150, 151];
	aFlip = [152, 153, 154, 155, 156, 157, 158, 159];
	aRide = [160, 161];
	aMorph = [162, 163];
	aWall = [164, 165];
	aSpinFast = [166, 167];
	aHurtHeavy = [168, 169];
	aFloat = [170, 171];
	aSwim = [172, 173, 174, 175];
	aSitC = [176];
	aSitG = [177];
	aLift = [178, 179];
	aDoor = [180, 181];
	aScratch = [182, 183];
	aBall = [184, 185, 186, 187, 188, 189, 190, 191];
	aBallD = [192, 193, 194, 195, 196, 197, 198, 199];
	aBallDF = [200, 201, 202, 203, 204, 205, 206, 207];
	aBallF = [208, 209, 210, 211, 212, 213, 214, 215];
	aBallUF = [216, 217, 218, 219, 220, 221, 222, 223];
	aBallU = [224, 225, 226, 227, 228, 229, 230, 231];

	constructor(_x, _y){
		base.constructor(_x, _y);

		sprite = sprMidiP;
		anim = aStand;
	};

	function step(){
		//Friction
		if(xspeed > 0) xspeed--;
		if(xspeed < 0) xspeed++;

		//Controls
		if(keyDown(k_right) && xspeed < mspeed) xspeed += 2;
		if(keyDown(k_left) && xspeed > -mspeed) xspeed -= 2;
		if(keyPress(k_space)) newActor(TestBall, x, y);
		if(keyDown(k_lshift) || keyDown(k_rshift)) mspeed = 8;
		else mspeed = 4;

		//Attack

		//Animation states
		switch(anim){
			case
			default:
				break;
		};
		frame += fspeed;

		//Animation ends
		if(frame > anim[0] + anim[1] || frame < anim[0]){
			frame = wrap(frame, aniStart, aniStart + aniLen);
			switch(anim){
				default:
					break;
			};
		};

		//Update
		move(xspeed, yspeed);
		drawSprite(sprite, floor(frame), x, y);
	};

	function _typeof(){ return "Midi"; };
};
