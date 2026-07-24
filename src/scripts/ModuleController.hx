package scripts;

class ModuleController {

	public static function init():Void {
		// Initialize module controller
		// Register modules: DojoInterface, Fight, Shop, Inventory, Map, BoosterpacksScreen
	}

	public static function goToModule(type:ELocationSceneModule, ?args:Array<Dynamic>):Void {
		// Navigate to a specific module
	}

	public static function goToDefault():Void {
		// Navigate to default module
	}
}

enum ELocationSceneModule {
	None;
	DojoInterface;
	Fight;
	Shop;
	Inventory;
	Map;
	BoosterpacksScreen;
}
