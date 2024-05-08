/*=============*\
| PHYSICS ACTOR |
\*=============*/

/*
Structure for tile escape object
{
	escaped = true/false  //Whether the object could find room to escape
	slippery = true/false //Whether the tile being collided with is slippery
	damage = true/false   //If the tile is harmful
	xoff = 0
	yoff = 0
}
This object will be returned when 
*/

::PhysObj <- class extends Actor {
	hspeed = 0.0
	vspeed = 0.0
	shape = 0

	constructor(_x, _y)
	{
		base.constructor(_x, _y)
	}

	function escapeSolid() {
		local _esc = true  //Did escape
		local _slp = false //Slippery
		local _dmg = false //Damaging
		local _xoff = 0
		local _yoff = 0



		return {
			escap = _esc
			slippery = _slp
			damage = _dmg
			xoff = _xoff
			yoff = _yoff
		}
	}

	function getTileDepth(x, y, dir) {
		local _dep = 0
		local _out = false

		//Dir 0 is right, 1 is up, 2 is left, 3 is down

		//Get shape ID for the current point

		//See how far in the point is
		
		//Return the depth and if the next point out remains within the shape
		//If the depth is enough to reach the edge of the tile, set _out
		//to true so escapeSolid can know to check the next tile.

		return {
			depth = _dep
			out = _out
		}
	}
}
