package Pages
{
	import Utils.*;
	
	import flash.display.*;
	import flash.events.*;
	import flash.text.*;
	
	public class _EndPage extends EndPage
	{
		public function _EndPage(w:int, h:int, score:int, dead:Boolean)
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
			(getChildAt(1) as TextField).selectable = false;
			(getChildAt(2) as TextField).selectable = false;
			//Button
			(getChildAt(3) as SimpleButton).addEventListener(MouseEvent.CLICK, BackButtonClicked);
			
			if(dead)
			{
				(getChildAt(2) as TextField).text="Game Over !";
				(getChildAt(1) as TextField).htmlText = "" +
					" You lost all your life with a score of " + score
					". Be careful of the Hammer or wait for its slowing down.\n";
			}
			else
			{
				(getChildAt(2) as TextField).text="Game End !";
				(getChildAt(1) as TextField).htmlText = "" +
					" You have scored " + score + ". And have made a MoChi of:";
				var mochiMade:MovieClip = null;
				if(score > 400)
					mochiMade = new MoChi_1();
				else if(score > 300)
					mochiMade = new MoChi_2();
				else if(score > 200)
					mochiMade = new MoChi_3();
				else if(score > 100)
					mochiMade = new MoChi_4();
				else
					mochiMade = new MoChi_5();
				mochiMade.width = 0.3 * width;
				mochiMade.height = 0.3 * height;
				addChild(mochiMade)
			}
			
			
		}
		
		public function BackButtonClicked(e:Event):void
		{
			Debugger.Print("BackButtonClicked:" + e.toString());
			var bButClickedEvent:MoChiEvent = new MoChiEvent(MoChiEvent.TRANSFER_PAGE);
			bButClickedEvent.SetToPage(MoChiEvent.TO_OP);
			bButClickedEvent.SetFromPage(MoChiEvent.FROM_END);
			dispatchEvent(bButClickedEvent);
		}
			
	}
}