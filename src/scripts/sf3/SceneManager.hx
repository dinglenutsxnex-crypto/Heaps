package scripts.sf3;

import scenes.FightScene;

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
		if (onSceneLoaded != null) {
			onSceneLoaded();
			onSceneLoaded = null;
		}
		sceneInitializer.createInitializers();
	}

	private function loadLocationSceneProcess():Void {
		haxe.Timer.delay(function() {
			sceneInitializer.initializeNewLocationScene(locationName, function() {
				if (onLocationSceneLoaded != null) {
					onLocationSceneLoaded();
					onLocationSceneLoaded = null;
				}
			});
		}, 16);
	}

	public function getLocationName():String {
		return locationName;
	}

	public function getSceneType():ESceneType {
		return sceneType;
	}
}