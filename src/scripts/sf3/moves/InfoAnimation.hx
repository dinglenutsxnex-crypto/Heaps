package scripts.sf3.moves;

class InfoAnimation {

	public var name:String = "";
	public var fileName:String = "";
	public var frames:Int = 0;
	public var frameDuration:Float = 1.0 / 60.0;
	public var loops:Bool = false;
	public var events:Array<InfoTrigger> = [];
	public var sounds:Array<Dynamic> = [];

	public function new(name:String = "") {
		this.name = name;
	}

	public function hasEvent(eventType:ETriggerEvents, args:Array<Dynamic>):InfoTrigger {
		for (trigger in events) {
			if (trigger.eventType == eventType) {
				return trigger;
			}
		}
		return null;
	}
}

class InfoTrigger {
	public var name:String = "";
	public var priority:Int = 0;
	public var eventType:ETriggerEvents;
	public var conditions:Array<Condition> = [];
	public var actions:Array<Dynamic> = [];
	public var allowInFight:Bool = true;

	public function new(name:String = "") {
		this.name = name;
	}

	public function hasEvent(e:ETriggerEvents, args:Array<Dynamic>):InfoTrigger {
		if (this.eventType == e) {
			return this;
		}
		return null;
	}

	public function isEqualConditions():Bool {
		for (condition in conditions) {
			if (!condition.check()) {
				return false;
			}
		}
		return true;
	}
}