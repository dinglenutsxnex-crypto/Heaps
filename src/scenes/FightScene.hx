package scenes;

import h2d.Scene;
import h2d.Bitmap;
import h2d.Graphics;
import h2d.Text;
import hxd.Res;
import hxd.res.DefaultFont;

import scripts.sf3.SceneInitializer;
import scripts.sf3.BattleController;
import scripts.sf3.BattleInterface;
import scripts.sf3.BattleKeyManager;
import scripts.sf3.GameTimeController;

class FightScene {

	public static var instance:FightScene;
	public var scene:Scene;

	private var sceneInitializer:SceneInitializer;
	private var bg:Graphics;
	private var hpBarPlayer:Graphics;
	private var hpBarEnemy:Graphics;
	private var roundText:Text;
	private var timerText:Text;

	public function new() {
		instance = this;
	}

	public function init():Void {
		bg = new Graphics(scene);
		bg.beginFill(0x1a1a2e);
		bg.drawRect(0, 0, 1920, 1080);
		bg.endFill();

		bg.beginFill(0x16213e);
		bg.drawRect(100, 50, 1720, 60);
		bg.endFill();

		hpBarPlayer = new Graphics(scene);
		hpBarPlayer.beginFill(0x00cc66);
		hpBarPlayer.drawRect(120, 60, 400, 20);
		hpBarPlayer.endFill();

		var playerLabel = new Text(DefaultFont.get(), scene);
		playerLabel.text = "PLAYER";
		playerLabel.x = 120;
		playerLabel.y = 85;
		playerLabel.textColor = 0xFFFFFF;

		hpBarEnemy = new Graphics(scene);
		hpBarEnemy.beginFill(0xcc3333);
		hpBarEnemy.drawRect(1400, 60, 400, 20);
		hpBarEnemy.endFill();

		var enemyLabel = new Text(DefaultFont.get(), scene);
		enemyLabel.text = "ENEMY";
		enemyLabel.x = 1400;
		enemyLabel.y = 85;
		enemyLabel.textColor = 0xFFFFFF;

		roundText = new Text(DefaultFont.get(), scene);
		roundText.text = "ROUND 1";
		roundText.x = 920;
		roundText.y = 40;
		roundText.textColor = 0xFFDD00;
		roundText.textAlign = h2d.Align.Center;

		timerText = new Text(DefaultFont.get(), scene);
		timerText.text = "99";
		timerText.x = 960;
		timerText.y = 70;
		timerText.textColor = 0xFFFFFF;
		timerText.textAlign = h2d.Align.Center;

		var centerLine = new Graphics(scene);
		centerLine.beginFill(0xffffff, 0.2);
		centerLine.drawRect(0, 540, 1920, 2);
		centerLine.endFill();

		trace("Fight scene initialized");
	}
}