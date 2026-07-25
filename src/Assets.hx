package;

import h2d.Tile;
import h2d.Bitmap;
import hxd.BitmapData;

class Assets {

	static var cache:Map<String, Tile> = new Map();
	static var pendingLoads:Map<String, Array<Tile->Void>> = new Map();

	public static function loadImage(path:String, onLoaded:Tile->Void):Void {
		if (cache.exists(path)) {
			onLoaded(cache.get(path));
			return;
		}
		var pending = pendingLoads.get(path);
		if (pending != null) {
			pending.push(onLoaded);
			return;
		}
		pendingLoads.set(path, [onLoaded]);
		var img = new js.html.Image();
		img.onload = function(_) {
			var canvas = js.Browser.document.createCanvasElement();
			canvas.width = img.width;
			canvas.height = img.height;
			var ctx = canvas.getContext2d();
			ctx.drawImage(img, 0, 0);
			var bmp = BitmapData.fromNative(ctx);
			var tile = Tile.fromBitmap(bmp);
			cache.set(path, tile);
			var callbacks = pendingLoads.get(path);
			pendingLoads.remove(path);
			for (cb in callbacks)
				cb(tile);
		};
		img.onerror = function(_) {
			trace('Failed to load image: $path');
		};
		img.src = path;
	}

	public static function getCached(path:String):Null<Tile> {
		return cache.get(path);
	}

}
