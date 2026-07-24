package scripts.sf3;

class UserManager {

	public static var UserModelInfo:Dynamic;
	public static var waitingForRefreshBattles:Bool = false;

	public static function getIntentModule():Dynamic {
		return null;
	}

	public static function getLevel():Int {
		return 1;
	}

	public static function getExperience():Int {
		return 0;
	}

	public static function addQuestQueue(trigger:Dynamic):Void {
		// Add quest to queue
	}

	public static function removeQuestQueue(trigger:Dynamic):Void {
		// Remove quest from queue
	}
}