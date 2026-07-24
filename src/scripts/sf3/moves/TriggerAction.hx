package scripts.sf3.moves;

import scripts.sf3.moves.ETriggerEvents;
import scripts.sf3.BattleEventArgs;
import scripts.sf3.gamemodels.Model;

class TriggerAction {

	public var name:String = "";
	public var actionType:Int = 0;

	public static function init():Void {
		// Initialize trigger actions
	}

	public function new(actionType:Int) {
		this.actionType = actionType;
	}

	public function apply(args:BattleEventArgs = null):Bool {
		// Apply the action
		return true;
	}

	public function applyWithData(data:Dynamic):Bool {
		// Apply with specific data
		return true;
	}

	public function close():Void {
		// Close/cleanup the action
	}
}

class TriggerActionAnimation extends TriggerAction {
	public var animationName:String = "";
	public var loop:Bool = false;
	public var speed:Float = 1.0;

	public function new() {
		super(1);
	}

	override function apply(args:BattleEventArgs):Bool {
		// Play animation on model
		var model = ModelsManager.instance?.player;
		if (model != null && model.modelAnimation != null) {
			// model.modelAnimation.play(new InfoAnimation(animationName), loop);
		}
		return true;
	}
}

class TriggerActionMove extends TriggerAction {
	public var targetPosition:Vector3;
	public var duration:Float = 1.0;

	public function new() {
		super(2);
	}

	override function apply(args:BattleEventArgs):Bool {
		// Move model to target position
		return true;
	}
}

class TriggerActionHit extends TriggerAction {
	public var damage:Float = 10.0;
	public var knockback:Bool = false;

	public function new() {
		super(3);
	}

	override function apply(args:BattleEventArgs):Bool {
		// Apply hit/damage
		if (args != null && args.ownerId == Model.ENEMY_ID) {
			ModelsManager.instance?.enemy?.takeDamage(damage);
		}
		return true;
	}
}

class TriggerActionSetAttribute extends TriggerAction {
	public var attributeName:String = "";
	public var value:Dynamic;

	public function new() {
		super(4);
	}

	override function apply(args:BattleEventArgs):Bool {
		// Set attribute on model
		GameVariables.addVariable(args.ownerId, attributeName, value);
		return true;
	}
}

class TriggerActionVariable extends TriggerAction {
	public var variableName:String = "";
	public var value:Dynamic;
	public var frames:Int = -1;

	public function new() {
		super(5);
	}

	override function apply(args:BattleEventArgs):Bool {
		GameVariables.addVariable(args.ownerId, variableName, value, frames);
		return true;
	}
}