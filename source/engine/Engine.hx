package engine;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.Lib;

class Engine extends Sprite
{
	public static var instance:Engine;

	// Current Scene
	public var currentScene:Scene;

	// Time
	private var lastTime:Float = 0;
	public var deltaTime:Float = 0;

	// Engine State
	public var paused:Bool = false;

	public function new()
	{
		super();
		instance = this;

		lastTime = Lib.getTimer();
		addEventListener(Event.ENTER_FRAME, gameLoop);
	}

	// =========================
	// GAME LOOP
	// =========================

	private function gameLoop(e:Event):Void
	{
		var currentTime = Lib.getTimer();
		deltaTime = (currentTime - lastTime) / 1000;
		lastTime = currentTime;

		if (!paused)
		{
			update(deltaTime);
		}

		render();
	}

	// =========================
	// UPDATE
	// =========================

	public function update(elapsed:Float):Void
	{
		if (currentScene != null)
		{
			currentScene.update(elapsed);
		}
	}

	// =========================
	// RENDER
	// =========================

	public function render():Void
	{
		if (currentScene != null)
		{
			currentScene.render();
		}
	}

	// =========================
	// SCENE MANAGEMENT
	// =========================

	public function setScene(scene:Scene):Void
	{
		if (currentScene != null)
		{
			removeChild(currentScene);
			currentScene.destroy();
		}

		currentScene = scene;

		if (currentScene != null)
		{
			addChild(currentScene);
			currentScene.create();
		}
	}

	// =========================
	// ENGINE CONTROL
	// =========================

	public function pause():Void
	{
		paused = true;
	}

	public function resume():Void
	{
		paused = false;
	}

}
