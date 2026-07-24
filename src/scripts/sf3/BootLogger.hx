package scripts.sf3;

class BootLogger {

	private static var file:String;

	public static function init():Void {
		#if debug
		file = "BootLog.log";
		write("BootLogger initialized");
		#end
	}

	public static function call(action:Void -> Void, name:String):Void {
		var startTime = haxe.Timer.stamp();
		action();
		#if debug
		var elapsed = haxe.Timer.stamp() - startTime;
		trace('[Time:${elapsed}] ${name}');
		write('[Time:${elapsed}] ${name}');
		#end
	}

	public static function write(log:String):Void {
		#if debug
		trace(log);
		#end
	}
}
