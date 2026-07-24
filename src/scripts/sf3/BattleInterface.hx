package scripts.sf3;

class BattleInterface {

	public static var instance:BattleInterface;

	public function new() {
		instance = this;
	}

	public function initialize():Void {
		// Initialize battle interface
	}

	public function disposePreviousLocation():Void {
		// Dispose previous location data
	}

	public function initializeFightHud():Void {
		// Initialize fight HUD
	}

	public function resetBattleGUIManager():Void {
		// Reset battle GUI manager
	}

	public function updateBattleGUIManager():Void {
		// Update battle GUI manager
	}

	public function setBattleTimerFrames(frames:Int):Void {
		// Set battle timer frames
	}

	public function battleTimerActive(active:Bool):Void {
		// Set battle timer active
	}

	public function updateRoundTimer():Void {
		// Update round timer
	}

	public function colorPlayerRoundsUI(count:Int):Void {
		// Color player rounds UI
	}

	public function colorEnemyRoundsUI(count:Int):Void {
		// Color enemy rounds UI
	}

	public function showStartRound(callback:Void -> Void, roundNumber:Int):Void {
		if (callback != null) callback();
	}

	public function showStartRoundFight(callback:Void -> Void):Void {
		if (callback != null) callback();
	}

	public function showEndRoundFight(callback:Void -> Void, result:ERoundResult):Void {
		if (callback != null) callback();
	}

	public function showEndRoundFight_PVP(callback:Void -> Void, result:ERoundResult, winnerName:String):Void {
		if (callback != null) callback();
	}

	public function showPerfect(callback:Void -> Void):Void {
		if (callback != null) callback();
	}

	public function showGreat(callback:Void -> Void):Void {
		if (callback != null) callback();
	}

	public function showEndGame(onShow:Void -> Void, fightResult:Dynamic):Void {
		onShow();
	}

	public function showEndGame(delegate:Void -> Void, fightResult:Dynamic):Void {
		delegate();
	}
}