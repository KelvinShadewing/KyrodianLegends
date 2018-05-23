# **Kyrodian Legends**

An action-adventure platformer with cute, fuzzy heroes.

&nbsp;

## License

The code for this game is free under the GNU General Public License.

The assets in `res/kl` are made specifically for Kyrodian Legends. They are free under [CC-BY-SA-4.0](https://creativecommons.org/licenses/by-sa/4.0/us/).

The characters in `res/kl` made specifically for Kyrodian Legends may be used in any project, even commercially, provided all assets of them, both visual and auditory, are released under the same sharealike license.

The assets in `res/ga` are made for guest appearance users who have made special contributions to the project. They may not be used without the consent of their respective owners.

The assets in `res/cc` are free under their respective licenses. See credits.md for full attribution.

&nbsp;

## Gameplay

The game plays similar to games like Gargoyle's Quest and Zelda 2, with players exploring overworld areas in a top-down format, and playing battles and dungeons in sidescroller format.

&nbsp;

## How to Play

This game runs in the [XYG Studio](https://github.com/KelvinShadewing/XYG-Studio) game engine.

To run, it, build the runtime (sorry, no release yet), and install it to wherever your terminal can call it without the need for a path. On UNIX-like systems, this will be your `/usr/bin/` folder. On Windows, it can be anywere as long as your `%PATH%` variable is set to it. You should be able to open a command prompt/terminal and simply type in `xyg`.

From here, go to where you downloaded Kyrodian Legends and open a terminal/command prompt, and type in `xyg kyle.nut`. If it worked, you should see a small window appear with Midi. Press left or right to move him, and space to drop a ball.

This is simply a test function to demonstrate instance management. If you look on the console window, you'll see it announce whenever a ball is made or deleted, along with a count of how many actors are on screen (Midi himself is not an actor at this point).

&nbsp;

## How to Contribute

If you'd like to submit content to be used in official releases, the following information can help you when creating assets.

#### Colors

For all pixel art contributions, the preferred color format is 16-bit, with each RGB value being a multiple of 8. When represented in hex, every second digit in a color value should be 8 or 0.

Non-environment sprites use three shades per color and selective outlines with the outlining around the darker parts being black. Absolute black should not be used. Instead, use #101010, #181818, or #202020 depending on how dark the adjacent pixels are. The brightest value for any color is 0xF8, so white is represented as #F8F8F8.

#### Tiles

Tilesets should be filled with a solid color in the middle to provide dark negative space. Colors should have three or four shades each, four preferred. Slope gradess should be 1x2, 1x1, or 2x1. Other grades can be used, but should be whole numbers (eg. 1x3, 1x4, etc.), and any slope steeper than 1x1 will cause characters to slide down them.

#### Sprites

In addition to the color guides above, Kyrodian Legends uses a scale factor of 7 pixels per foot. This allows the sprites to cross over with certain games while keeping an approximately accurate scale to non-KL characters. Most animations have an even number of frames, unless it's a static pose. For movement, playable bipeds have 8 frames per speed (walking, running, sprinting), quadrupeds have 6, and NPCs, regardless of stance, have 4.

For overworld sprites, all characters have at maximum 4 frames per animation. NPCs are limited to walking, unless used in cutscenes. Overworld sprites can face in 8 directions and walk without being restricted to a grid.

Examples of games that KL's sprites could fit into include Super Mario 1-3/World, Super Metroid, SNES/NDS Castlevania, Megaman X 1-3, Megaman Wily Wars.

#### Maps

Maps use 16*16 tilesets. Tilesets should be embedded; the game engine will check that the appropriate tilesets have been loaded based on their filenames.

Maps in the game use three distinct layers: 'ground', 'under' and 'over'. Ground is for overworld terrain, and shows up under everything but the background. It is not used in platforming sections.

Under is for static objects and is drawn between ground and actors. In the overworld, it is used for the lower half of statics that are not supposed to obscure actors.

Finally, over is rendered last so it appears above everything. In the overworld, it is the top half of static objects, and hides actors that pass behind them, such as a person walking behind a house. In platforming sections, it is used for terrain.

Collision is checked using an object layer named 'collision'. This allows large shapes to fill solid terrain to minimize calculation time that would otherwise be spent on per-tile or per-pixel checking. The polygon shape can be used, but for best results, it should use as few lines as possible to encompass its area of effect.

#### Enemies

The primary types of enemies come in several categories:

***Cold Front***

A group of paengi pirates that have blue feathers and use a variety of ice-related attacks. The pengrunt sprite found in `res/kl` can be used as a basis for their design.

***Biometal***

These are robotic alien remnants from the Biometal War, and act as monsters for the game. They can take on many forms, so long as they appear to be living things but still distinctly mechanical. Their design should be sleek but segmented, and can incorporate crystal lights, in contrast the the stiffer, rivited look of terrestrial technology.


***Monsters***

Organic monsters can be used as well, and mainly consist of plants and land versions of sea invertibrates, such as jellybirds, an airborne variant of jellyfish, and various crustaceans and mollusks.

***Bandits/Scavengers***

Basically any enemy that comes from one of the world's sapient races. They should be limited to a few clothing designs to represent distinct factions.

#### Characters

I'm not accepting new characters right now, but if you would like to work on poses for existing characters, go right ahead. Just be sure to stick to the colors used in their files.

&nbsp;

## Modding

Some things to bear in mind when writing mods for KL.

#### Mods List

The mods.list file contains the names of user-made scripts to be run after the game's core assets and code have been loaded. As each file overwrites what was made by the one before it when modifying the same code, loading order is important to prevent dependancy errors.

#### Filenames and Paths

The game will refernce all paths from the directory it was launched in, unless the path is global (eg. beginning with `/` or `C:\\`). If, for instance, a mod uses sprites, and those sprites are in their own folder under the mod folder, you would use something like `"mod/sprites/filename.png"` to load it, even if the file calling it is already in the mod folder.

#### Patching

If you want to add content to existing code instead of redefining the whole thing, you should know how to insert data into Squirrel's different storage types. To add an element to a table, you would use something like this: `table.newitem <- value;` instead of `::table <- { newitem = value };` as this will delete the original table and replace it with a new one.

In the case of arrays, you should use the `push_back` function to have the array add a value to itself. For example: `lootlist.push_back(item_name);`.

#### Actors

In order for a new entity or `Actor` to work in the game, it should inherit from the base Actor class. To do this, delcare your class like so: `::MyClass <- class extends Actor { ... };`

Actors have three functions: `constructor`, which is called when the Actor is created, `step`, which happens each frame when `runActors` is called, and `destructor`, which is called by `deleteActor`. Actors should not be deleted manually using Squirrel's default method.

To prevent exceptions, you should always check that an Actor exists before referencing anything in it. To do this, simply use `checkActor` with the ID of the Actor you want to interact with. For example:

```squirrel
target <- newActor(Enemy, x, y); //newActor returns the ID of the newly-generated Actor

if(checkActor(target)) { ... }; //Do something to the target.
```

Failing to do so runs the risk of crashing the game.

#### Replacing Assets

Check `src/assets.nut` for a list of all the variable names used by the game, then use the appropriate replacement function provided by XYG. Do not simply assign the varaibles to new values, as this will leave the old assets in memory, which could slow down the game and cause errors or unexpected behavior.

#### Other

With Squirrel, it is possible to overwrite literally any and every part of the game. If you write something like `::main <- function(){ ... };`, you can change the entire game or even prevent it from running at all. Be careful when assigning global varaibles, as most of the game's variables are made global to remain in memory between files.

If you plan on doing a total conversion, it may be easier to backup the game and edit the core files directly. All the game's sources remain in their uncompiled format so that they can be easily examined and edited.