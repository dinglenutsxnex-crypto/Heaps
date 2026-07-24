package scripts.sf3.battleutils;

class SF3BattleUtils {

	private static var instance:SF3BattleUtils;

	private var fpsUtil:SF3FPSUtil;

	public function new() {
		fpsUtil = new SF3FPSUtil();
	}

	public static function initialize():Void {
		if (instance == null) {
			instance = new SF3BattleUtils();
		}
	}

	public static function update(dt:Float):Void {
		if (instance != null) {
			instance.fpsUtil.update(dt);
		}
	}

	public static function getFPS():Float {
		return instance != null ? instance.fpsUtil.getFPS() : 60.0;
	}

	public static function getPing():Int {
		return 0; // NetworkConnection.current.getPing()
	}
}

class SF3FPSUtil {

	private inline var COUNTER_TICK = 0.5;

	private var frameCounter:Int = 0;

	private var timeCounter:Float = 0.0;

	private var lastFramerate:Float = 60.0;

	public function update(dt:Float):Void {
		if (timeCounter < COUNTER_TICK) {
			timeCounter += dt;
			frameCounter++;
			if (timeCounter >= COUNTER_TICK) {
				lastFramerate = frameCounter / timeCounter;
				frameCounter = 0;
				timeCounter = 0.0;
			}
		}
	}

	public function getFPS():Float {
		return lastFramerate;
	}
}