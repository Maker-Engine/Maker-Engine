package engine;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.Lib;

class Engine extends Sprite
{
	public static var instance:Engine;

	// =========================
	// Engine State
	// =========================

	public var paused:Bool = false;
	public var started:Bool = false;

	// =========================
	// Timing
	// =========================

	private var lastTime:Float = 0;
	public var deltaTime:Float = 0;
	public var elapsedTime:Float = 0;

	// =========================
	// Scene
	// =========================

	private var currentScene:Sprite;

	public function new()
	{
		super();

		instance = this;

		addEventListener(Event.ADDED_TO_STAGE, init);
	}

	// =========================
	// Initialization
	// =========================

	private function init(e:Event):Void
	{
		removeEventListener(Event.ADDED_TO_STAGE, init);

		lastTime = Lib.getTimer();
		startEngine();
	}

	private function startEngine():Void
	{
		started = true;

		trace("Maker Engine started.");

		addEventListener(Event.ENTER_FRAME, gameLoop);
	}

	// =========================
	// Game Loop
	// =========================

	private function gameLoop(e:Event):Void
	{
		var now = Lib.getTimer();

		deltaTime = (now - lastTime) / 1000;
		lastTime = now;

		if (!paused)
		{
			update(deltaTime);
		}

		render();
	}

	// =========================
	// Update
	// =========================

	public function update(dt:Float):Void
	{
		elapsedTime += dt;

		if (currentScene != null)
		{
			if (Reflect.hasField(currentScene, "update"))
			{
				Reflect.callMethod(currentScene, Reflect.field(currentScene, "update"), [dt]);
			}
		}
	}

	// =========================
	// Render
	// =========================

	public function render():Void
	{
		if (currentScene != null)
		{
			if (Reflect.hasField(currentScene, "render"))
			{
				Reflect.callMethod(currentScene, Reflect.field(currentScene, "render"), []);
			}
		}
	}

	// =========================
	// Scene System
	// =========================

	public function setScene(scene:Sprite):Void
	{
		if (currentScene != null)
		{
			removeChild(currentScene);

			if (Reflect.hasField(currentScene, "destroy"))
			{
				Reflect.callMethod(currentScene, Reflect.field(currentScene, "destroy"), []);
			}
		}

		currentScene = scene;

		if (currentScene != null)
		{
			addChild(currentScene);

			if (Reflect.hasField(currentScene, "create"))
			{
				Reflect.callMethod(currentScene, Reflect.field(currentScene, "create"), []);
			}
		}
	}

	// =========================
	// Engine Control
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