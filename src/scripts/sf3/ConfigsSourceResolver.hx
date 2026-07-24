package scripts.sf3;

class ConfigsSourceResolver {

	public static var proxyObject:Dynamic;

	public static function init(proxy:Dynamic):Void {
		proxyObject = proxy;
	}

	public static var Quests:String = "";
}