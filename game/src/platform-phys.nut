/*===========================================================================*\
| PLATFORM ACTOR SYSTEM                                                       |
|                                                                             |
| For use in platformer games. Objects will escape solid tiles when able, and |
| can respond to being trapped by calling an event handler.                   |
|                                                                             |
| LICENSE: Affero GNU General Public License v3                               |
\*===========================================================================*/

//Change these components to whatever you want to use in your engine
//Components should be implemented as functions
::gvValidComponents <- ["physics", "solid", "draw", "weapon", "target"];

::gvCompRegistry <- {};

::compRegister <- function (a) {
	// Place in actor constructor like this: compRegister(this)
	// Make sure the actor is valid
	if (!("id" in a)) return;

	// Go through component list and register found functions
	foreach (k, i in gvValidComponents) {
		if (!(k in gvCompRegistry)) gvCompRegistry[k] <- {};

		if (k in a) gvCompRegistry[k][a.id] <- a;
	}
};

::compUnregister <- function (a) {
	// Place in actor destructor like this: compUnregister(this)
	// Make sure the actor is valid
	if (!("id" in a)) return;

	// Go through component list and unregister found functions
	foreach (k, i in gvValidComponents) {
		if (!(k in gvCompRegistry)) continue;

		if (k in a) gvCompRegistry[k].remove(a.id);
	}
};

::gvSolidTileID <- [
	// Valid tile kinds: solid, pass, ladder, sideladder, line, damage, magnet, break, force,
	{
		// 0 full block
		shape = [Rec(0, 0, 8, 8, 0, 8, 8)],
		kind = ["solid"]
	},
	{
		// 1 half down
		shape = [Rec(0, 0, 8, 4, 0, 0, 8, 12)],
		kind = ["solid"]
	},
	{
		// 2 half up
		shape = [Rec(0, 0, 8, 4, 0, 8, 4)],
		kind = ["solid"]
	},
	{
		// 3 half left
		shape = [Rec(0, 0, 4, 8, 0, 4, 8)],
		kind = ["solid"]
	},
	{
		// 4 half right
		shape = [Rec(0, 0, 4, 8, 0, 12, 8)],
		kind = ["solid"]
	},
	{
		// 5 half middle h
		shape = [Rec(0, 0, 8, 4, 0, 8, 8)],
		kind = ["solid"]
	},
	{
		// 6 half middle v
		shape = [Rec(0, 0, 4, 8, 0, 8, 8)],
		kind = ["solid"]
	},
	{
		// 7 top left 1/4 h
		shape = [Rec(0, 0, 8, 2, 2, 8, 14)],
		kind = ["solid"]
	},
	{
		// 8 top left 2/4 h
		shape = [Rec(0, 0, 8, 2, 2, 8, 10), Rec(0, 0, 8, 2, 2, 8, 14)],
		kind = ["solid"]
	},
	{
		// 9 top left 3/4 h
		shape = [Rec(0, 0, 8, 2, 2, 8, 6), Rec(0, 0, 8, 4, 2, 8, 12)],
		kind = ["solid"]
	},
	{
		// 10 top left 4/4 h
		shape = [Rec(0, 0, 8, 2, 2, 8, 2), Rec(0, 0, 8, 6, 2, 8, 10)],
		kind = ["solid"]
	},
	{
		// 11 top right 4/4 h
		shape = [Rec(0, 0, 8, 2, 1, 8, 2), Rec(0, 0, 8, 6, 1, 8, 10)],
		kind = ["solid"]
	}
];
