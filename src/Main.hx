import scenes.EnterPointScene;

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
	}
}