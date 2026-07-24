import scenes.EnterPointScene;
import scenes.FightScene;
import scripts.sf3.SceneManager;

class Main extends hxd.App {

	static var enterPoint:EnterPointScene;

	static function main() {
		new Main();
	}

	override function init() {
		// Initialize the entry point scene
		enterPoint = new EnterPointScene();
		enterPoint.init();
	}

	override function update(dt:Float) {
		// Game update loop
		// BattleController, ModelsManager, etc. would be updated here
	}

	override function render(dt:Float) {
		// Rendering is handled by Heaps scene graph
	}

	override function resize(width:Int, height:Int) {
		super.resize(width, height);
	}
}
