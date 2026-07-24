package scripts.sf3;

class ShadowFormController {

	public static var instance:ShadowFormController;

	public function new() {
		instance = this;
	}

	public function initialize():Void {
		// Initialize shadow form controller
	}

	public function disposeUnused():Void {
		// Dispose unused shadow forms
	}

	public function setLocationShadowFormEnabled(enabled:Bool, instant:Bool):Void {
		// Set location shadow form enabled
	}

	public function clearShadowEffect():Void {
		// Clear shadow effect
	}

	public function update():Void {
		// Update shadow form
	}
}