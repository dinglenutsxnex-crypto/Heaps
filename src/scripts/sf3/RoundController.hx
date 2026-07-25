package scripts.sf3;

import scenes.FightScene;

class RoundController {

	public static var instance:RoundController;

	public var roundsTotal:Int = 0;
	public var roundTimeTotal:Int = 0;
	public var currentRoundNumber:Int = 0;
	public var playerWinCount:Int = 0;
	public var enemyWinCount:Int = 0;
	public var roundResult:ERoundResult = InProgress;
	public var roundTimeLeft:Float = 0;

	private var roundProcess:Bool = false;

	public function new() {
		instance = this;
		initialize();
	}

	public function initialize():Void {
		roundsTotal = FightControllerSettings.roundsCount;
		roundTimeTotal = FightControllerSettings.roundTime;
		currentRoundNumber = 0;
		roundProcess = false;
		playerWinCount = 0;
		enemyWinCount = 0;
		roundResult = InProgress;
		roundTimeLeft = roundTimeTotal;
	}

	public function clearRoundData(fight:Dynamic):Void {
		currentRoundNumber++;
		roundTimeLeft = roundTimeTotal;
		roundResult = InProgress;
		roundProcess = false;
	}

	public function initNewRound(fight:Dynamic):Void {
		clearRoundData(fight);
		trace("[InitNewRound] Round " + currentRoundNumber);
	}

	public function initBattleCamera(isFirstRound:Bool):Void {
	}

	public function startFight():Void {
		roundProcess = true;
		trace("[Fight Start] Round " + currentRoundNumber);
	}

	public function update():Void {
		if (roundProcess) {
			roundTimeLeft -= GameTimeController.deltaTimePaused;
			if (roundTimeLeft < 0) roundTimeLeft = 0;
		}
	}

	public function checkEndRound():ERoundResult {
		if (!roundProcess) return InProgress;
		if (roundTimeLeft <= 0) {
			roundResult = Loss;
			return roundResult;
		}
		var playerDead = ModelsManager.instance != null
			&& ModelsManager.instance.player != null
			&& ModelsManager.instance.player.hp <= 0;
		var enemyDead = ModelsManager.instance != null
			&& ModelsManager.instance.enemy != null
			&& ModelsManager.instance.enemy.hp <= 0;
		if (playerDead) {
			roundResult = Loss;
			return roundResult;
		}
		if (enemyDead) {
			roundResult = Win;
			return roundResult;
		}
		return InProgress;
	}

	public function setRoundWinner(winner:ERoundResult):Void {
		roundResult = winner;
		switch (winner) {
			case Win:
				playerWinCount++;
			case Loss:
				enemyWinCount++;
			default:
		}
		trace("[Round Winner] " + winner + " P:" + playerWinCount + " E:" + enemyWinCount);
	}

	public function endRoundFight():Void {
		roundProcess = false;
		trace("[End Round Fight]");
	}

	public function updateRewardCounters():Void {
	}

	public function showStartRoundGUI(onComplete:Void -> Void):Void {
		if (onComplete != null) onComplete();
	}

	public function showEndRoundGUI(onComplete:Void -> Void, winner:ERoundResult):Void {
		setRoundWinner(winner);
		if (FightScene.instance != null) {
			FightScene.instance.showRoundResult(winner, currentRoundNumber);
		}
		if (onComplete != null) onComplete();
	}
}
