package scenes;

import scripts.sf3.SceneManager;
import scripts.TimerNode;

class EnterPointScene {

	public static var instance:EnterPointScene;

	public function new() {
		instance = this;
	}

	public function init():Void {
		#if debug
		trace("Starting game initialization...");
		#end

		// Initialize scene manager
		SceneManager.createObject();

		// Create the fight scene
		var fightScene = new FightScene();
		fightScene.init();

		// Load the initial location
		fightScene.loadLocationScene("arena_01", function() {
			#if debug
			trace("Location scene loaded successfully.");
			#end
		});

		#if debug
		trace("Game initialization complete.");
		#end
	}
}
