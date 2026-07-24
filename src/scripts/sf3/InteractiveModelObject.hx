package scripts.sf3;

class InteractiveModelObject {

	public static var droppedInteractiveObjects:Array<Dynamic> = [];

	public var modelObject:Dynamic;

	public static function hideAll():Void {
		// Hide all interactive objects
	}

	public static function reset():Void {
		droppedInteractiveObjects = [];
	}
}