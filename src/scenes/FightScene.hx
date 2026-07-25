package scenes;

import h2d.Scene;
import h2d.Bitmap;
import h2d.Graphics;
import h2d.Text;
import h2d.Tile;
import h2d.Object;
import hxd.res.DefaultFont;

import Assets;
import scripts.sf3.RoundController;
import scripts.sf3.FightController;
import scripts.sf3.ModelsManager;
import scripts.sf3.ERoundResult;

class FightScene {

	public static var instance:FightScene;
	public var scene:Scene;

	private var arenaBg:Bitmap;
	private var darknessOverlay:Bitmap;
	private var playerHpFill:Graphics;
	private var enemyHpFill:Graphics;
	private var playerHpBg:Bitmap;
	private var enemyHpBg:Bitmap;
	private var roundText:Text;
	private var timerText:Text;
	private var playerNameText:Text;
	private var enemyNameText:Text;
	private var playerWinsText:Text;
	private var enemyWinsText:Text;
	private var playerHpLabel:Text;
	private var enemyHpLabel:Text;
	private var resultText:Text;
	private var resultContainer:Object;

	private var initialized:Bool = false;

	public function new() {
		instance = this;
	}

	public function init():Void {
		trace("Fight scene init - loading textures");

		Assets.loadImage("assets/textures/ui/infobattle/bamboo.png", function(t) {
			arenaBg = new Bitmap(t, scene);
			arenaBg.scaleX = 1920 / t.width;
			arenaBg.scaleY = 1080 / t.height;
		});

		Assets.loadImage("assets/textures/ui/ui_darkness.png", function(t) {
			darknessOverlay = new Bitmap(t, scene);
			darknessOverlay.scaleX = 1920 / t.width;
			darknessOverlay.scaleY = 1080 / t.height;
			darknessOverlay.alpha = 0.55;
		});

		Assets.loadImage("assets/textures/ui/shadow_bar_glow.png", function(t) {
			playerHpBg = new Bitmap(t, scene);
			playerHpBg.x = 80;
			playerHpBg.y = 80;
			playerHpBg.scaleX = 440 / t.width;
			playerHpBg.scaleY = 36 / t.height;
			playerHpBg.alpha = 0.25;

			enemyHpBg = new Bitmap(t, scene);
			enemyHpBg.x = 1400;
			enemyHpBg.y = 80;
			enemyHpBg.scaleX = 440 / t.width;
			enemyHpBg.scaleY = 36 / t.height;
			enemyHpBg.alpha = 0.25;
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

		var logoPath = "assets/textures/ui/logSF3.png";
		Assets.loadImage(logoPath, function(t) {
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

		playerWinsText = new Text(font, scene);
		playerWinsText.x = 85;
		playerWinsText.y = 145;
		playerWinsText.textColor = 0xFFDD00;

		enemyWinsText = new Text(font, scene);
		enemyWinsText.x = 1835;
		enemyWinsText.y = 145;
		enemyWinsText.textColor = 0xFFDD00;
		enemyWinsText.textAlign = h2d.Align.Right;

		playerHpLabel = new Text(font, scene);
		playerHpLabel.x = 85;
		playerHpLabel.y = 165;
		playerHpLabel.textColor = 0xAAAAAA;

		enemyHpLabel = new Text(font, scene);
		enemyHpLabel.x = 1835;
		enemyHpLabel.y = 165;
		enemyHpLabel.textColor = 0xAAAAAA;
		enemyHpLabel.textAlign = h2d.Align.Right;

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

		resultContainer = new Object(scene);
		resultText = new Text(font, resultContainer);
		resultText.textAlign = h2d.Align.Center;
		resultText.x = 960;
		resultText.y = 480;
		resultText.textColor = 0xFFFFFF;
		resultContainer.visible = false;

		var centerLine = new Graphics(scene);
		centerLine.beginFill(0xffffff, 0.12);
		centerLine.drawRect(0, 540, 1920, 2);
		centerLine.endFill();

		initialized = true;
		trace("Fight scene UI created with real textures");
	}

	public function update():Void {
		if (!initialized) return;

		var rc = RoundController.instance;
		var mm = ModelsManager.instance;

		if (rc != null) {
			roundText.text = "ROUND " + rc.currentRoundNumber;
			timerText.text = "" + Math.ceil(rc.roundTimeLeft);

			playerWinsText.text = "Wins: " + rc.playerWinCount;
			enemyWinsText.text = "Wins: " + rc.enemyWinCount;
		}

		if (mm != null) {
			if (mm.player != null) {
				var hpPct = mm.player.hp / mm.player.maxHp;
				if (hpPct < 0) hpPct = 0;
				playerHpFill.scaleX = hpPct;
				playerHpLabel.text = "HP: " + Math.ceil(mm.player.hp);
			}
			if (mm.enemy != null) {
				var hpPct = mm.enemy.hp / mm.enemy.maxHp;
				if (hpPct < 0) hpPct = 0;
				enemyHpFill.scaleX = hpPct;
				enemyHpLabel.text = "HP: " + Math.ceil(mm.enemy.hp);
			}
		}
	}

	public function showRoundResult(result:ERoundResult, roundNum:Int):Void {
		resultContainer.visible = true;
		switch (result) {
			case ERoundResult.Win:
				resultText.text = "ROUND " + roundNum + "\nYOU WIN!";
				resultText.textColor = 0x33DD77;
			case ERoundResult.Loss:
				resultText.text = "ROUND " + roundNum + "\nYOU LOSE";
				resultText.textColor = 0xDD4444;
			case ERoundResult.Draw:
				resultText.text = "ROUND " + roundNum + "\nDRAW";
				resultText.textColor = 0xFFFF00;
			default:
				resultContainer.visible = false;
		}
		resultText.textAlign = h2d.Align.Center;
	}

	public function showEndGame():Void {
		resultContainer.visible = true;
		var rc = RoundController.instance;
		if (rc != null && rc.playerWinCount > rc.enemyWinCount) {
			resultText.text = "FIGHT OVER\nVICTORY!";
			resultText.textColor = 0x33DD77;
		} else {
			resultText.text = "FIGHT OVER\nDEFEAT";
			resultText.textColor = 0xDD4444;
		}
		resultText.textAlign = h2d.Align.Center;
	}
}
