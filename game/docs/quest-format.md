# Quest Format

Quest data should not store dialogue. Dialogue should be stored in the language file so that translations can be applied without changing code or risking translations being functionally outmoded.

```squirrel
{
	id = "example-quest";
	stages = [
		{
			objective = function() {
				// if(quest objective met)
				// 	return true;
				// else
				// 	return false;
			}
			dialogue = "language-file-section"
		}
	];
}
```

Dialogue found in the langauge file's `quest` section will override NPC conversations. If dialogue is meant to be default behavior or scripted in sequences where it does not change with context, it should go in the `dialogue` section. Entires in `quest` should be identified with the quest name, with subsections identifying the quest stage, and then the NPC who's text will be overridden.

```json
{
	"quest": {
		"example-quest": {
			"0": {
				"quest-giver": "You've already got your quest, now get to it."
			},
			"1": {
				"quest-giver": "Ah, you're back. I'll take the stuff now. Payment's at the guild."
			}
		}
	}
}
```

Quests are taken from mercenary guild halls. The player may abandon a quest if necessary from these halls as well. Once the quest is taken, the player will travel to meet the client. If the client is not in the same town, then the town they are in will be highlighted on the map. If no client meeting is necessary, then the map will indicate what map the player should deploy to.