# Change log

## 03-SEP-2018

* **Add Pendragon wiki** - Gonna fill this in, with more soon. Just wanted to get it set up for now.

* **Add timelines.nut** - While talking to my roommate about how to handle timelines, I got inspired to actually start implementing it. Gonna test it out soon.

## 27-AUG-2018

* **Update Midi wiki** - Removed the mention of a wingnut because I decided to make a remote bomb instead. Bomb laddering will be done by laying and detonating the bombs rapidly.

* **Update Controls wiki** - Added controls for Midi's transphere.

* **General design update** - An AI partner system seems beyond my ability for now, so I'm removing the concept from the core design. Instead, characters will just be switchable. However, I may put in local co-op for missions that use two characters.

## 30-JUL-2018

* **Update Midi sprite** - Well, it's been a long time without changes again, but there's at least a good reason for that. I've been working on some commissioned art, and also getting my new life sorted out in Georgia. I now have a new job, too!

  So, what's new with the sprite? Well, I got rid of the armless poses, and instead made room for new angled attack poses. Remember how Simon Belmont learned to use his whip diagonally? Well, Midi's gonna do that, but with bombs! I also removed the "win" action, because I'm going to transform the current frames into part of his "attack up" sequence, while a new win sequence will be made that will look much nicer than just a skyward punch.

  Updates to this project will still probably be a bit far between, as I'm also working more on XYG, and the new job is gonna take some time away. Not like I made the best of my time unemployed, anyway. `>.-.>`

## 27-JUN-2018

* **Add explosion sprites** - Currently have fire, ice, and lightning done.

* **Add hardegvin sprite** - The hardegvins are a pair of characters I made for comedy. They're pranksters and they stand out by the hard hats they wear. In fact, the name is a portmanteau of hard and hidegvin, which is a portmanteau of hideg, which is Icelandic for chill, and pingvin, Icelandic for penguin. The two will mainly serve as comic relief in some scenes.

* **Update Midi sprite** - MAJOR update here! I got the ears trimmed on the overworld sprite, added a couple new poses to the platformer, and... you see those three new rows? That's how his sphere will look on magnetic rails! Yep, I'm putting those in as well. He'll be able to use them once he learns the thunderbomb and uses that to magnetize his transphere.

## 21-JUN-2018

* **Change date format** - Sort of. Just made the month a word instead of a number so it's easier to tell I'm using DD-MM-YYYY.

* **Make Midi taller** - OK, so in my sprite style, I have a scale to which all things adhere: 7 pixels per foot. Midi is supposed to be four feet tall, 4'4" counting his ears, but was a pixel short. I also decided I didn't like the tufts on his ears and took them off. This meant, though, that I would have to go through every frame, shorten his ears, and if need be, make his legs longer.

  You know something? While working on updating his ears, I came across a bunch of small inconsistencies and errors, particularly with alignment. This experience has taught me that if you really want to make a clean sprite, you gotta make it, step away from it for about a month or so, and then go back through every frame with a fine-tooth comb. Cuz you know how when you look at your own code after a long time and it feels like you're reading someone else's? Well you can do that with pixel art, too. It's easier to spot errors in someone else's art because your brain isn't filling in what *should* be there, and when you take a break and look at your art again later, your brain forgets those shoulds and starts looking at the sprite objectively, letting you spot your own mistakes.

	Now I need to get back to working on other characters, too.

* **Start control.nut** - Working out how to track customizable controls. I haven't gotten joystick controls programmed in XYG yet, but should have that soon.

## 19-JUN-2018

* **Add change log** - I've not been keeping track of changes well enough, so here you go. Gonna use this as a sort of dev journal at the same time.

* **Update Midi's sprite** - Midi can now walk slowly instead of just running and sprinting. Had to lengthen his legs a bit, because they looked too short while moving. I also moved a few things around to keep the sheet looking clean and added some padding to the door and lift/elevator animations, since I want to have transition frames instead of him just snapping into place.

* **Remove Midi/Trey/Sophie portraits** - Pending license agreement. The portraits were originally sketched by Foxboy83, who I'm still waiting to hear back from about being allowed to modify and relicense them. He never actually gave me any terms when I had him make them, and has not gotten back to me about it since, so I'll probably end up replacing them entirely. The shadewing faces are my own art.
