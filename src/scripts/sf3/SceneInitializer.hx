package scripts.sf3;

import scripts.TimerNode;

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
		// Dispose previous location
		disposePreviousLocationScene();
		
		// Load location prefab
		var locationNameLower = SceneManager.instance.getLocationName().toLowerCase();
		// In Heaps, we don't have Unity prefabs, so we'll create the location data
		locationPrefab = "locations/" + locationNameLower + "/" + locationNameLower;
		
		// Wait for scene config (in Heaps this would be immediate)
		// Initialize singletons
		for (initObj in sceneInitializationObjects) {
			TimerNode.setParent(new TimerNode(Type.typeof(initObj).toString(), "SingleTones"));
			initObj.initialize();
		}
		
		// Cache modules for Dojo battles
		// if (BattlesManager.currentBattleType == BattleType.Dojo) {
		// 	NekkiUIRootModules.instance.cacheModules();
		// }
		
		// Initialize battle
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
			// Unload location prefab
			GlobalLoad.unload(locationPrefab);
		}
		// NekkiUIRootModules.instance.forceClearCache();
		GlobalLoad.unloadUnusedAssets();
	}
}

interface ISceneInitializationObject {
	function initialize():Void;
	function disposePreviousLocation():Void;
}