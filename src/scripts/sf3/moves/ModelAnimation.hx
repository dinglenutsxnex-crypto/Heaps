package scripts.sf3.moves;

class ModelAnimation {

	public var infoAnimation:InfoAnimation;
	public var currentFrame:Int = 0;
	public var timeAccumulator:Float = 0.0;
	public var isPlaying:Bool = false;
	public var loop:Bool = false;
	public var speed:Float = 1.0;

	public function new(info:InfoAnimation = null) {
		this.infoAnimation = info;
	}

	public function play(info:InfoAnimation, loop:Bool = false):Void {
		this.infoAnimation = info;
		this.loop = loop;
		this.currentFrame = 0;
		this.timeAccumulator = 0.0;
		this.isPlaying = true;
	}

	public function stop():Void {
		this.isPlaying = false;
		this.currentFrame = 0;
		this.timeAccumulator = 0.0;
	}

	public function update(dt:Float):Void {
		if (!isPlaying || infoAnimation == null) return;

		timeAccumulator += dt * speed;
		var frameTime = infoAnimation.frameDuration;

		while (timeAccumulator >= frameTime) {
			timeAccumulator -= frameTime;
			currentFrame++;

			if (currentFrame >= infoAnimation.frames) {
				if (loop) {
					currentFrame = 0;
				} else {
					currentFrame = infoAnimation.frames - 1;
					isPlaying = false;
					break;
				}
			}

			// Check for events on this frame
			checkEvents(currentFrame);
		}
	}

	private function checkEvents(frame:Int):Void {
		if (infoAnimation.events != null) {
			for (trigger in infoAnimation.events) {
				if (trigger.priority >= 0) {
					// Trigger events based on frame
				}
			}
		}
	}

	public function getCurrentFrame():Int {
		return currentFrame;
	}

	public function isFinished():Bool {
		return !isPlaying && currentFrame >= infoAnimation.frames - 1;
	}
}