package scripts.sf3.gamemodels;

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

	public static function one():Vector3 {
		return new Vector3(1, 1, 1);
	}

	public static function up():Vector3 {
		return new Vector3(0, 1, 0);
	}

	public static function down():Vector3 {
		return new Vector3(0, -1, 0);
	}

	public static function left():Vector3 {
		return new Vector3(-1, 0, 0);
	}

	public static function right():Vector3 {
		return new Vector3(1, 0, 0);
	}

	public static function forward():Vector3 {
		return new Vector3(0, 0, 1);
	}

	public static function back():Vector3 {
		return new Vector3(0, 0, -1);
	}

	public function add(v:Vector3):Vector3 {
		return new Vector3(x + v.x, y + v.y, z + v.z);
	}

	public function sub(v:Vector3):Vector3 {
		return new Vector3(x - v.x, y - v.y, z - v.z);
	}

	public function mul(scalar:Float):Vector3 {
		return new Vector3(x * scalar, y * scalar, z * scalar);
	}

	public function div(scalar:Float):Vector3 {
		return new Vector3(x / scalar, y / scalar, z / scalar);
	}

	public function dot(v:Vector3):Float {
		return x * v.x + y * v.y + z * v.z;
	}

	public function length():Float {
		return Math.sqrt(x * x + y * y + z * z);
	}

	public function normalized():Vector3 {
		var len = length();
		if (len > 0) {
			return div(len);
		}
		return new Vector3();
	}

	public function toString():String {
		return 'Vector3($x, $y, $z)';
	}
}