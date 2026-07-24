package scripts.sf3.gamemodels;

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

	public static function euler(euler:Vector3):Quaternion {
		var cy = Math.cos(euler.z * 0.5);
		var sy = Math.sin(euler.z * 0.5);
		var cp = Math.cos(euler.y * 0.5);
		var sp = Math.sin(euler.y * 0.5);
		var cr = Math.cos(euler.x * 0.5);
		var sr = Math.sin(euler.x * 0.5);

		return new Quaternion(
			sr * cp * cy - cr * sp * sy,
			cr * sp * cy + sr * cp * sy,
			cr * cp * sy - sr * sp * cy,
			cr * cp * cy + sr * sp * sy
		);
	}

	public function multiply(q:Quaternion):Quaternion {
		return new Quaternion(
			w * q.x + x * q.w + y * q.z - z * q.y,
			w * q.y - x * q.z + y * q.w + z * q.x,
			w * q.z + x * q.y - y * q.x + z * q.w,
			w * q.w - x * q.x - y * q.y - z * q.z
		);
	}

	public function toString():String {
		return 'Quaternion($x, $y, $z, $w)';
	}
}