package scripts.sf3;

import haxe.DateTime;
import haxe.Timer;

class GlobalTimer {

	public static inline var TICK = 0;

	public static inline var FRAME_TICK = 1;

	private static var instance:GlobalTimer;

	private static var syncTime:Float = 0.0;

	private static var serverUtc:DateTime;

	private static var synchronized:Bool = false;

	private static var onSuccess:Void -> Void;

	private static var onError:Dynamic -> Void;

	private static var requestInProgress:Bool = false;

	private static var lastRequestSuccessful:Bool = false;

	private static var externalInit:Bool = false;

	private var lastTimeTick:Float = 0.0;

	public static var localizedNow(get, never):DateTime;

	public static var now(get, never):DateTime;

	public static var getTime(get, never):Float;

	public static var isSynchronized(get, never):Bool;

	public static var isRequestInProgress(get, never):Bool;

	public static var isLastRequestSuccessful(get, never):Bool;

	private function new() {
		serverUtc = DateTime.now();
		syncTime = Timer.stamp();
	}

	public static function init(externalInit:Bool = false):Void {
		if (instance == null) {
			instance = new GlobalTimer();
			synchronized = false;
			lastRequestSuccessful = false;
			externalInit = externalInit;
			if (!externalInit) {
				serverTimeSync();
			}
		}
	}

	public static function serverTimeSync(onSuccess:Void -> Void = null, onError:Dynamic -> Void = null):Void {
		requestInProgress = true;
		synchronized = false;
		// In web, we would sync with server via HTTP request
		// For now, just use local time
		serverUtc = DateTime.now();
		syncTime = Timer.stamp();
		synchronized = true;
		requestInProgress = false;
		lastRequestSuccessful = true;
		if (onSuccess != null) {
			onSuccess();
		}
	}

	public static function serverTimeExtended(msec:Float):Void {
		serverUtc = unixTimeStampToDateTime(msec / 1000.0);
		syncTime = Timer.stamp();
		synchronized = true;
		requestInProgress = false;
		lastRequestSuccessful = true;
		if (onSuccess != null) {
			onSuccess();
		}
	}

	public static function convertToUnixTimestamp(date:DateTime):Int {
		var epoch = new DateTime(1970, 1, 1, 0, 0, 0);
		return Math.floor((date.getTime() - epoch.getTime()) / 1000);
	}

	public static function unixTimeStampToDateTime(unixTimeStamp:Float):DateTime {
		return DateTime.fromTime(unixTimeStamp * 1000);
	}

	public static function unixTimeStampToDateTimeLocal(unixTimeStamp:Float):DateTime {
		return unixTimeStampToDateTime(unixTimeStamp).toLocal();
	}

	public static function update(dt:Float):Void {
		if (instance != null) {
			// Update timer events
			if (instance.lastTimeTick + 1.0 < Timer.stamp()) {
				instance.lastTimeTick = Timer.stamp();
				// Fire TICK event
			}
			// Fire FRAME_TICK event
		}
	}

	private static function get_localizedNow():DateTime {
		return now.toLocal();
	}

	private static function get_now():DateTime {
		var elapsed = Timer.stamp() - syncTime;
		return DateTime.fromTime(serverUtc.getTime() + Std.int(elapsed * 1000));
	}

	private static function get_getTime():Float {
		return convertToUnixTimestamp(now);
	}

	private static function get_isSynchronized():Bool {
		return synchronized;
	}

	private static function get_isRequestInProgress():Bool {
		return requestInProgress;
	}

	private static function get_isLastRequestSuccessful():Bool {
		return lastRequestSuccessful;
	}
}
