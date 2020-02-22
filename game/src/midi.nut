//////////
// MIDI //
//////////

::Midi <- class extends Physical{
	blink = 0;
	sprinting = 0;
	gravity = 0;
	xspd = 0;
	yspd = 0;
	mspd = 0;
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
	aAtkF1 = [0.5, [88, 89, 90, 90, 91, 91]];
	aAtkF2 = [0.5, [92, 93, 94, 94, 95, 95]];
	aAtkU1 = [0.5, [96, 97, 98, 98, 99, 99]];
	aAtkU2 = [0.5, [100, 101, 102, 102, 103, 103]];
	aAtkUF1 = [0.5, [104, 105, 106, 106, 107, 107]];
	aAtkUF2 = [0.5, [108, 109, 110, 110, 111, 111]];
	aAtkDF1 = [0.5, [112, 113, 114, 114, 115, 115]];
	aAtkDF2 = [0.5, [116, 117, 118, 118, 119, 119]];
	aAtkAU1 = [0.5, [120, 121, 122, 122, 123, 123]];
	aAtkAU2 = [0.5, [124, 125, 126, 126, 127, 127]];
	aAtkAD1 = [0.5, [128, 129, 130, 130, 131, 131]];
	aAtkAD2 = [0.5, [132, 133, 134, 134, 135, 135]];
	aAtkD1 = [0.5, [160, 161, 162, 162, 163, 163]];
	aAtkD2 = [0.5, [164, 165, 166, 166, 167, 167]];
	aSpin = [0.5, [168, 169, 170, 171]];
	aShootM = [0.5, [172, 173, 174, 175]];
	aFlip = [0.5, [176, 177, 178, 179, 180, 181, 182, 183]];
	aRide = [0.5, [184, 185]];
	aWall = [0.5, [186, 187]];
	aSpinFast = [0.5, [188, 189]];
	aHurtHvy = [0.5, [190, 191]];
	aFloat = [0.5, [192, 193]];
	aSwim = [0.5, [194, 195, 196, 197]];
	aSitC = [0.5, [198]];
	aSitG = [0.5, [199]];
	aLift = [0.5, [200, 201]];
	aDoor = [0.5, [202, 203]];
	aScratch = [0.5, [204, 205]];
	aMorph = [0.5, [206, 207]];
	aBall = [0.5, [208, 209, 210, 211]];
	aBallV = [0.5, [212, 213, 214, 215]];
	aBallD = [0.5, [216, 217, 218, 219]];
	aBallH = [0.5, [220, 221, 222, 223]];
	aBallT = [0.5, [224, 225, 226, 227]];
	aWeak = [0.25, [228, 229, 230, 231]];
	aClimbW = [0.5, [232, 233, 234, 235, 234, 233]];
	aLedge = [0, [236]];
	aHang = [0, [237]];
	aAtkH = [0.5, [238, 239, 240, 240, 241, 241]];
	aMonkey = [0.5, [242, 243, 244, 245, 246, 247]];
	aAtkL1 = [0.5, [248, 249, 250, 250, 251, 251]];
	aAtkL2 = [0.5, [252, 253, 254, 254, 255, 255]];

	constructor(_x, _y){
		base.constructor(_x, _y);

		sprite = sprMidiP;
		anim = aStand;
	};

	function step(){
		//Friction
		if(xspd > 0) xspd--;
		if(xspd < 0) xspd++;

		//Controls
		if(keyDown(k_right) && xspd < mspd) xspd += 2;
		if(keyDown(k_left) && xspd > -mspd) xspd -= 2;
		if(keyPress(k_space)) newActor(TestBall, x, y);
		if(keyDown(k_lshift) || keyDown(k_rshift)) mspd = 8;
		else mspd = 4;

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
		move(xspd, yspd);
		drawSprite(sprite, anim[floor(frame)], x, y);
	};

	function _typeof(){ return "Midi"; };
};
