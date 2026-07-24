package scripts.sf3;

class BehaviourTimer {

	private static var timers:Array<Dynamic> = [];

	public static function clear():Void {
		timers = [];
	}

	public static function update():Void {
		// Update timers
		for (timer in timers) {
			if (timer.update != null) {
				timer.update(GameTimeController.deltaTime);
			}
		}
	}

	public static function addTimer(timer:Dynamic):Void {
		timers.push(timer);
	}
}