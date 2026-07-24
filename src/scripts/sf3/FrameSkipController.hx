package scripts.sf3;

class FrameSkipController {

	public static var updateFrame:Void -> Void;

	public static function moveToNextFrame():Void {
		if (updateFrame != null) {
			updateFrame();
		}
	}

	public static function syncFrameCountToTime():Void {
		// Sync frame count to time
	}
}