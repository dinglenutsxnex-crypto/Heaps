package scripts.sf3;

class BattleLog {

	public static function begin(fight:Dynamic, player:Dynamic, enemy:Dynamic):Void {
		// Begin battle log
	}

	public static function updateModels(player:Dynamic, enemy:Dynamic):Void {
		// Update battle log models
	}

	public static function roundStart(roundNumber:Int):Void {
		// Round start
	}

	public static function roundEnd(playerWin:Bool):Void {
		// Round end
	}

	public static function endFight(isWin:Bool):Void {
		// End fight
	}

	public static function addVariable(ownerId:Int, name:String, value:Dynamic, frames:Int):Void {
		// Add variable to log
	}

	public static function setVariable(ownerId:Int, name:String, value:Dynamic, frames:Int):Void {
		// Set variable in log
	}

	public static function removeVariable(ownerId:Int, name:String, value:Dynamic, frames:Int):Void {
		// Remove variable from log
	}
}