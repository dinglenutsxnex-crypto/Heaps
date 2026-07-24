package scripts.sf3;

import scripts.sf3.moves.ETriggerEvents;

class BattleEventsControl {

	public static var instance:BattleEventsControl;

	private var eventCallbacks:Map<ETriggerEvents, Array<BattleEventArgs -> Void>> = new Map<ETriggerEvents, Array<BattleEventArgs -> Void>>();
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

	public function registerEventCallback(eventType:ETriggerEvents, handler:BattleEventArgs -> Void):Void {
		if (!eventCallbacks.exists(eventType)) {
			eventCallbacks.set(eventType, []);
		}
		eventCallbacks.get(eventType).push(handler);
	}

	public function removeEventCallback(eventType:ETriggerEvents, handler:BattleEventArgs -> Void):Void {
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

class BattleEventArgs {

	public var eventType:ETriggerEvents;
	public var ownerId:Int;
	public var eventData:Dynamic;

	public function new(eventType:ETriggerEvents, ownerId:Int, eventData:Dynamic = null) {
		this.eventType = eventType;
		this.ownerId = ownerId;
		this.eventData = eventData;
	}
}