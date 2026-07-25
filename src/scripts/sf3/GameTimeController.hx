package scripts.sf3;

class GameTimeController {

	public static inline var DEFAULT_TIME_SCALE = 1.0;

	public static var FIXED_DELTA_TIME:Float = 1.0 / 60.0;

	private static var gravity:Float = 9.81;

	private static var lastTimeScale:Float = 1.0;

	private static var lastSystemTimeScale:Float = 1.0;

	public static var gamePaused(get, never):Bool;

	private static var _gamePaused:Bool = false;

	private static var _systemPaused:Bool = false;

	public static var gameTimeDelta:Float = 0.0;

	public static var battleTime:Float = 0.0;

	public static var unscaledBattleTime:Float = 0.0;

	public static var deltaTime:Float = 0.0;

	public static var deltaTimePaused(get, never):Float;

	public static var frameCount(get, never):Int;

	public static var time:Float = 0.0;

	public static var timeScale:Float = 1.0;

	public static var unscaledTime:Float = 0.0;

	public static var unscaledDeltaTime:Float = 0.0;

	private static var _frameCount:Int = 0;

	public static function get_deltaTimePaused():Float {
		return (!_gamePaused) ? deltaTime : 0.0;
	}

	public static function get_frameCount():Int {
		return _frameCount;
	}

	public static function get_gamePaused():Bool {
		return _gamePaused || _systemPaused;
	}

	public static function get_systemPaused():Bool {
		return _systemPaused;
	}

	public static function reset():Void {
		_gamePaused = false;
		_systemPaused = false;
		resetTimeScale();
		updateCache(0.0);
	}

	public static function setPhysicTimeStamp(stampValue:Float):Void {
		FIXED_DELTA_TIME = stampValue;
	}

	public static function updateBattleTime(dt:Float):Void {
		if (!_systemPaused) {
			updateCache(dt);
		}
		if (!get_gamePaused()) {
			battleTime += gameTimeDelta;
		}
	}

	private static function updateCache(dt:Float):Void {
		deltaTime = dt;
		_frameCount++;
		time += dt;
		unscaledTime += dt;
		unscaledDeltaTime = dt;
	}

	public static function resetTimeScale():Void {
		changeTimeScale(1.0);
		lastTimeScale = 1.0;
		lastSystemTimeScale = 1.0;
	}

	public static function gameTimePause(pauseSounds:Bool = false):Void {
		if (!get_gamePaused()) {
			lastTimeScale = timeScale;
			_gamePaused = true;
			changeGameTime(0.0);
		}
	}

	public static function gameTimeResume():Void {
		if (get_gamePaused()) {
			_gamePaused = false;
			changeGameTime(lastTimeScale);
		}
	}

	public static function systemTimePause():Void {
		if (!_systemPaused) {
			_systemPaused = true;
			lastSystemTimeScale = timeScale;
			timeScale = 0.0;
		}
	}

	public static function systemTimeResume():Void {
		if (_systemPaused) {
			_systemPaused = false;
			timeScale = lastSystemTimeScale;
		}
	}

	public static function changeGameTime(newTimeDelta:Float):Void {
		changeTimeScale(newTimeDelta);
	}

	private static function changeTimeScale(newTimeDelta:Float):Void {
		var clamped = clamp(newTimeDelta, 0.0, 1.0);
		gameTimeDelta = clamped;
		timeScale = clamped;
	}

	private static function clamp(value:Float, min:Float, max:Float):Float {
		if (value < min) return min;
		if (value > max) return max;
		return value;
	}

	public static function update(dt:Float):Void {
		updateCache(dt);
	}
}