package scripts.sf3;

class SceneInitializer {

	private var locationPrefab:Dynamic;
	private var sceneInitializationObjects:Array<ISceneInitializationObject>;

	public function new() {
	}

	public function createInitializers():Void {
		sceneInitializationObjects = [
			BattleController.instance,
			BattleCamera.instance,
			EffectsManager.instance,
			ModelsManager.instance,
			BattleInterface.instance
		];
	}

	public function initializeNewLocationScene(?onComplete:Void -> Void):Void {
		disposePreviousLocationScene();

		var locationNameLower = SceneManager.instance.getLocationName().toLowerCase();
		locationPrefab = "locations/" + locationNameLower + "/" + locationNameLower;

		for (initObj in sceneInitializationObjects) {
			initObj.initialize();
		}

		BattleController.instance.initBattle();

		if (onComplete != null) {
			onComplete();
		}
	}

	private function disposePreviousLocationScene():Void {
		if (locationPrefab != null) {
			for (initObj in sceneInitializationObjects) {
				initObj.disposePreviousLocation();
			}
			GlobalLoad.unload(locationPrefab);
		}
		GlobalLoad.unloadUnusedAssets();
	}
}