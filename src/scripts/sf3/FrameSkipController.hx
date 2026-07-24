package scripts.sf3;

class FrameSkipController {

	public static var updateFrame:Void -> Void;

	private static var frameCount:Int = 0;
	private static var timeAccumulator:Float = 0.0;

	public static function moveToNextFrame():Void {
		frameCount++;
		if (updateFrame != null) {
			updateFrame();
		}
	}

	public static function syncFrameCountToTime():Void {
		// Sync frame count to time
		frameCount = Std.int(GameTimeController.time);
	}
}