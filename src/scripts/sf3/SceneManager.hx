package scripts.sf3;

import scenes.FightScene;
import scripts.TimerNode;

class SceneManager {

	public static var instance:SceneManager;

	private var sceneType:ESceneType;
	private var locationName:String;
	private var sceneInitializer:SceneInitializer;
	private var onSceneLoaded:Void -> Void;
	private var onLocationSceneLoaded:Void -> Void;

	public static function createObject():Void {
		if (instance == null) {
			instance = new SceneManager();
		}
	}

	public function new() {
		sceneInitializer = new SceneInitializer();
		sceneType = ESceneType.None;
	}

	public function loadLocationScene(locationNameValue:String, ?onLoad:Void -> Void):Void {
		onLocationSceneLoaded = onLoad;
		locationName = locationNameValue;
		
		if (sceneType == ESceneType.None) {
			loadFightScene();
		}
		
		loadLocationSceneProcess();
	}

	private function loadFightScene():Void {
		sceneType = ESceneType.Fight;
		// In Heaps, the fight scene is already loaded
		// We just need to call onSceneLoaded if set
		if (onSceneLoaded != null) {
			onSceneLoaded();
			onSceneLoaded = null;
		}
		sceneInitializer.createInitializers();
	}

	private function loadLocationSceneProcess():Void {
		TimerNode.clear();
		TimerNode.setParent(new TimerNode("SceneLoader"));
		
		// Create initializers (already done if fight scene just loaded)
		// Wait for previous frame to complete
		haxe.Timer.delay(function() {
			sceneInitializer.initializeNewLocationScene(function() {
				if (onLocationSceneLoaded != null) {
					onLocationSceneLoaded();
					onLocationSceneLoaded = null;
				}
				TimerNode.logHierarchy();
				TimerNode.clear();
			});
		}, 0.016);
	}

	public function getLocationName():String {
		return locationName;
	}

	public function getSceneType():ESceneType {
		return sceneType;
	}
}