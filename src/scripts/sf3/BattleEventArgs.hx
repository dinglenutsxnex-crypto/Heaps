package scripts.sf3;

import scripts.sf3.moves.ETriggerEvents;

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