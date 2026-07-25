package scripts.sf3;

import scenes.FightScene;
import scripts.sf3.moves.ETriggerEvents;
import scripts.sf3.ERoundResult;

enum EFightStage {
	None;
	FightStart;
	FightEnd;
	RoundStart;
	RoundEnd;
	RoundFightStart;
	RoundFightEnd;
}

class FightController {

	public var roundController:RoundController;
	public var fightStage:EFightStage = EFightStage.None;

	public static var instance:FightController;

	private var fightResult:Dynamic;
	private var modelsAnimationEndCounter:Int = 0;

	public function new() {
		instance = this;
		roundController = new RoundController();
	}

	public function initialize():Void {
		roundController.initialize();
		fightStage = EFightStage.None;
		fightResult = null;
		modelsAnimationEndCounter = 0;
	}

	public function initFight():Void {
		trace("[InitFight]");
		fightResult = null;
		setFightStage(EFightStage.RoundStart);
	}

	public function update():Void {
		if (fightStage != EFightStage.None) {
			roundController.update();
			if (fightStage == EFightStage.RoundFightStart) {
				var endResult = roundController.checkEndRound();
				if (endResult != ERoundResult.InProgress) {
					setFightStage(EFightStage.RoundFightEnd);
				}
			}
		}
	}

	public function setFightStage(stageValue:EFightStage, ?surrender:Bool, ?winnerId:Int):Void {
		fightStage = stageValue;
		switch (stageValue) {
			case EFightStage.RoundStart:
				roundController.initNewRound(null);
				setFightStage(EFightStage.RoundFightStart);
			case EFightStage.RoundFightStart:
				BattleKeyManager.instance.enableBattleKeysEvents(true);
				roundController.startFight();
			case EFightStage.RoundFightEnd:
				roundController.endRoundFight();
				BattleKeyManager.instance.activateBattleKeys(false);
				BattleKeyManager.instance.enableBattleKeysEvents(false);
				modelsAnimationEndCounter = 2;
				showEndRound();
			case EFightStage.RoundEnd:
				roundController.updateRewardCounters();
				if (roundController.playerWinCount >= FightControllerSettings.roundsCount
					|| roundController.enemyWinCount >= FightControllerSettings.roundsCount) {
					setFightStage(EFightStage.FightEnd);
				} else {
					setFightStage(EFightStage.RoundStart);
				}
			case EFightStage.FightEnd:
				setFightEnd(surrender, winnerId);
			default:
		}
		BattleController.throwEvent(new BattleEventArgs(ETriggerEvents.EVENT_STAGE_CHANGE, -1, stageValue));
	}

	private function showEndRound():Void {
		var winner = roundController.playerWinCount > roundController.enemyWinCount
			? ERoundResult.Win : ERoundResult.Loss;
		roundController.showEndRoundGUI(function() {
			setFightStage(EFightStage.RoundEnd);
		}, winner);
	}

	private function setFightEnd(surrender:Bool = false, winnerId:Null<Int> = null):Void {
		trace("[FightEnd]");
		if (FightScene.instance != null) {
			FightScene.instance.showEndGame();
		}
	}

	public function setFightResult(winnerId:Int, surrender:Bool):Void {
		setFightStage(EFightStage.FightEnd, surrender, winnerId);
	}

	public function winCurrentRound(winner:ERoundResult):Void {
		roundController.setRoundWinner(winner);
		setFightStage(EFightStage.RoundFightEnd);
	}

	public static function tacticsCanReact():Bool {
		return instance != null && instance.fightStage == EFightStage.RoundFightStart;
	}
}
