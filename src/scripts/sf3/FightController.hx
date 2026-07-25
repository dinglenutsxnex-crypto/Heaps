package scripts.sf3;

import scripts.sf3.moves.ETriggerEvents;

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
	public var rewardMultipyerCounter:RewardMultipyerCounter;
	public var fightStage:EFightStage = EFightStage.None;
	public var currentFight:Dynamic;
	public var fightResult:Dynamic;

	public static var instance:FightController;

	public function new() {
		instance = this;
		roundController = new RoundController();
		rewardMultipyerCounter = new RewardMultipyerCounter();
	}

	public function initialize():Void {
		roundController.initialize();
		fightStage = EFightStage.None;
		fightResult = null;
	}

	public function initFight():Void {
		trace("[InitFight]");
		fightStage = EFightStage.RoundStart;
	}

	public function update():Void {
		if (fightStage != EFightStage.None) {
			roundController.update();
		}
	}

	public function setFightStage(stageValue:EFightStage, ?surrender:Bool, ?winnerId:Int):Void {
		fightStage = stageValue;
		switch (stageValue) {
			case EFightStage.FightEnd:
				setFightEnd(surrender, winnerId);
			case EFightStage.RoundStart:
				roundStartProcess();
			case EFightStage.RoundEnd:
				setRoundEnd();
			case EFightStage.RoundFightStart:
				setRoundFightStart();
			case EFightStage.RoundFightEnd:
				setRoundFightEnd();
			default:
		}
		BattleController.throwEvent(new BattleEventArgs(ETriggerEvents.EVENT_STAGE_CHANGE, -1, stageValue));
		trace("SetFightStage [" + stageValue + "]");
	}

	private function setRoundFightEnd():Void {
		roundController.endRoundFight();
		BattleKeyManager.instance.activateBattleKeys(false);
		BattleKeyManager.instance.enableBattleKeysEvents(false);
	}

	private function setRoundFightStart():Void {
		BattleKeyManager.instance.enableBattleKeysEvents(true);
		roundController.startFight();
	}

	private function roundStartProcess():Void {
		setFightStage(EFightStage.RoundFightStart);
	}

	private function setRoundEnd():Void {
		roundController.updateRewardCounters();
		setFightStage(EFightStage.FightEnd);
	}

	private function setFightEnd(surrender:Bool = false, winnerId:Null<Int> = null):Void {
		fightStage = EFightStage.FightEnd;
	}

	public function setFightResult(winnerId:Int, surrender:Bool):Void {
		setFightStage(EFightStage.FightEnd, surrender, winnerId);
	}

	public function winCurrentRound(winner:scripts.sf3.RoundController.ERoundResult):Void {
		roundController.setRoundWinner(winner);
		setFightStage(EFightStage.RoundFightEnd);
	}

	public static function tacticsCanReact():Bool {
		return instance != null && instance.fightStage == EFightStage.RoundFightStart;
	}
}