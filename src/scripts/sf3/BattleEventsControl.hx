package scripts.sf3;

import scripts.sf3.moves.ETriggerEvents;

class BattleEventsControl {

	public static var instance:BattleEventsControl;

	private var callbacks:Map<ETriggerEvents, Array<BattleEventArgs -> Void>> = new Map<ETriggerEvents, Array<BattleEventArgs -> Void>>();

	private var eventQueue:Array<BattleEventArgs> = [];

	public function new() {
		instance = this;
	}

	public static function initialize():Void {
		if (instance == null) {
			instance = new BattleEventsControl();
		}
	}

	public function clearEvents():Void {
		eventQueue = [];
	}

	public function registerEventCallback(eventType:ETriggerEvents, handler:BattleEventArgs -> Void):Void {
		if (!callbacks.exists(eventType)) {
			callbacks.set(eventType, []);
		}
		callbacks.get(eventType).push(handler);
	}

	public function removeEventCallback(eventType:ETriggerEvents, handler:BattleEventArgs -> Void):Void {
		if (callbacks.exists(eventType)) {
			var handlers = callbacks.get(eventType);
			handlers.remove(handler);
		}
	}

	public function registerCallbackToAllEvents(handler:BattleEventArgs -> Void):Void {
		for (eventType in callbacks.keys()) {
			callbacks.get(eventType).push(handler);
		}
	}

	public function pushEvent(args:BattleEventArgs):Void {
		eventQueue.push(args);
	}

	public function throwEvents():Void {
		for (args in eventQueue) {
			if (callbacks.exists(args.eventType)) {
				for (handler in callbacks.get(args.eventType)) {
					handler(args);
				}
			}
		}
		eventQueue = [];
	}

	public function update():Void {
		throwEvents();
	}
}

class BattleEventArgs {
	public var eventType:ETriggerEvents;
	public var ownerId:Int;
	public var eventData:Dynamic;

	public function new(eventType:ETriggerEvents, ownerId:Int, eventData:Dynamic) {
		this.eventType = eventType;
		this.ownerId = ownerId;
		this.eventData = eventData;
	}
}