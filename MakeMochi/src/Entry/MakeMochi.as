package Entry
{
	import GameStage.*;
	import Pages.*;
	import Utils.*;
	
	import flash.display.*;
	import flash.events.*;
	import flash.text.*;
	
	
	public class MakeMochi extends Sprite
	{
		
		private var _op:MovieClip = null;
		private var _about:MovieClip = null;
		private var _help:MovieClip = null;
		private var _gameStage:_GameStage = null;
		private var _end:MovieClip = null;
		
		public function MakeMochi()
		{
			Debugger.SetWidth(stage.stageWidth);
			addOP();
		}
		public function transPage(e:MoChiEvent):void
		{
			Debugger.Print("transPage:" + e.toString());
			hide(_op);
			hide(_about);
			hide(_help);
			hide(_gameStage);
			hide(_end);
			
			switch(e.GetToPage())
			{
				case MoChiEvent.TO_ABOUT:
					if(_about != null)
					{
						_about.visible = true;
						break;
					}
					_about = new _AboutPage(stage.stageWidth, stage.stageHeight);
					_about.addEventListener(MoChiEvent.TRANSFER_PAGE, transPage);
					addChild(_about);
					break;
				case MoChiEvent.TO_OP:
					if(_op != null)
					{
						_op.visible = true;
						if(e.GetFromPage() == MoChiEvent.FROM_END)
							_op.play();
						break;
					}
					_op = new _Opening(stage.stageWidth, stage.stageHeight);
					_op.addEventListener(MoChiEvent.TRANSFER_PAGE, transPage);
					addChild(_op);
					break;
				case MoChiEvent.TO_GAME:
					if(_gameStage != null && e.GetFromPage() == MoChiEvent.FROM_HELP)
					{
						_gameStage.visible = true;
						_gameStage.Continue();
						break;
					}
					if(_gameStage != null)
						removeChild(_gameStage);
					_gameStage = new _GameStage(stage.stageWidth, stage.stageHeight);
					_gameStage.addEventListener(MoChiEvent.TRANSFER_PAGE, transPage);
					addChild(_gameStage);
					if(e.GetFromPage() == MoChiEvent.FROM_OP)
					{
						_gameStage.Pause();
						_help = new _HelpPage(stage.stageWidth, stage.stageHeight);
						_help.addEventListener(MoChiEvent.TRANSFER_PAGE, transPage);
						addChild(_help);
					}
					break;
				case MoChiEvent.TO_HELP:
					if(_help != null)
					{
						_help.visible = true;
						break;
					}
					_help = new _HelpPage(stage.stageWidth, stage.stageHeight);
					_help.addEventListener(MoChiEvent.TRANSFER_PAGE, transPage);
					addChild(_help);
				case MoChiEvent.TO_END:
					_end = new _EndPage(stage.stageWidth, stage.stageHeight,e.GetScore(), e.GetDead());
					_end.addEventListener(MoChiEvent.TRANSFER_PAGE, transPage);
					addChild(_end);
			}
			
			if(Debugger.debugging)
			{
				removeChild(Debugger.getDebugger());
				addChild(Debugger.getDebugger());
			}
		}
		private function hide(mc:MovieClip):void
		{
			if(mc != null)
				mc.visible = false;
		}
		private function remove(mc:MovieClip):void
		{
			if(mc != null)
				removeChild(mc);
		}
		private function addOP():void
		{
			_op = new _Opening(stage.stageWidth, stage.stageHeight);
			_op.addEventListener(MoChiEvent.TRANSFER_PAGE, transPage);
			//op = new OpeningWithoutBackAndButton();
			addChild(_op);
			if(Debugger.debugging)
				addChild(Debugger.getDebugger());
			_op.gotoAndPlay(1);
		}
	}
}