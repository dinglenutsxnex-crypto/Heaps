package scripts.sf3;

import scripts.sf3.gamemodels.Model;

class BattleCamera implements ISceneInitializationObject {

	public static var instance:BattleCamera;

	public var player:Model;
	public var enemy:Model;
	public var active:Bool = false;

	public function new() {
		instance = this;
	}

	public static function setModels(player:Model, enemy:Model):Void {
		if (instance != null) {
			instance.player = player;
			instance.enemy = enemy;
		}
	}

	public function activateBattleCamera(instant:Bool):Void {
		active = true;
	}

	public function roundEndTweenMotion():Void {
	}

	public function roundEndTweenIsReady():Bool {
		return true;
	}

	public static function moveToDefault(instant:Bool):Void {
	}

	public static function moveToSpawnCentre(instant:Bool):Void {
	}

	public function setCameraBlocked(blocked:Bool):Void {
	}

	public function update(dt:Float):Void {
	}

	public function initialize():Void {
		active = true;
	}

	public function disposePreviousLocation():Void {
		player = null;
		enemy = null;
	}
}