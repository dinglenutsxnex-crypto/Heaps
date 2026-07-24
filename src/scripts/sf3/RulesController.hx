package scripts.sf3;

class RulesController {

	public static var instance:RulesController;

	public var clearRules:Void -> Void = function() {};

	public function new() {
		instance = this;
	}

	public function initialize(fight:Dynamic, userModelInfo:Dynamic, warrior:Dynamic):Void {
		// Initialize rules
	}

	public function clearRules():Void {
		// Clear rules
		if (clearRules != null) clearRules();
	}

	public function hasActiveRule(ruleName:String):Bool {
		return false;
	}
}