package scenes;

import scripts.sf3.SceneInitializer;
import scripts.sf3.SceneManager;
import scripts.sf3.ESceneType;
import scripts.sf3.TimerNode;

class FightScene {

	public static var instance:FightScene;

	private var sceneType:ESceneType;
	private var locationName:String;
	private var sceneInitializer:SceneInitializer;

	public function new() {
		instance = this;
		sceneInitializer = new SceneInitializer();
	}

	public function init():Void {
		sceneType = ESceneType.Fight;
	}

	public function loadLocationScene(locationNameValue:String, ?onLoad:Void -> Void):Void {
		locationName = locationNameValue;

		if (sceneType == ESceneType.None) {
			loadFightScene();
		}

		loadLocationSceneProcess(onLoad);
	}

	private function loadFightScene():Void {
		sceneType = ESceneType.Fight;
	}

	private function loadLocationSceneProcess(?onLoad:Void -> Void):Void {
		TimerNode.clear();
		TimerNode.setParent(new TimerNode("SceneLoader"));

		// Create initializers
		sceneInitializer.createInitializers();

		// Initialize the location scene
		sceneInitializer.initializeNewLocationScene(onLoad);
	}

	public function getLocationName():String {
		return locationName;
	}

	public function getSceneType():ESceneType {
		return sceneType;
	}
}
