package scripts.sf3.gamemodels;

import scripts.sf3.moves.ModelInfoAnimation;

class ModelInfo {
	public var name:String = "";
	public var modelType:ModelType;
	public var animations:Map<String, ModelInfoAnimation>;

	public function new() {
		animations = new Map<String, ModelInfoAnimation>();
	}
}

enum ModelType {
	Player;
	Enemy;
	NPC;
}