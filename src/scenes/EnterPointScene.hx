package scenes;

import h2d.Scene;
import h2d.Bitmap;
import h2d.Tile;
import h2d.Graphics;
import hxd.Res;

class EnterPointScene {

	public static var instance:EnterPointScene;
	public var scene:Scene;
	public var fightScene:FightScene;

	public function new() {
		instance = this;
	}

	public function init():Void {
		trace("Starting game...");

		fightScene = new FightScene();
		fightScene.scene = scene;
		fightScene.init();
	}
}