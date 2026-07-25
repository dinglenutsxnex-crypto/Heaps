import scenes.EnterPointScene;
import h2d.Scene;
import h2d.Graphics;

class Main extends hxd.App {

	static var enterPoint:EnterPointScene;
	static var scene:Scene;

	static function main() {
		new Main();
	}

	override function init() {
		scene = new Scene();

		var g = new Graphics(scene);
		g.beginFill(0x202040);
		g.drawRect(0, 0, 800, 600);
		g.endFill();

		enterPoint = new EnterPointScene();
		enterPoint.init();
	}

	override function update(dt:Float) {
		scene.render(engine);
	}
}