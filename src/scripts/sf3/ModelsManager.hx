package scripts.sf3.gamemodels;

class ModelsManager {

	public static var instance:ModelsManager;

	public var player:Model;
	public var enemy:Model;
	public var models:Array<Model> = [];

	public function new() {
		instance = this;
	}

	public function initialize():Void {
		// Initialize models manager
	}

	public function updateModels():Void {
		for (model in models) {
			if (model != null) {
				model.update(1.0 / 60.0);
			}
		}
	}

	public function createBattleModels(playerInfo:Dynamic, enemyInfo:Dynamic):Void {
		// Create player model
		player = new Model(new ModelInfo(), true);
		player.isPlayer = true;
		player.isControl = true;
		models.push(player);

		// Create enemy model
		enemy = new Model(new ModelInfo(), false);
		enemy.isPlayer = false;
		models.push(enemy);

		// Set enemies
		player.setEnemy(enemy);
		enemy.setEnemy(player);
	}

	public function clearBattleModels():Void {
		player = null;
		enemy = null;
		models = [];
	}

	public function enableModelsColliders(enable:Bool):Void {
		// Enable/disable colliders
	}

	public function setModelsRagdollSleepState(sleep:Bool, delay:Int):Void {
		// Set ragdoll sleep state
	}
}