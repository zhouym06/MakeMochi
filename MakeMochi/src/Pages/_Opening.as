package Pages
{
	import Utils.*;
	
	import flash.display.*;
	import flash.events.*;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.text.*;
	
	import mx.managers.*;
//	import mx.managers.CursorManager;
	
	public class _Opening extends Opening
	{
		private var bgm:Sound = null;
		private var bgmChannel:SoundChannel = null;
		
		[Embed(source="Res/mallet_cursor.gif")]  
		private var hitCursor:Class;  
		
		public function _Opening(w:int, h:int)
		{
			super();
			width  = w * 1.27;		//because the Opening have component out of the border...
			height = h * 1.1;		//because the Opening have component out of the border...
			x = w / 2;				//both side are almost equally out of the border...
			y = h * 0.52;			//because the Opening have component out of the border...
			addEventListener(Event.ENTER_FRAME, OpeningEnd);
			bgm = Sounds.GetOpeningBGM();
			bgmChannel = bgm.play(0,int.MAX_VALUE);
		}
		public function OpeningEnd(e:Event):void
		{
			Debugger.Print(e.target.currentFrame + "/" + e.target.totalFrames);
			if(e.target.currentFrame == e.target.totalFrames)
			{
				e.target.stop();
				e.target.removeEventListener(Event.ENTER_FRAME, OpeningEnd);
				Debugger.Print("");
				for(var i:int = 0; i < 11; i++)
				{
					Debugger.Append(i + ":" + (getChildAt(i)).toString() + "\n");
				}
				
				//StartButton
				// todo?: use  (getChildByName("sButton") as SimpleButton) instead...I set Name In Flash CS4 but can't get here...
				getChildAt(10).addEventListener(MouseEvent.CLICK, StartButtonClicked);
				
				getChildAt(10).addEventListener(MouseEvent.MOUSE_OVER, ButtonOn);
				getChildAt(10).addEventListener(MouseEvent.MOUSE_OUT, ButtonOut);
				//AboutButton
				// todo?: use  (getChildByName("aButton") as SimpleButton) instead...I set Name In Flash CS4 but can't get here...
				getChildAt(9).addEventListener(MouseEvent.CLICK, AboutButtonClicked);
				
				getChildAt(9).addEventListener(MouseEvent.MOUSE_OVER, ButtonOn);
				getChildAt(9).addEventListener(MouseEvent.MOUSE_OUT, ButtonOut);
			}
		}
		public function ButtonOn(e:MouseEvent):void
		{
			//CursorManager.setCursor(hitCursor);
		}
		public function ButtonOut(e:MouseEvent):void
		{
			//CursorManager.removeAllCursor();  
		}
		public function StartButtonClicked(e:MouseEvent):void
		{
			Debugger.Print("StartButtonClicked:" + e.toString());
			var sButClickedEvent:MoChiEvent = new MoChiEvent(MoChiEvent.TRANSFER_PAGE);
			sButClickedEvent.SetToPage(MoChiEvent.TO_GAME);
			sButClickedEvent.SetFromPage(MoChiEvent.FROM_OP);
			dispatchEvent(sButClickedEvent);
			
			bgmChannel.stop();
			//CursorManager.removeAllCursor();
		}
		
		public function AboutButtonClicked(e:MouseEvent):void
		{
			Debugger.Print("AboutButtonClicked:" + e.toString());
			var aButClickedEvent:MoChiEvent = new MoChiEvent(MoChiEvent.TRANSFER_PAGE);
			aButClickedEvent.SetToPage(MoChiEvent.TO_ABOUT);
			aButClickedEvent.SetFromPage(MoChiEvent.FROM_OP);
			dispatchEvent(aButClickedEvent);
			//CursorManager.removeAllCursor();
		}
		public function playBGM():void
		{
			if(bgmChannel != null && bgm != null)
				bgmChannel = bgm.play(bgmChannel.position,int.MAX_VALUE);
		}
	}
}