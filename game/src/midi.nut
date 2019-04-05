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
	anim = 0;

	//Frame indices
	aStand = [0, [0]];
	aIdle = [0.25, [1, 2, 3, 4]];
	aHold = [0, [5]];
	aCrouch = [0, [6]];
	aCrouchH = [0, [7]];
	//Animation speed for jump, walk, jog, and run are arbitrary. They are affected
	//by the speed at which Midi is moving. The rest will be determined later
	//after some testing of how they look can be done.
	aJumpU = [0.5, [8, 9]];
	aJumpT = [0.5, [10, 11]];
	aFall = [0.5, [12, 13]];
	aHurt = [0.25, [14, 15]];
	aWalk = [1, [16, 17, 18, 19, 20, 21, 22, 23]];
	aWalkH = [1, [24, 25, 26, 27, 28, 29, 30, 31]];
	aJog = [1, [32, 33, 34, 35, 36, 37, 38, 39]];
	aJogH = [1, [40, 41, 42, 43, 44, 45, 46, 47]];
	aRun = [1, [48, 49, 50, 51, 52, 53, 54, 55]];
	aRunH = [1, [56, 57, 58, 59, 60, 61, 62, 63]];
	aShootA = [0.5, [64, 65, 66, 66, 77, 77]];
	aShootT = [0.5, [68, 69, 70, 70, 71, 71]];
	aClimb = [0.25, [72, 73, 74, 75, 74, 73]];
	aClimbTop = [0.5, [76, 77]];
	aAttackA = [0.5, [78, 79, 80, 81]];
	aPlant = [0.5, [82, 83, 84, 85, 86, 87]];
	aAttackF1 = [0.5, [88, 89, 90, 90, 91, 91]];
	aAttackF2 = [0.5, [92, 93, 94, 94, 95, 95]];
	aAttackU1 = [0.5, [96, 97, 98, 98, 99, 99]];
	aAttackU2 = [0.5, [100, 101, 102, 102, 103, 103]];
	aAttackUF1 = [0.5, [104, 105, 106, 106, 107, 107]];
	aAttackUF2 = [0.5, [108, 109, 110, 110, 111, 111]];
	aAttackDF1 = [0.5, [112, 113, 114, 114, 115, 115]];
	aAttackDF2 = [0.5, [116, 117, 118, 118, 119, 119]];
	aAttackAU1 = [0.5, [120, 121, 122, 122, 123, 123]];
	aAttackAU2 = [0.5, [124, 125, 126, 126, 127, 127]];
	aAttackAD1 = [0.5, [128, 129, 130, 130, 131, 131]];
	aAttackAD2 = [0.5, [132, 133, 134, 134, 135, 135]];
	aAttackD1 = [0.5, [136, 137, 138, 138, 139, 139]];
	aAttackD2 = [0.5, [140, 141, 142, 142, 143, 143]];
	aSpin = [0.5, [144, 145, 146, 147]];
	aShootM = [0.5, [148, 149, 150, 151]];
	aFlip = [0.5, [152, 153, 154, 155, 156, 157, 158, 159]];
	aRide = [0.5, [160, 161]];
	aMorph = [0.5, [162, 163]];
	aWall = [0.5, [164, 165]];
	aSpinFast = [0.5, [166, 167]];
	aHurtHeavy = [0.5, [168, 169]];
	aFloat = [0.5, [170, 171]];
	aSwim = [0.5, [172, 173, 174, 175]];
	aSitC = [0.5, [176]];
	aSitG = [0.5, [177]];
	aLift = [0.5, [178, 179]];
	aDoor = [0.5, [180, 181]];
	aScratch = [0.5, [182, 183]];
	aBall = [0.5, [184, 185, 186, 187, 188, 189, 190, 191]];
	aBallD = [0.5, [192, 193, 194, 195, 196, 197, 198, 199]];
	aBallDF = [0.5, [200, 201, 202, 203, 204, 205, 206, 207]];
	aBallF = [0.5, [208, 209, 210, 211, 212, 213, 214, 215]];
	aBallUF = [0.5, [216, 217, 218, 219, 220, 221, 222, 223]];
	aBallU = [0.5, [224, 225, 226, 227, 228, 229, 230, 231]];

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
		frame += anim[0];

		//Animation ends
		if(frame > anim[1].len() || frame < 0){
			frame = wrap(frame, 0, anim[1].len());
			switch(anim){
				case aJumpT:
					anim = aFall;
				default:
					break;
			};
		};

		//Update
		move(xspeed, yspeed);
		drawSprite(sprite, anim[floor(frame)], x, y);
	};

	function _typeof(){ return "Midi"; };
};
