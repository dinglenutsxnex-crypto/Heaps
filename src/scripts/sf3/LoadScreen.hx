package scripts.sf3;

class LoadScreen {

	private static var instance:LoadScreen;

	private var loaderVisible:Bool = false;

	public static var loaderVisible(get, never):Bool;

	public function new() {
		instance = this;
	}

	public static function showLoader(onDone:Void -> Void = null, showDelay:Float = 0.0, instantly:Bool = false):Void {
		if (instance == null) {
			instance = new LoadScreen();
		}
		instance.loaderVisible = true;
		if (onDone != null) {
			onDone();
		}
	}

	public static function hideLoader(onDone:Void -> Void = null):Void {
		if (instance != null) {
			instance.loaderVisible = false;
		}
		if (onDone != null) {
			onDone();
		}
	}

	private static function get_loaderVisible():Bool {
		return instance != null && instance.loaderVisible;
	}

	public static function clear():Void {
		instance = null;
	}
}
