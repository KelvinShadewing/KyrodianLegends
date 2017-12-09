//////////
// MIDI //
//////////

//States
const standing = 0;
const walking = 1;
const jumping = 2;
const flipping = 3;
const swimming = 4;
const attacking1 = 5;
const attacking2 = 6;
const attackingU = 7;
const attackingD = 8;
const attackingA = 9;
const throwingG = 10;
const throwingA = 11;
const morphingI = 12;
const morphingO = 13;
const rolling = 14;
const hurting = 15;
const idling = 16;

::Midi <- class extends Actor{
	state = standing;
	blink = 0;
	sprinting = 0;
	gravity = 0;
	xspeed = 0;
	yspeed = 0;

	constructor(_x, _y){
		base.constructor(_x, _y);

		sprite = sprMidiP;
	};

	function step(){

	};
};
