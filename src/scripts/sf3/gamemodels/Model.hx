package scripts.sf3.gamemodels;

import scripts.sf3.moves.ModelAnimation;
import scripts.sf3.moves.ModelInfoAnimation;
import scripts.sf3.moves.MovesController;
import scripts.sf3.gamemodels.ModelInfo;

class Model {

	public static var PLAYER_ID = 1;
	public static var ENEMY_ID = 2;

	public var id:Int;
	public var modelInfo:ModelInfo;
	public var modelComponents:ModelComponents;
	public var enemy:Model;
	public var parentModel:Model;
	public var childModels:Array<Model>;
	public var modelAnimation:ModelAnimation;
	public var isPlayer:Bool = false;
	public var isControl:Bool = false;
	public var hp:Float = 100.0;
	public var maxHp:Float = 100.0;
	public var position:Vector3;
	public var rotation:Quaternion;
	public var scale:Vector3;

	private var nextModelIDGlobal:Int = 100;

	public function new(modelInfo:ModelInfo, isPlayer:Bool = false) {
		this.modelInfo = modelInfo;
		this.isPlayer = isPlayer;
		this.id = isPlayer ? PLAYER_ID : ENEMY_ID;
		this.modelComponents = new ModelComponents(this);
		this.modelAnimation = new ModelAnimation();
		this.childModels = [];
		this.position = new Vector3();
		this.rotation = new Quaternion();
		this.scale = new Vector3(1, 1, 1);
	}

	public function initialize():Void {
		// Initialize model
	}

	public function update(dt:Float):Void {
		if (modelAnimation != null) {
			modelAnimation.update(dt);
		}
	}

	public function setEnemy(enemy:Model):Void {
		this.enemy = enemy;
	}

	public function getHitResult():HitResult {
		return HitResult.current;
	}

	public function takeDamage(amount:Float):Void {
		hp -= amount;
		if (hp < 0) hp = 0;
	}

	public function heal(amount:Float):Void {
		hp += amount;
		if (hp > maxHp) hp = maxHp;
	}

	public function isAlive():Bool {
		return hp > 0;
	}
}

class Vector3 {
	public var x:Float = 0.0;
	public var y:Float = 0.0;
	public var z:Float = 0.0;

	public function new(x:Float = 0.0, y:Float = 0.0, z:Float = 0.0) {
		this.x = x;
		this.y = y;
		this.z = z;
	}

	public static function zero():Vector3 {
		return new Vector3(0, 0, 0);
	}
}

class Quaternion {
	public var x:Float = 0.0;
	public var y:Float = 0.0;
	public var z:Float = 0.0;
	public var w:Float = 1.0;

	public function new(x:Float = 0.0, y:Float = 0.0, z:Float = 0.0, w:Float = 1.0) {
		this.x = x;
		this.y = y;
		this.z = z;
		this.w = w;
	}

	public static function identity():Quaternion {
		return new Quaternion(0, 0, 0, 1);
	}
}

class HitResult {
	public static var current:HitResult;

	public var damage:Float = 0.0;
	public var hitType:String = "";
	public var hitPosition:Vector3;

	public function new() {
		hitPosition = new Vector3();
	}
}

class ModelComponents {
	public var model:Model;
	public var capsuleSystem:ModelCapsules;
	public var collision:ModelCollision;
	public var skeleton:SkeletonObject;

	public function new(model:Model) {
		this.model = model;
		this.capsuleSystem = new ModelCapsules();
		this.collision = new ModelCollision();
		this.skeleton = new SkeletonObject();
	}
}

class ModelCapsules {
	public function new() {
	}

	public function update():Void {
		// Update capsules
	}
}

class ModelCollision {
	public function new() {
	}

	public function update():Void {
		// Update collision
	}
}

class SkeletonObject {
	public var bones:Array<Bone>;

	public function new() {
		bones = [];
	}
}

class Bone {
	public var name:String = "";
	public var parent:Bone;
	public var children:Array<Bone>;
	public var position:Vector3;
	public var rotation:Quaternion;

	public function new() {
		children = [];
		position = new Vector3();
		rotation = Quaternion.identity();
	}
}