package scripts.sf3;

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
				break;
			case EFightStage.RoundStart:
				roundStartProcess();
				break;
			case EFightStage.RoundEnd:
				setRoundEnd();
				break;
			case EFightStage.RoundFightStart:
				setRoundFightStart();
				break;
			case EFightStage.RoundFightEnd:
				setRoundFightEnd();
				break;
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
		// Start round process
		setFightStage(EFightStage.RoundFightStart);
	}

	private function setRoundEnd():Void {
		roundController.updateRewardCounters();
		// Check if fight should end
		setFightStage(EFightStage.FightEnd);
	}

	private function setFightEnd(surrender:Bool = false, winnerId:Null<Int> = null):Void {
		fightStage = EFightStage.FightEnd;
		// Fight end logic
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