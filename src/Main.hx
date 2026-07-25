import scenes.EnterPointScene;
import h2d.Graphics;

class Main extends hxd.App {

	static var enterPoint:EnterPointScene;

	static function main() {
		new Main();
	}

	override function init() {
		engine.backgroundColor = 0xFF202040;

		var g = new Graphics(s2d);
		g.beginFill(0x404080);
		g.drawRect(0, 0, 200, 200);
		g.endFill();

		var tf = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
		tf.text = "SF3";
		tf.x = 100;
		tf.y = 100;

		enterPoint = new EnterPointScene();
		enterPoint.init();
	}

	override function update(dt:Float) {
	}
}