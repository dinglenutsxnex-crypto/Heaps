package scripts.sf3;

class Sandbox {

	private static var instance:Sandbox;

	public function new() {
		addConsoleCommand();
	}

	public static function init():Void {
		if (instance == null) {
			instance = new Sandbox();
		}
	}

	private function addConsoleCommand():Void {
		// Add console commands
	}
}
