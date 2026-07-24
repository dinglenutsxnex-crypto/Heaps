package scripts.sf3;

class RoundController {

	public static var instance:RoundController;

	public var roundsTotal:Int = 0;
	public var roundTimeTotal:Int = 0;
	public var currentRoundNumber:Int = 0;
	public var playerWinCount:Int = 0;
	public var enemyWinCount:Int = 0;
	public var currentRound:Dynamic;

	private var roundProcess:Bool = false;

	public function new() {
		instance = this;
		initialize();
	}

	public function initialize():Void {
		roundsTotal = 0;
		roundTimeTotal = 0;
		currentRoundNumber = 0;
		roundProcess = false;
		playerWinCount = 0;
		enemyWinCount = 0;
		currentRound = null;
	}

	public function update():Void {
		// Update round controller
	}

	public function startFight():Void {
		// Start fight
	}

	public function endRoundFight():Void {
		// End round fight
	}

	public function clearRoundData(fight:Dynamic):Void {
		// Clear round data
	}

	public function initNewRound(fight:Dynamic):Void {
		// Initialize new round
		currentRoundNumber++;
		// currentRound = fight.GetRound(playerWinCount + 1);
	}

	public function initBattleCamera(isFirstRound:Bool):Void {
		// Initialize battle camera
	}

	public function showStartRoundGUI(onComplete:Void -> Void):Void {
		// Show start round GUI
		if (onComplete != null) onComplete();
	}

	public function showEndRoundGUI(onComplete:Void -> Void):Void {
		// Show end round GUI
		if (onComplete != null) onComplete();
	}

	public function setRoundWinner(winner:ERoundResult):Void {
		switch (winner) {
			case ERoundResult.Win:
				playerWinCount++;
				break;
			case ERoundResult.Loss:
				enemyWinCount++;
				break;
		}
	}

	public function updateRewardCounters():Void {
		// Update reward counters
	}

	public function checkEndRound():Int {
		// Check if round should end
		return 0;
	}
}

enum ERoundResult {
	InProgress;
	Win;
	Loss;
	Draw;
}