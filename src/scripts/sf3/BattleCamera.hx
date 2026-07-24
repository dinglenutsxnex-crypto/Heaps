package scripts.sf3;

class BattleCamera {

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
		// Round end tween motion
	}

	public function roundEndTweenIsReady():Bool {
		return true;
	}

	public static function moveToDefault(instant:Bool):Void {
		// Move to default position
	}

	public static function moveToSpawnCentre(instant:Bool):Void {
		// Move to spawn centre
	}

	public function setCameraBlocked(blocked:Bool):Void {
		// Set camera blocked
	}

	public function update(dt:Float):Void {
		// Update camera
	}

	public function initialize():Void {
		active = true;
	}

	public function disposePreviousLocation():Void {
		// Dispose previous location data
		player = null;
		enemy = null;
	}
}