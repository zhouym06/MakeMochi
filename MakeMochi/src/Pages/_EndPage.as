package Pages
{
	import Utils.*;
	
	import flash.display.*;
	import flash.events.*;
	import flash.text.*;
	
	
	public class _EndPage extends InfoPage
	{
		private var _Collections:MovieClip = null;
		private var _MoChiMade:MovieClip = null;
		private var _MoChiComment:TextField = null;
		private var _ITaiIImage:MovieClip = null;
		
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
			//Title
			(getChildAt(2) as TextField).text = "";
			(getChildAt(2) as TextField).selectable = false;
			(getChildAt(2) as TextField).autoSize = "center";
			//Text
			(getChildAt(1) as TextField).autoSize="left";
			(getChildAt(1) as TextField).wordWrap=true;
			(getChildAt(1) as TextField).multiline=true;
			(getChildAt(1) as TextField).selectable = false;
			
			//Button
			(getChildAt(3) as SimpleButton).addEventListener(MouseEvent.CLICK, BackButtonClicked);
			
			if(_ITaiIImage == null)
			{
				_ITaiIImage = new ITaiIImage();
				addChild(_ITaiIImage);
			}
			_ITaiIImage.visible = false;
			
			if(_Collections != null)
			{
				removeChild(_Collections);
			}
			
			if(dead)
			{
				Debugger.Print("dead:\n");
				(getChildAt(2) as TextField).text="Game Over !";
				(getChildAt(1) as TextField).htmlText = "" +
					" You lost all your life with a score of " + score +
					". Be careful of the Hammer or wait for its slowing down.\n";
				_ITaiIImage.visible = true;
			}
			else
			{
				Debugger.Print("End:\n");
				var MoChiIndex:int = Tools.GetMoChiIndex(score);
				Collection.Collect(MoChiIndex);
				
				
				(getChildAt(2) as TextField).text="Game End !";
				(getChildAt(1) as TextField).htmlText = "" +
					" You have scored " + score + ". And have made a " + Constants.GetMoChiName(MoChiIndex) + "!\n" +
					" Try to collect all the mochis!";
				
				_Collections = new Collection(width, height); 
				_Collections.x = width * 1 / 3;
				_Collections.y = height * 1 / 6;
				addChild(_Collections);
				if(_MoChiMade != null)
				{
					removeChild(_MoChiMade);
				}
				_MoChiMade = Collection.GetMoChi(MoChiIndex,false);
				addChild(_MoChiMade);
				_MoChiMade.x = - width * 1 / 2;
				_MoChiMade.y = - height * 1 / 6;
				
				if(_MoChiComment != null)
				{
					removeChild(_MoChiComment);
				}
				_MoChiComment = new TextField();
				_MoChiComment.text = Constants.GetMoChiComment(MoChiIndex);
				_MoChiComment.setTextFormat(Constants.COMMENT_FONT);
				_MoChiComment.selectable = false;
				_MoChiComment.autoSize="left";
				_MoChiComment.wordWrap=true;
				_MoChiComment.width = width * 3 / 5;
				_MoChiComment.x = - width * 2 / 3;
				_MoChiComment.y = 0;
				_MoChiComment.multiline=true;
				addChild(_MoChiComment);
				
				Sounds.PlayClearSound();
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