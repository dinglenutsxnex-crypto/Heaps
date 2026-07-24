package scripts.sf3;

class BattlesManager {

	public static var instance:BattlesManager;
	public static var currentBattleType:BattleType = BattleType.None;
	public static var currentBattle:Dynamic;

	public function new() {
		instance = this;
	}

	public static function initialize():Void {
		if (instance == null) {
			instance = new BattlesManager();
		}
	}

	public function getCurrentFight():Dynamic {
		return null;
	}
}

enum BattleType {
	None;
	Story;
	Daily;
	Side;
	Survival;
	Periodic;
	Boss;
	Dojo;
}