package scripts.sf3;

class EffectsManager implements ISceneInitializationObject {

	public static var instance:EffectsManager;

	public function new() {
		instance = this;
	}

	public function initialize():Void {
		// Initialize effects manager
	}

	public function disposePreviousLocation():Void {
		// Dispose previous location effects
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