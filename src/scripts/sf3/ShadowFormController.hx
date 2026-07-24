package scripts.sf3;

class ShadowFormController {

	public static var instance:ShadowFormController;

	public function new() {
		instance = this;
	}

	public static function initialize():Void {
		if (instance == null) {
			instance = new ShadowFormController();
		}
	}

	public function initialize():Void {
		// Initialize shadow form
	}

	public function setLocationShadowFormEnabled(enabled:Bool, instant:Bool):Void {
		// Set location shadow form
	}

	public function disposeUnused():Void {
		// Dispose unused
	}

	public function update():Void {
		// Update shadow form
	}
}