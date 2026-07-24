import scenes.EnterPointScene;

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
	}
}