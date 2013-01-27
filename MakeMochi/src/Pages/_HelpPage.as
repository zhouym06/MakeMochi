package Pages
{
	import Utils.*;
	
	import flash.display.*;
	import flash.events.*;
	import flash.text.*;
	
	public class _HelpPage extends InfoPage
	{

		private var _fromPage:String = null;
		public function _HelpPage(w:int, h:int, fromPage:String)
		{
			super();
			_fromPage = fromPage;
			width  = w;
			height = h;
			x = w / 2;
			y = h / 2;
			
			
			Debugger.Print(fromPage + "\n");
			for(var i:int = 0; i < 4; i++)
			{
				Debugger.Append(i + ":" + (getChildAt(i)).toString() + "\n" );
			}
			
			//Title
			(getChildAt(2) as TextField).text = "How to Play";
			(getChildAt(2) as TextField).selectable = false;
			(getChildAt(2) as TextField).autoSize = "center";
			//Text
			(getChildAt(1) as TextField).autoSize="left";
			(getChildAt(1) as TextField).wordWrap=true;
			(getChildAt(1) as TextField).multiline=true;
			(getChildAt(1) as TextField).htmlText = "" +
				"    Click the motar to knead the rice with wet hand. Watch out for the Hammers. " + 
				"Health will be lost if you are hit by the hammer.\n" +
				"    But if you knead the rice at the right time, you will earn points. " +
				"Win more points and health point by Combo. " +
				"But the hammer speed will also go up when you are comboing.\n" +
				"    More Point will lead to the possibility of a better Mochi. Your record will be stored automatically." +
				" Fight on to collect all the delicious Mochis!";
			
			(getChildAt(1) as TextField).selectable = false;
			//(getChildAt(2) as TextField).selectable = false;
			//Button
			getChildAt(3).addEventListener(MouseEvent.CLICK, BackButtonClicked);
			
		}
		public function setFrom(s:String):void
		{
			_fromPage = s;
		}
		public function BackButtonClicked(e:Event):void
		{
			Debugger.Print("BackButtonClicked:" + e.toString());
			var bButClickedEvent:MoChiEvent = new MoChiEvent(MoChiEvent.TRANSFER_PAGE);
			bButClickedEvent.SetToPage(MoChiEvent.TO_GAME);
			bButClickedEvent.SetFromPage(_fromPage);
			dispatchEvent(bButClickedEvent);
			Sounds.PlayHaiYouSound();
		}
	}
}