package scripts.sf3;

import haxe.ds.IntMap;
import haxe.ds.StringMap;

class GameVariables {

	public static function clearGameVariables():Void {
		inGameVariables = new IntMap<IntMap<LocalVariable>>();
		variablesToCheck = new IntMap<IntMap<Array<Int -> String -> Void>>>();
	}

	public static function update():Void {
		for (ownerEntry in inGameVariables) {
			var ownerId = ownerEntry._1;
			var variables = ownerEntry._2;
			var keysToRemove = [];
			for (key in variables.keys()) {
				var variable = variables.get(key);
				if (variable.update()) {
					// BattleController.ThrowEvent(new BattleEventArgs(ETriggerEvents.EVENT_VARIABLE_DESTRUCTION, ownerId, key));
					keysToRemove.push(key);
				}
			}
			for (key in keysToRemove) {
				variables.remove(key);
			}
		}
	}

	public static function addVariable(ownerID:Int, variableName:String, variableValue:Dynamic, variableFrames:Int = -1):Void {
		if (!inGameVariables.exists(ownerID)) {
			inGameVariables.set(ownerID, new StringMap<LocalVariable>());
		}
		var ownerVars = inGameVariables.get(ownerID);
		if (ownerVars.exists(variableName)) {
			ownerVars.get(variableName).setValue(variableValue);
			ownerVars.get(variableName).setFrames(variableFrames);
		} else {
			ownerVars.set(variableName, new LocalVariable(variableName, variableValue, variableFrames));
		}
		variableChanged(ownerID, variableName);
	}

	private static function variableChanged(ownerId:Int, variableName:String):Void {
		if (!variablesToCheck.exists(ownerId) || !variablesToCheck.get(ownerId).exists(variableName)) {
			return;
		}
		var handlers = variablesToCheck.get(ownerId).get(variableName);
		for (handler in handlers) {
			handler(ownerId, variableName);
		}
	}

	public static function addVariableGlobal(variableName:String, variableValue:Dynamic, frames:Int = -1):Void {
		addVariable(-1, variableName, variableValue, frames);
	}

	public static function removeVariable(ownerID:Int, variableName:String):Void {
		if (inGameVariables.exists(ownerID) && inGameVariables.get(ownerID).exists(variableName)) {
			inGameVariables.get(ownerID).remove(variableName);
		}
	}

	public static function getVariable(ownerModel:Int, nameVal:String):Null<LocalVariable> {
		if (inGameVariables.exists(ownerModel) && inGameVariables.get(ownerModel).exists(nameVal)) {
			return inGameVariables.get(ownerModel).get(nameVal);
		}
		return null;
	}

	public static function getVariableGlobal(nameVal:String):Null<LocalVariable> {
		return getVariable(-1, nameVal);
	}

	public static function getVariablesByOwner(ownerModel:Int):Array<LocalVariable> {
		var list = [];
		if (inGameVariables.exists(ownerModel)) {
			for (variable in inGameVariables.get(ownerModel)) {
				list.push(variable);
			}
		}
		return list;
	}

	public static function subscribe(ownerID:Int, varName:String, handler:Int -> String -> Void):Void {
		if (!variablesToCheck.exists(ownerID)) {
			variablesToCheck.set(ownerID, new StringMap<Array<Int -> String -> Void>>());
		}
		if (!variablesToCheck.get(ownerID).exists(varName)) {
			variablesToCheck.get(ownerID).set(varName, []);
		}
		variablesToCheck.get(ownerID).get(varName).push(handler);
	}

	public static function unsubscribe(ownerID:Int, varName:String, handler:Int -> String -> Void):Void {
		if (variablesToCheck.exists(ownerID) && variablesToCheck.get(ownerID).exists(varName)) {
			var handlers = variablesToCheck.get(ownerID).get(varName);
			handlers.remove(handler);
		}
	}

	private static var inGameVariables:IntMap<StringMap<LocalVariable>> = new IntMap<StringMap<LocalVariable>>();

	private static var variablesToCheck:IntMap<StringMap<Array<Int -> String -> Void>>> = new IntMap<StringMap<Array<Int -> String -> Void>>>();
}

class LocalVariable {

	public var name:String;

	private var _frames:Int;

	private var timeDelta:Float;

	public var value:Dynamic;

	public var frames(get, set):Int;

	public function new(name:String, value:Dynamic, frames:Int = -1) {
		this.value = value;
		this.frames = frames;
		timeDelta = 1.0;
		this.name = name;
	}

	private function get_frames():Int {
		return _frames;
	}

	private function set_frames(value:Int):Int {
		if (value < -1) {
			value = -1;
		}
		_frames = value;
		return value;
	}

	public function update():Bool {
		if (frames == -1) {
			return false;
		}
		timeDelta -= GameTimeController.timeScale;
		if (timeDelta <= 0.0) {
			timeDelta = 1.0;
			frames--;
		}
		if (frames <= 0) {
			return true;
		}
		return false;
	}

	public function setValue(newValue:Dynamic):Void {
		value = newValue;
	}

	public function setFrames(newFrames:Int):Void {
		frames = newFrames;
	}

	public function toString():String {
		return 'Variable name: [${name}], Value: [${value}], Frames: [${frames}]';
	}
}
