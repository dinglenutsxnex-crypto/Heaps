package scripts.sf3.moves;

import scripts.sf3.moves.ETriggerEvents;
import scripts.sf3.BattleEventArgs;
import scripts.sf3.gamemodels.Model;

class TriggerEvent {

	public var name:String = "";
	public var playerType:EPlayerType = EPlayerType.Both;
	public var type:ETriggerEvents;
	public var arguments:Array<Dynamic>;

	public static function init():Void {
		// Initialize trigger events
	}

	public function new(type:ETriggerEvents) {
		this.type = type;
		playerType = EPlayerType.Both;
		name = "";
	}

	public function equal(args:BattleEventArgs):Bool {
		if (args == null) return false;
		
		switch (playerType) {
			case EPlayerType.This:
				return args.ownerId == Model.PLAYER_ID;
			case EPlayerType.Enemy:
				return args.ownerId == Model.ENEMY_ID;
			case EPlayerType.Parent:
				// Check parent model
				return true;
			case EPlayerType.Child:
				// Check child models
				return true;
			case EPlayerType.Both:
				return true;
			default:
				return false;
		}
	}

	public function equalArguments(args:Array<Dynamic>):Bool {
		arguments = args;
		return equal(null);
	}

	public function getArgument(field:String):Dynamic {
		if (arguments != null && arguments.length > 0) {
			// Try to get argument by field name
			return arguments[0];
		}
		return null;
	}

	public static function getEventTypeByName(name:String):ETriggerEvents {
		var values = Type.enumValues(ETriggerEvents);
		for (event in values) {
			if (event.toString() == name) {
				return event;
			}
		}
		return ETriggerEvents.EVENT_NONE;
	}
}

enum EPlayerType {
	None;
	This;
	Enemy;
	Parent;
	Both;
	Child;
}