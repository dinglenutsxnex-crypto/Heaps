package scripts.sf3;

class BattleKeyManager {

	private static var instance:BattleKeyManager;

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
		// Pause battle keys
	}

	public static function unpause():Void {
		// Unpause battle keys
	}

	public function activateBattleKeys(isActive:Bool):Void {
		// Activate/deactivate battle keys
	}

	public function enableBattleKeysEvents(isEnabled:Bool):Void {
		// Enable/disable battle keys events
	}

	public function update():Void {
		// Update battle keys
	}
}