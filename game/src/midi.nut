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
	aStand = [0, 1];
	aIdle = [1, 4];
	aHold = [5, 1];
	aCrouch = [6, 1];
	aCrouchH = [7, 1];
	aJumpU = [8, 2];
	aJumpT = [10, 2];
	aFall = [12, 2];
	aHurt = [14, 2];
	aWalk = [16, 8];
	aWalkH = [24, 8];
	aJog = [32, 8];
	aJogH = [40, 8];
	aRun = [48, 8];
	aRunH = [52, 8];
	aShootA = [64, 4];
	aShootT = [68, 4];
	aClimb = [72, 6];
	aAttackA = [78, 4];
	aPlant = [82, 6];
	aAttackF1 = [88, 4];
	aAttackF2 = [92, 4];
	aAttackU1 = [96, 4];
	aAttackU2 = [100, 4];
	aAttackUF1 = [104, 4];
	aAttackUF2 = [108, 4];
	aAttackDF1 = [112, 4];
	aAttackDF2 = [116, 4];
	aAttackAU1 = [120, 4];
	aAttackAU2 = [124, 4];
	aAttackAD1 = [128, 4];
	aAttackAD2 = [132, 4];
	aAttackD1 = [136, 4];
	aAttackD2 = [140, 4];
	aSpin = [144, 4];
	aShootM = [148, 4];
	aFlip = [152, 8];
	aRide = [160, 2];
	aMorph = [162, 2];
	aWall = [164, 2];
	aSpinFast = [166, 2];
	aHurtHeavy = [168, 2];
	aFloat = [170, 2];
	aSwim = [172, 4];
	aSitC = [176, 1];
	aSitG = [177, 1];
	aLift = [178, 2];
	aDoor = [180, 2];
	aScratch = [182, 2];
	aBall = [184, 8];
	aBallD = [192, 8];
	aBallDF = [200, 8];
	aBallF = [208, 8];
	aBallUF = [216, 8];
	aBallU = [224, 8];

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
