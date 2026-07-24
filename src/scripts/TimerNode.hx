package scripts;

class TimerNode {

	public var name:String;
	public var parent:TimerNode;

	public function new(name:String) {
		this.name = name;
	}

	public static function clear():Void {
	}

	public static function setParent(parent:TimerNode):Void {
	}

	public static function logHierarchy():Void {
	}
}
