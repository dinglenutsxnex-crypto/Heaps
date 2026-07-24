package scripts.sf3;

class NetworkConnection {

	public static var current:NetworkConnection;

	public static var shouldAutoConnect:Bool = true;

	public var onInitFinished:Void -> Void;

	public function new() {
		current = this;
	}

	public function init():Void {
		// Initialize network connection
	}

	public function updateNetwork():Void {
		// Update network
	}
}