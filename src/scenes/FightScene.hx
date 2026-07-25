package scenes;

import h2d.Scene;
import h2d.Bitmap;
import h2d.Graphics;
import h2d.Text;
import h2d.Tile;
import hxd.res.DefaultFont;

import Assets;
import scripts.sf3.SceneInitializer;
import scripts.sf3.BattleController;
import scripts.sf3.BattleInterface;
import scripts.sf3.BattleKeyManager;
import scripts.sf3.GameTimeController;

class FightScene {

	public static var instance:FightScene;
	public var scene:Scene;

	private var sceneInitializer:SceneInitializer;
	private var playerHpFill:Graphics;
	private var enemyHpFill:Graphics;
	private var roundText:Text;
	private var timerText:Text;
	private var playerNameText:Text;
	private var enemyNameText:Text;

	public function new() {
		instance = this;
	}

	public function init():Void {
		trace("Fight scene init - loading textures");

		Assets.loadImage("assets/textures/ui/infobattle/bamboo.png", function(t) {
			var arenaBg = new Bitmap(t, scene);
			arenaBg.scaleX = 1920 / t.width;
			arenaBg.scaleY = 1080 / t.height;
		});

		Assets.loadImage("assets/textures/ui/ui_darkness.png", function(t) {
			var darkness = new Bitmap(t, scene);
			darkness.scaleX = 1920 / t.width;
			darkness.scaleY = 1080 / t.height;
			darkness.alpha = 0.55;
		});

		Assets.loadImage("assets/textures/ui/shadow_bar_glow.png", function(t) {
			var playerBg = new Bitmap(t, scene);
			playerBg.x = 80;
			playerBg.y = 80;
			playerBg.scaleX = 440 / t.width;
			playerBg.scaleY = 36 / t.height;
			playerBg.alpha = 0.25;

			var enemyBg = new Bitmap(t, scene);
			enemyBg.x = 1400;
			enemyBg.y = 80;
			enemyBg.scaleX = 440 / t.width;
			enemyBg.scaleY = 36 / t.height;
			enemyBg.alpha = 0.25;
		});

		playerHpFill = new Graphics(scene);
		playerHpFill.beginFill(0x33dd77);
		playerHpFill.drawRect(0, 0, 430, 28);
		playerHpFill.endFill();
		playerHpFill.x = 85;
		playerHpFill.y = 84;

		enemyHpFill = new Graphics(scene);
		enemyHpFill.beginFill(0xdd4444);
		enemyHpFill.drawRect(0, 0, 430, 28);
		enemyHpFill.endFill();
		enemyHpFill.x = 1405;
		enemyHpFill.y = 84;

		Assets.loadImage("assets/textures/ui/logSF3.png", function(t) {
			var logo = new Bitmap(t, scene);
			logo.x = 760;
			logo.y = 10;
			logo.scaleX = 400 / t.width;
			logo.scaleY = 80 / t.height;
			logo.alpha = 0.1;
		});

		var font = DefaultFont.get();

		playerNameText = new Text(font, scene);
		playerNameText.text = "PLAYER";
		playerNameText.x = 85;
		playerNameText.y = 120;
		playerNameText.textColor = 0xFFFFFF;

		enemyNameText = new Text(font, scene);
		enemyNameText.text = "ENEMY";
		enemyNameText.x = 1835;
		enemyNameText.y = 120;
		enemyNameText.textColor = 0xFFFFFF;
		enemyNameText.textAlign = h2d.Align.Right;

		roundText = new Text(font, scene);
		roundText.text = "ROUND 1";
		roundText.x = 960;
		roundText.y = 14;
		roundText.textColor = 0xFFDD00;
		roundText.textAlign = h2d.Align.Center;

		timerText = new Text(font, scene);
		timerText.text = "99";
		timerText.x = 960;
		timerText.y = 44;
		timerText.textColor = 0xFFFFFF;
		timerText.textAlign = h2d.Align.Center;

		var centerLine = new Graphics(scene);
		centerLine.beginFill(0xffffff, 0.12);
		centerLine.drawRect(0, 540, 1920, 2);
		centerLine.endFill();

		trace("Fight scene UI created with real textures");
	}
}
