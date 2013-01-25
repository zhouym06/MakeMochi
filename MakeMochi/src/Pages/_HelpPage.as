package Pages
{
	import flash.display.*;
	import flash.events.*;
	import flash.text.*;
	import Utils.*;
	
	public class _HelpPage extends HelpPage
	{

		public function _HelpPage(w:int, h:int)
		{
			super();
			width  = w;
			height = h;
			x = w / 2;
			y = h / 2;
			
			
			Debugger.Print("");
			for(var i:int = 0; i < 4; i++)
			{
				Debugger.Append(i + ":" + (getChildAt(i)).toString() + "\n");
			}
			//Text
			(getChildAt(1) as TextField).autoSize="left";
			(getChildAt(1) as TextField).wordWrap=true;
			(getChildAt(1) as TextField).multiline=true;
			(getChildAt(1) as TextField).htmlText = " Click the motar to roll over the rice with wet hand. Watch out for the Hammers. " + 
				"If you are hit by the hammer, you will lose health. " +
					"But if you roll the rice at the right time, you will earn points." +
					"Win more points and health point by Combo. " +
					"But the hammer speed will also go up when you are comboing.";
			(getChildAt(1) as TextField).selectable = false;
			//(getChildAt(2) as TextField).selectable = false;
			//Button
			getChildAt(3).addEventListener(MouseEvent.CLICK, BackButtonClicked);
			
		}
		public function BackButtonClicked(e:Event):void
		{
			Debugger.Print("BackButtonClicked:" + e.toString());
			var bButClickedEvent:MoChiEvent = new MoChiEvent(MoChiEvent.TRANSFER_PAGE);
			bButClickedEvent.SetToPage(MoChiEvent.TO_GAME);
			bButClickedEvent.SetFromPage(MoChiEvent.FROM_HELP);
			dispatchEvent(bButClickedEvent);
		}
	}
}