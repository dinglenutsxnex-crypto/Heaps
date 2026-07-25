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
	}

	public function startFight():Void {
	}

	public function endRoundFight():Void {
	}

	public function clearRoundData(fight:Dynamic):Void {
	}

	public function initNewRound(fight:Dynamic):Void {
		currentRoundNumber++;
	}

	public function initBattleCamera(isFirstRound:Bool):Void {
	}

	public function showStartRoundGUI(onComplete:Void -> Void):Void {
		if (onComplete != null) onComplete();
	}

	public function showEndRoundGUI(onComplete:Void -> Void):Void {
		if (onComplete != null) onComplete();
	}

	public function setRoundWinner(winner:ERoundResult):Void {
		switch (winner) {
			case ERoundResult.Win:
				playerWinCount++;
			case ERoundResult.Loss:
				enemyWinCount++;
			default:
		}
	}

	public function updateRewardCounters():Void {
	}

	public function checkEndRound():Int {
		return 0;
	}
}

enum ERoundResult {
	InProgress;
	Win;
	Loss;
	Draw;
}