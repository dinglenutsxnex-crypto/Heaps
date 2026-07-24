package scripts.sf3.moves;

class Condition {

	public var conditionType:String = "";
	public var parameters:Map<String, Dynamic> = new Map<String, Dynamic>();

	public static function init():Void {
		// Initialize condition system
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
		// Check health condition
		return true;
	}

	private function checkDistance():Bool {
		// Check distance condition
		return true;
	}

	private function checkTime():Bool {
		// Check time condition
		return true;
	}

	private function checkVariable():Bool {
		// Check game variable condition
		return true;
	}

	public static function parse(conditionData:Dynamic):Condition {
		var condition = new Condition();
		if (conditionData.conditionType != null) {
			condition.conditionType = conditionData.conditionType;
		}
		if (conditionData.parameters != null) {
			for (key in conditionData.parameters.keys()) {
				condition.parameters.set(key, conditionData.parameters.get(key));
			}
		}
		return condition;
	}
}