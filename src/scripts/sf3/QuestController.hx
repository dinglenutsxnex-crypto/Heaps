package scripts.sf3;

import scripts.sf3.moves.ETriggerEvents;

class QuestController {

	public static var instance:QuestController;

	private var queueTriggers:Array<Dynamic> = [];

	public function new() {
		instance = this;
	}

	public function init():Void {
		// Initialize quest controller
	}

	public function throwEvent(e:ETriggerEvents, args:Array<Dynamic> = null):Bool {
		// Throw quest event
		return false;
	}

	public function runForciblyQueue():Void {
		// Run forcibly queue
	}

	public function isQueueEmpty():Bool {
		return queueTriggers.length == 0;
	}

	public function forciblySetQueue(userQuests:Array<String>):Void {
		// Set queue from user quests
	}

	public function cleanQueueTriggers():Void {
		queueTriggers = [];
	}

	public function getEventArgument(name:String, field:String):Dynamic {
		return null;
	}
}