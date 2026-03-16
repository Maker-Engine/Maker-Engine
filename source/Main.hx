package;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.Lib;
import openfl.display.StageAlign;
import openfl.display.StageScaleMode;

import maker.core.Engine;
import maker.core.Scene;

class Main extends Sprite
{
    public static var instance:Main;
    public static var engine:Engine;

    public function new()
    {
        super();
        instance = this;

        if (stage != null)
            init();
        else
            addEventListener(Event.ADDED_TO_STAGE, init);
    }

    private function init(?e:Event):Void
    {
        removeEventListener(Event.ADDED_TO_STAGE, init);

        setupStage();
        startEngine();
    }

    private function setupStage():Void
    {
        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.NO_SCALE;
        stage.frameRate = 60;
    }

    private function startEngine():Void
    {
        engine = new Engine();

        // Load first scene
        var startScene = new Scene();
        engine.setScene(startScene);

        addChild(engine);

        trace("Maker Engine started successfully.");
    }

}
