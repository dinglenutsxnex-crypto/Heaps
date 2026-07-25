import scenes.EnterPointScene;
import scenes.FightScene;
import scripts.sf3.GameTimeController;
import scripts.sf3.FrameSkipController;
import scripts.sf3.BattleController;
import scripts.sf3.ModelsManager;
import scripts.sf3.GameVariables;
import scripts.sf3.BehaviourTimer;

class Main extends hxd.App {

	static var enterPoint:EnterPointScene;

	static function main() {
		new Main();
	}

	override function init() {
		engine.backgroundColor = 0xFF000000;

		var window = js.Browser.window;
		engine.resize(window.innerWidth, window.innerHeight);

		enterPoint = new EnterPointScene();
		enterPoint.scene = s2d;
		enterPoint.init();
	}

	override function update(dt:Float) {
		if (dt > 0.1) dt = 0.1;
		GameTimeController.update(dt);
		FrameSkipController.moveToNextFrame();

		if (FightScene.instance != null) {
			FightScene.instance.update();
		}
	}
}
