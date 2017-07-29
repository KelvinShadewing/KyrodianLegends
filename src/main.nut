/*========================================*\
|	             KYRODIAN LEGENDS            |
|                                          |
| Code License: GPL 3.0                    |
| KyLe Asset License: CC-BY-NC-SA-3.0      |
| Core Asset License: CC-BY-3.0            |
| Music Copyright: Kevin "JazzyPanda" Soto |
| Guest Characters © Respective Owners     |
\*========================================*/

function main(){
	//Set up the display
	setBackgroundColor(0);
	setScalingFilter(1);

	//Set the game mode
	gvGameMode = Game.intro;

	//Run main game loop
	local quit <- false;
	while(!quit){
		gvGameMode();
	};
};

main();
