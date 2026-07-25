package scripts.sf3;

import scripts.sf3.moves.ETriggerEvents;

class BattleEventsControl {

	public static var instance:BattleEventsControl;

	private var eventCallbacks:Map<Int, Array<BattleEventArgs -> Void>> = new Map<Int, Array<BattleEventArgs -> Void>>();
	private var allEventsCallbacks:Array<BattleEventArgs -> Void> = [];

	public function new() {
		instance = this;
	}

	public function initialize():Void {
		// Initialize battle events control
	}

	public function clearEvents():Void {
		eventCallbacks.clear();
		allEventsCallbacks = [];
	}

	public function registerEventCallback(eventType:Int, handler:BattleEventArgs -> Void):Void {
		if (!eventCallbacks.exists(eventType)) {
			eventCallbacks.set(eventType, []);
		}
		eventCallbacks.get(eventType).push(handler);
	}

	public function removeEventCallback(eventType:Int, handler:BattleEventArgs -> Void):Void {
		if (eventCallbacks.exists(eventType)) {
			var handlers = eventCallbacks.get(eventType);
			handlers.remove(handler);
		}
	}

	public function registerCallbackToAllEvents(handler:BattleEventArgs -> Void):Void {
		allEventsCallbacks.push(handler);
	}

	public function pushEvent(args:BattleEventArgs):Void {
		if (eventCallbacks.exists(args.eventType)) {
			for (handler in eventCallbacks.get(args.eventType)) {
				handler(args);
			}
		}
		for (handler in allEventsCallbacks) {
			handler(args);
		}
	}

	public function throwEvents():Void {
		// Throw queued events
	}

	public function update():Void {
		// Update events
	}
}