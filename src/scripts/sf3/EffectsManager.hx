package scripts.sf3;

class EffectsManager {

	public static var instance:EffectsManager;

	public function new() {
		instance = this;
	}

	public function initialize():Void {
		// Initialize effects manager
	}

	public static function reset():Void {
		// Reset effects
	}

	public function effectsEnabling(enable:Bool):Void {
		// Enable/disable effects
	}

	public function update():Void {
		// Update effects
	}
}