package scripts.sf3.moves;

class MovesController {

	public static var instance:MovesController;

	private var moves:Map<String, Dynamic> = new Map<String, Dynamic>();

	public function new() {
		instance = this;
	}

	public static function init():Void {
		if (instance == null) {
			instance = new MovesController();
		}
	}

	public function getMove(moveName:String):Dynamic {
		return moves.get(moveName);
	}

	public function registerMove(name:String, moveData:Dynamic):Void {
		moves.set(name, moveData);
	}

	public function playMove(model:Dynamic, moveName:String):Bool {
		var move = getMove(moveName);
		if (move != null) {
			// Play move on model
			return true;
		}
		return false;
	}

	public function update(dt:Float):Void {
		// Update active moves
	}
}