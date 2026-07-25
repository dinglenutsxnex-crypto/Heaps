package scenes;

import h2d.Scene;
import scripts.sf3.BattleController;
import scripts.sf3.ModelsManager;

class EnterPointScene {

	public static var instance:EnterPointScene;
	public var scene:Scene;
	public var fightScene:FightScene;

	public function new() {
		instance = this;
	}

	public function init():Void {
		trace("Starting game...");

		ModelsManager.instance = new ModelsManager();
		ModelsManager.instance.createBattleModels(null, null);

		fightScene = new FightScene();
		fightScene.scene = scene;
		fightScene.init();

		BattleController.instance.initBattle();
	}
}
