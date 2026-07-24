package scripts.sf3;

class QuestController {

	public static var instance:QuestController;

	private var quests:Map<String, Dynamic> = new Map<String, Dynamic>();
	private var queueTriggers:Array<Dynamic> = [];
	private var queueActions:Array<Dynamic> = [];
	private var triggerEvents:Map<ETriggerEvents, Dynamic> = new Map<ETriggerEvents, Dynamic>();

	public static function init():Void {
		if (instance == null) {
			instance = new QuestController();
		}
		instance.parse();
	}

	public static function clear():Void {
		instance = null;
	}

	private function parse():Void {
		// Parse quests from config
	}

	public function throwEvent(e:ETriggerEvents, args:Array<Dynamic>):Bool {
		var flag = false;
		// Check triggers for event
		runQueueTriggers();
		return flag;
	}

	public function runForciblyQueue():Void {
		runQueueTriggers(true);
	}

	public function isQueueEmpty():Bool {
		return queueTriggers.length == 0;
	}

	private function runQueueTriggers(forcibly:Bool = false):Void {
		if (queueTriggers.length > 0 && !isActiveActions()) {
			var num = forcibly ? 0 : getIndexTrigger();
			if (num > -1) {
				// Process trigger
				setQueueActions();
			}
		}
	}

	private function getIndexTrigger():Int {
		// Check if in fight mode
		return 0;
	}

	private function setQueueActions():Void {
		// Set up actions from current trigger
		runActions();
	}

	private function runActions():Void {
		if (queueActions.length > 0) {
			// Run first action
		} else {
			runQueueTriggers();
		}
	}

	public function closeAction(action:Dynamic):Void {
		// Close current action
		runActions();
	}

	public function callEvent(data:String):Void {
		throwEvent(ETriggerEvents.QEVENT_CALL, [data]);
	}

	private function isActiveActions():Bool {
		return queueActions.length > 0;
	}

	public function getEventArgument(name:String, field:String):Dynamic {
		var eventType = ETriggerEvents.QEVENT_CALL;
		return triggerEvents.exists(eventType) ? triggerEvents.get(eventType) : null;
	}
}