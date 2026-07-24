package scripts.sf3;

class JS {

	private static var instance:JS;

	public static function get_instance():JS {
		if (instance == null) {
			instance = new JS();
		}
		return instance;
	}

	public function new() {
	}

	public function initializeGameScripts(onComplete:Void -> Void):Void {
		// Initialize game scripts
		if (onComplete != null) {
			onComplete();
		}
	}
}