package scripts.sf3;

class SceneInitializer {

	private var locationPrefab:Dynamic;
	private var locationName:String;
	private var sceneInitializationObjects:Array<ISceneInitializationObject>;

	public function new() {
	}

	public function createInitializers():Void {
		var list:Array<ISceneInitializationObject> = [];
		if (BattleController.instance == null) BattleController.instance = new BattleController();
		list.push(BattleController.instance);
		if (BattleCamera.instance == null) BattleCamera.instance = new BattleCamera();
		list.push(BattleCamera.instance);
		if (EffectsManager.instance == null) EffectsManager.instance = new EffectsManager();
		list.push(EffectsManager.instance);
		if (ModelsManager.instance == null) ModelsManager.instance = new ModelsManager();
		list.push(ModelsManager.instance);
		if (BattleInterface.instance == null) BattleInterface.instance = new BattleInterface();
		list.push(BattleInterface.instance);
		sceneInitializationObjects = list;
	}

	public function initializeNewLocationScene(locationName:String, ?onComplete:Void -> Void):Void {
		disposePreviousLocationScene();

		this.locationName = locationName;
		var locationNameLower = locationName.toLowerCase();
		locationPrefab = "locations/" + locationNameLower + "/" + locationNameLower;

		if (sceneInitializationObjects != null) {
			for (initObj in sceneInitializationObjects) {
				if (initObj != null) {
					initObj.initialize();
				}
			}
		}

		BattleController.instance.initBattle();

		if (onComplete != null) {
			onComplete();
		}
	}

	private function disposePreviousLocationScene():Void {
		if (locationPrefab != null && sceneInitializationObjects != null) {
			for (initObj in sceneInitializationObjects) {
				if (initObj != null) {
					initObj.disposePreviousLocation();
				}
			}
			GlobalLoad.unload(locationPrefab);
		}
		GlobalLoad.unloadUnusedAssets();
	}
}