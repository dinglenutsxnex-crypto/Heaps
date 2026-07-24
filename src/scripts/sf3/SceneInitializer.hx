package scripts.sf3;

class SceneInitializer {

	private var locationPrefab:String;

	public function new() {
	}

	public function createInitializers():Void {
		// Initialize scene initialization objects
		// This would call initialize() on BattleController, BattleCamera, etc.
	}

	public function initializeNewLocationScene(?onComplete:Void -> Void):Void {
		// Dispose previous location
		disposePreviousLocationScene();

		// Load location prefab
		var locationNameLower = SceneManager.instance.getLocationName().toLowerCase();
		locationPrefab = "locations/" + locationNameLower + "/" + locationNameLower;

		// Initialize singletons
		// BattleController.instance.initialize();
		// BattleCamera.instance.initialize();
		// ModelsManager.instance.initialize();
		// BattleInterface.instance.initialize();

		if (onComplete != null) {
			onComplete();
		}
	}

	private function disposePreviousLocationScene():Void {
		if (locationPrefab != null) {
			// Dispose previous location
		}
	}
}
