package;
import flixel.FlxSprite;
import flixel.*;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import ui.FlxVirtualPad;

/**
 * ...
 * @author ...
 */
class WarningState extends FlxState
{
	var virtualpad:FlxVirtualPad;

	public function new() 
	{
		super();
	}
	
	override public function create():Void 
	{
		super.create();
		
		
		var warning:FlxSprite = new FlxSprite(0, 0);
		warning.loadGraphic("assets/images/SEZ_WARN.png", false, 1280, 720);
		add(warning);

		virtualpad = new FlxVirtualPad(NONE, A_B);
		add(virtualpad);
	}
	public override function update(elapsed){
		
		
		if (virtualpad.buttonA.justPressed){
			PlayState.anti_seizure = false;
			FlxG.save.data.flashing = true;
			FlxG.switchState(new TitleState());
		}
		if (virtualpad.buttonA.justPressed){
			PlayState.anti_seizure = true;
			FlxG.save.data.flashing = false;
			FlxG.switchState(new TitleState());
		}
		super.update(elapsed);
	}
	
}