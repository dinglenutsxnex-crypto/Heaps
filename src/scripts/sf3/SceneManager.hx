package scripts.sf3;

class SceneManager {

	public static var instance:SceneManager;

	private var sceneType:ESceneType;
	private var locationName:String;

	public static function createObject():Void {
		if (instance == null) {
			instance = new SceneManager();
		}
	}

	public function new() {
		sceneType = ESceneType.None;
	}

	public function loadLocationScene(locationNameValue:String, ?onLoad:Void -> Void):Void {
		locationName = locationNameValue;
	}

	public function getLocationName():String {
		return locationName;
	}

	public function getSceneType():ESceneType {
		return sceneType;
	}
}
