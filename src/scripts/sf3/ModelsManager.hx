package scripts.sf3;

class ModelsManager {

	public static var instance:ModelsManager;

	public var player:Dynamic;
	public var enemy:Dynamic;

	public function new() {
		instance = this;
		player = null;
		enemy = null;
	}

	public static function initialize():Void {
		if (instance == null) {
			instance = new ModelsManager();
		}
	}

	public function initialize():Void {
		// Initialize models manager
	}

	public function disposePreviousLocation():Void {
		// Dispose previous location
		player = null;
		enemy = null;
	}

	public function clearBattleModels():Void {
		// Clear battle models
		player = null;
		enemy = null;
	}

	public function enableModelsColliders(enabled:Bool):Void {
		// Enable/disable models colliders
	}

	public function setModelsRagdollSleepState(sleep:Bool, delay:Int):Void {
		// Set ragdoll sleep state
	}

	public function updateModels():Void {
		if (player != null && player.update != null) {
			player.update();
		}
		if (enemy != null && enemy.update != null) {
			enemy.update();
		}
	}
}