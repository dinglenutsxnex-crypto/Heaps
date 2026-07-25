package scripts.sf3;

import scripts.sf3.gamemodels.Model;
import scripts.sf3.gamemodels.ModelInfo;

class ModelsManager implements ISceneInitializationObject {

	public static var instance:ModelsManager;

	public var player:Model;
	public var enemy:Model;
	public var models:Array<Model> = [];

	public function new() {
		instance = this;
	}

	public function initialize():Void {
	}

	public function disposePreviousLocation():Void {
		player = null;
		enemy = null;
		models = [];
	}

	public function updateModels():Void {
		for (model in models) {
			if (model != null) {
				model.update(1.0 / 60.0);
			}
		}
	}

	public function createBattleModels(playerInfo:Dynamic, enemyInfo:Dynamic):Void {
		player = new Model(new ModelInfo(), true);
		player.isPlayer = true;
		player.isControl = true;
		models.push(player);

		enemy = new Model(new ModelInfo(), false);
		enemy.isPlayer = false;
		models.push(enemy);

		player.setEnemy(enemy);
		enemy.setEnemy(player);
	}

	public function clearBattleModels():Void {
		player = null;
		enemy = null;
		models = [];
	}

	public function enableModelsColliders(enable:Bool):Void {
	}

	public function setModelsRagdollSleepState(sleep:Bool, delay:Int):Void {
	}
}