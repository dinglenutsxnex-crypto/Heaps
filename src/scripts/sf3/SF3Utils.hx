package scripts.sf3;

class SF3Utils {

	public static var isFinishPrePlayMode:Bool = false;

	public static function getPlayerTypeByName(name:String):EPlayerType {
		name = name.toLowerCase();
		switch (name) {
			case "me":
				return EPlayerType.This;
			case "enemy":
				return EPlayerType.Enemy;
			case "parent":
				return EPlayerType.Parent;
			case "both":
				return EPlayerType.Both;
			case "child":
				return EPlayerType.Child;
			default:
				return EPlayerType.None;
		}
	}

	public static function getSurfaceTypeByName(name:String):ESurfaceType {
		name = name.toLowerCase();
		switch (name) {
			case "ground":
				return ESurfaceType.Ground;
			case "metal":
				return ESurfaceType.Metal;
			case "stone":
				return ESurfaceType.Stone;
			case "wood":
				return ESurfaceType.Wood;
			default:
				return ESurfaceType.None;
		}
	}

	public static function tryParseEnum<T>(key:String, defaultValue:T):T {
		try {
			return Type.createEnum(Type.getClass(defaultValue), key, []);
		} catch (e:Dynamic) {
			return defaultValue;
		}
	}

	public static function tryParseBattleIdentifier(id:String):Null<Array<Int>> {
		if (id == null || id == "") {
			return null;
		}
		var parts = id.split(".");
		if (parts.length >= 2) {
			var fightIdUsedInYaml = Std.parseInt(parts[1]);
			var fightIdToUseInSolution = fightIdUsedInYaml - 1;
			return [Std.parseInt(parts[0]), fightIdToUseInSolution];
		}
		return null;
	}

	public static function getFightIdToUseInYaml(fightIdUsedInSolution:Int):Int {
		return fightIdUsedInSolution + 1;
	}

	public static function secondsToFrames(seconds:Float, targetFramerate:Int = 60):Int {
		return Std.int(seconds * targetFramerate);
	}

	public static function secondsToFramesInt(seconds:Int, targetFramerate:Int = 60):Int {
		return seconds * targetFramerate;
	}

	public static function framesToSeconds(frames:Int, targetFramerate:Int = 60):Float {
		return frames / targetFramerate;
	}
}