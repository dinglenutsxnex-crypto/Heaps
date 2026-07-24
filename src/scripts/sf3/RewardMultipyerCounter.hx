package scripts.sf3;

class RewardMultipyerCounter {

	public static var instance:RewardMultipyerCounter;

	public function new() {
		instance = this;
	}

	public function printAllData(label:String):Void {
		trace(label + ": RewardMultipyerCounter data");
	}

	public function clear():Void {
		// Clear counters
	}
}