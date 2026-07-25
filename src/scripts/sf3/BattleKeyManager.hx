package scripts.sf3;

class BattleKeyManager {

	public static var instance:BattleKeyManager;

	public static function get_instance():BattleKeyManager {
		if (instance == null) {
			instance = new BattleKeyManager();
		}
		return instance;
	}

	public function new() {
		instance = this;
	}

	public static function pause():Void {
	}

	public static function unpause():Void {
	}

	public function activateBattleKeys(isActive:Bool):Void {
	}

	public function enableBattleKeysEvents(isEnabled:Bool):Void {
	}

	public function update():Void {
	}
}