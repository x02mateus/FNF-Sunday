package;

import flixel.*;
import flixel.FlxSprite;

/**
 * ...
 * @author ...
 */
class WarningState extends MusicBeatState
{
	public function new()
	{
		super();
	}

	override public function create():Void
	{
		super.create();

		var warning:FlxSprite = new FlxSprite(0, 0);
		warning.loadGraphic(Paths.image("SEZ_WARN.png"));
		warning.moves = false;
		warning.antialiasing = false;
		warning.setGraphicSize(Std.int(FlxG.width), Std.int(FlxG.height));
		add(warning);
	}

	public override function update(elapsed)
	{
		#if mobile
		var justTouched:Bool = false;

		for (touch in FlxG.touches.list)
		{
			justTouched = false;
			
			if (touch.justReleased){
				justTouched = true;
			}
		}
		#end
		if (FlxG.keys.justPressed.ENTER #if mobile || justTouched #end)
		{
			PlayState.anti_seizure = false;
			FlxG.save.data.flashing = true;
			FlxG.switchState(new TitleState());
		}
		if (FlxG.keys.justPressed.BACKSPACE #if android || FlxG.android.justReleased.BACK #end)
		{
			PlayState.anti_seizure = true;
			FlxG.save.data.flashing = false;
			FlxG.switchState(new TitleState());
		}
		super.update(elapsed);
	}
}
