package scripts.sf3;

class NetworkInitializer {

	public static var current:NetworkInitializer;

	public var onInitFinished:Void -> Void;

	public function new() {
		current = this;
	}

	public function init():Void {
		// Initialize network
		if (onInitFinished != null) {
			onInitFinished();
		}
	}
}