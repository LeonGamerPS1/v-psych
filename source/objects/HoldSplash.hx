package objects;

import shaders.RGBPalette;
import objects.NoteSplash;
import flixel.addons.effects.FlxSkewedSprite;

class HoldSplash extends AttachedSprite
{
	public var rgbShader:PixelSplashShaderRef;

	public function new(tracker:FlxSprite, ?noteData:Int = 0)
	{
		super('holdCoverRGB', 'holdCoverRGB', null, true);
		sprTracker = tracker;
		setState(END);
		xAdd = -108;
		yAdd = -97.5;

		rgbShader = new PixelSplashShaderRef();
		shader = rgbShader.shader;
        antialiasing = tracker.antialiasing;

		Note.initializeGlobalRGBShader(noteData % Note.colArray.length);

		rgbShader.copyValues(Note.globalRgbShaders[noteData % Note.colArray.length]);

		if (!PlayState.isPixelStage)
			rgbShader.pixelAmount = 1;
		else if (PlayState.isPixelStage)
		{
			xAdd -= 6 * 3;
			rgbShader.pixelAmount = 6;
		}
	}

	public function setState(st:HoldState)
	{
		visible = st == HOLD;
	}
}

enum HoldState
{
	HOLD;
	END;
}
