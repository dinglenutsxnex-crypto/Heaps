package scripts.sf3.moves;

class Condition {

	public var conditionType:String = "";
	public var parameters:Map<String, Dynamic> = new Map<String, Dynamic>();

	public function new() {
	}

	public static function init():Void {
	}

	public function check():Bool {
		switch (conditionType) {
			case "Health":
				return checkHealth();
			case "Distance":
				return checkDistance();
			case "Time":
				return checkTime();
			case "Variable":
				return checkVariable();
			default:
				return true;
		}
	}

	private function checkHealth():Bool {
		return true;
	}

	private function checkDistance():Bool {
		return true;
	}

	private function checkTime():Bool {
		return true;
	}

	private function checkVariable():Bool {
		return true;
	}

	public static function parse(conditionData:Dynamic):Condition {
		var condition = new Condition();
		if (conditionData.conditionType != null) {
			condition.conditionType = conditionData.conditionType;
		}
		if (conditionData.parameters != null) {
			var params:Dynamic = conditionData.parameters;
			Reflect.callMethod(params, Reflect.field(params, "keys"), []);
			var keyIter:Iterator<String> = Reflect.field(params, "keys")();
			for (key in keyIter) {
				condition.parameters.set(key, Reflect.field(params, key));
			}
		}
		return condition;
	}
}