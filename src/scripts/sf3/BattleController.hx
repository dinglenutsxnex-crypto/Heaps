package scripts.sf3;

import scripts.sf3.moves.ETriggerEvents;

class BattleController {

	public static var instance:BattleController;

	private var fightController:FightController;
	private var battleEvents:BattleEventsControl;
	private var keyManager:BattleKeyManager;
	private var shadowFormController:ShadowFormController;

	private var battleEnabled:Bool = false;
	private var eventsEnabled:Bool = false;

	public function new() {
		instance = this;
		fightController = new FightController();
		battleEvents = new BattleEventsControl();
		keyManager = new BattleKeyManager();
		shadowFormController = new ShadowFormController();
		battleEnabled = false;
		eventsEnabled(true);
		FrameSkipController.updateFrame = updateFrame;
	}

	public function initialize():Void {
		shadowFormController.initialize();
		fightController.initialize();
		battleEnabled = false;
	}

	public function disposePreviousLocation():Void {
		battleEnabled = false;
		BehaviourTimer.clear();
		battleEvents.clearEvents();
	}

	public function initBattle():Void {
		trace("[InitBattle]");
		fightController.initFight();
		battleEnabled = true;
		FrameSkipController.syncFrameCountToTime();
	}

	private function updateFrame():Void {
		GameTimeController.updateBattleTime();
		BehaviourTimer.update();
		if (battleEnabled) {
			if (!GameTimeController.gamePaused) {
				battleEvents.update();
			}
			keyManager.update();
			if (!GameTimeController.gamePaused) {
				GameVariables.update();
				fightController.update();
				if (ModelsManager.instance != null && ModelsManager.instance.player != null && ModelsManager.instance.enemy != null) {
					ModelsManager.instance.updateModels();
				}
				shadowFormController.update();
			}
		}
		if (eventsEnabled) {
			battleEvents.throwEvents();
		}
	}

	public function battleEnable(isEnable:Bool):Void {
		battleEnabled = isEnable;
	}

	public function eventsEnable(isEnable:Bool):Void {
		eventsEnabled = isEnable;
	}

	public static function registerEventCallback(eventType:ETriggerEvents, handler:BattleEventArgs -> Void):Void {
		instance.battleEvents.registerEventCallback(eventType, handler);
	}

	public static function removeEventCallback(eventType:ETriggerEvents, handler:BattleEventArgs -> Void):Void {
		instance.battleEvents.removeEventCallback(eventType, handler);
	}

	public static function registerCallbackToAllEvents(handler:BattleEventArgs -> Void):Void {
		instance.battleEvents.registerCallbackToAllEvents(handler);
	}

	public static function throwEvent(args:BattleEventArgs):Void {
		if (instance != null && instance.eventsEnable) {
			instance.battleEvents.pushEvent(args);
		}
	}

	public static function pauseGame(pauseSounds:Bool = false):Void {
		GameTimeController.gameTimePause(pauseSounds);
		BattleKeyManager.pause();
		ModelsManager.instance.enableModelsColliders(false);
		ModelsManager.instance.setModelsRagdollSleepState(true, 0);
	}

	public static function resumeGame():Void {
		GameTimeController.gameTimeResume();
		AudioManager.instance.setPitch(1.0);
		BattleKeyManager.unpause();
		ModelsManager.instance.enableModelsColliders(true);
		ModelsManager.instance.setModelsRagdollSleepState(false, 0);
	}

	public static function systemPause():Void {
		GameTimeController.systemTimePause();
		BattleKeyManager.pause();
		ModelsManager.instance.enableModelsColliders(false);
		ModelsManager.instance.setModelsRagdollSleepState(true, 0);
	}

	public static function systemResume():Void {
		GameTimeController.systemTimeResume();
		BattleKeyManager.unpause();
		ModelsManager.instance.enableModelsColliders(true);
		ModelsManager.instance.setModelsRagdollSleepState(false, 0);
	}
}