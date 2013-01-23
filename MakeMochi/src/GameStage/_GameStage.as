package GameStage
{
	import Utils.*;
	
	import flash.display.*;
	import flash.events.*;
	import flash.media.Sound;
	import flash.text.*;
	import flash.utils.Timer;

	public class _GameStage extends GameStage
	{
		//status
		public static var playing:Boolean = false;
		private var inteval:int = 72;
		private var backInteval:int = Constants.BACK_INTEVAL;
		private var hitCount:int = 0;
		private var missCount:int = 0;
		private var score:int = 0;
		private var needWater:Boolean = false;
		private var started:Boolean = false;
		
		private var _mainTimer:Timer = null;
		private var _backTimer:Timer = null;
		
		
		//components
		private var _Hammer5:MovieClip = null;
		private var _Hammer24:MovieClip = null;
		
		private var _BarMask:MovieClip = null;
		private var _MoChiHead:MovieClip = null;
		private var _ScoreBoard:TextField = null;
		
		private var _ClickZone:SimpleButton = null;
		private var _RiceBefore:MovieClip = null;
		private var _RiceAfter:MovieClip = null;
		private var _Hands:MovieClip = null;
		
		//buttons
		private var _PauseButton:SimpleButton = null;
		private var _GAAboutButton:SimpleButton = null;
		private var _GAHelpButton:SimpleButton = null;
		private var _SoundOnButton:SimpleButton = null;
		private var _SoundOffButton:SimpleButton = null;
		private var _Speed1Button:SimpleButton = null;
		private var _Speed2Button:SimpleButton = null;
		
		


		public function _GameStage(w:int, h:int)
		{
			super();
			//init
			width  = w * 1.4;
			height = h * 1.2;
			x = w / 2;
			y = h * 0.52;
			
			//debugger
			Debugger.getDebugger().y = h * 0.3;		//for not blocking buttons
			Debugger.Print("");
			for(var i:int = 0; i < 23; i++)
			{
				Debugger.Append(i + ":" + (getChildAt(i)).toString() + "\n");
			}
			
			//hammers
			_Hammer5 = getChildAt(9) as MovieClip;
			_Hammer24 = getChildAt(7) as MovieClip;
			_Hammer5.visible = false;
			
			//ScoreBar
			_BarMask = getChildAt(11) as MovieClip;
			_MoChiHead = getChildAt(14) as MovieClip;
			//motars
			_ClickZone = getChildAt(22) as SimpleButton;
			_RiceBefore = getChildAt(4) as MovieClip;
			_RiceAfter = getChildAt(2) as MovieClip;
			_Hands  = getChildAt(5) as MovieClip;
			//buttons
			_PauseButton = getChildAt(21) as SimpleButton;
			_GAAboutButton = getChildAt(20) as SimpleButton;
			_GAHelpButton = getChildAt(19) as SimpleButton;
			_SoundOnButton = getChildAt(16) as SimpleButton;
			_SoundOffButton = getChildAt(18) as SimpleButton;
			_Speed1Button = getChildAt(15) as SimpleButton;
			_Speed2Button = getChildAt(17) as SimpleButton;
			
			_GAAboutButton.visible = false;
			_Speed2Button.visible = false;
			_SoundOnButton.visible = false;
			_RiceAfter.visible = false;
			_RiceBefore.visible = false;
			
			//MouseEvent
			_ClickZone.addEventListener(MouseEvent.MOUSE_OVER, OnRice);
			_ClickZone.addEventListener(MouseEvent.MOUSE_OUT, OutRice);
			_ClickZone.addEventListener(MouseEvent.MOUSE_DOWN, DownRice);
			_ClickZone.addEventListener(MouseEvent.MOUSE_UP, UpRice);
			
			_GAHelpButton.addEventListener(MouseEvent.CLICK, HelpButtonClicked);
			_Speed1Button.addEventListener(MouseEvent.CLICK, Speed1ButtonClicked);
			_Speed2Button.addEventListener(MouseEvent.CLICK, Speed2ButtonClicked);
			_PauseButton.addEventListener(MouseEvent.CLICK, PauseButtonClicked);
			_SoundOnButton.addEventListener(MouseEvent.CLICK, SoundOnButtonClicked);
			_SoundOffButton.addEventListener(MouseEvent.CLICK, SoundOffButtonClicked);
			
			//Timer
			_backTimer = new Timer(backInteval, 1);
			_mainTimer = new Timer(inteval);
			_backTimer.addEventListener("timer", BackTimeUp);
			_mainTimer.addEventListener("timer", MainTimeUp);
			_mainTimer.start();
			
		}
		public function Pause():void
		{
			playing = false;
		}
		public function Continue():void
		{
			_backTimer.start();
			Debugger.Print("");
			for(var i:int = 0; i < 23; i++)
			{
				Debugger.Append(i + ":" + (getChildAt(i)).toString() + "\n");
			}
		}
		private function IsHurt():Boolean
		{
			return false;
		}
		
		
		private function BackTimeUp(e:TimerEvent):void
		{
			//Debugger.Print("BackTimeUp:" + e.toString());
			playing = true;
			_PauseButton.visible = true;
		}
		private function MainTimeUp(e:TimerEvent):void
		{
			//Debugger.Print("MainTimeUp:" + e.toString());
			if(!playing)
				return;
			if(_RiceBefore.visible == false && _RiceAfter.visible == false)
				return;
			if(!started)
			{
				var beginSound:Sound = Sounds.GetBeginSound();
				beginSound.play();
				started = true;
			}
			var frame:int = _Hammer24.currentFrame;
			var nextFrame:int = frame >=  _Hammer24.totalFrames ? 1 : frame + 1;
			_Hammer24.gotoAndStop(nextFrame);
			
			//if(nextFrame == 5 || nextFrame == 9)
			if(nextFrame == 4 )
			{
				var sound1:Sound = Sounds.GetHammerSound(inteval, true);
				sound1.play();
			}
			if(nextFrame == 8 )
			{
				var sound2:Sound = Sounds.GetHammerSound(inteval, false);
				sound2.play();
			}
			//	missCount ++;
			
		}
		
		private function OnRice(e:MouseEvent):void
		{
			Debugger.Print("OnRice:");
			_Hands.gotoAndStop(4);
		}
		private function OutRice(e:MouseEvent):void
		{
			Debugger.Print("OutRice:");
			_Hands.gotoAndStop(1);
		}
		private function DownRice(e:MouseEvent):void
		{
			
			Debugger.Print("DownRice:");
			_Hands.gotoAndStop(3);
			if(_RiceBefore.visible == false && _RiceAfter.visible == false)
			{
				
				_RiceAfter.visible = true;
				
				_ScoreBoard = new TextField();
				_ScoreBoard.text = score.toString();
				_ScoreBoard.selectable = false;
				var format:TextFormat=new TextFormat();
				format.color = 0xFF0000;
				//format.font = "Gill Sans Ultra Bold";
				format.font = "Jokerman";
				//format.font = "Ravie";
				format.size = 0.4 * _MoChiHead.width;
				_ScoreBoard.setTextFormat(format);
				_ScoreBoard.x = -0.2 * _MoChiHead.width;
				_ScoreBoard.y = -0.2 * _MoChiHead.height;
				_MoChiHead.addChild(_ScoreBoard);
			}
			
			var sound:Sound = Sounds.GetHandSound(inteval);
			sound.play();
		}
		private function UpRice(e:MouseEvent):void
		{
			Debugger.Print("UpRice:");
			_Hands.gotoAndStop(2);
		}
		
		
		private function HelpButtonClicked(e:MouseEvent):void
		{
			Debugger.Print("HelpButtonClicked:" + e.toString());
			var aButClickedEvent:MoChiEvent = new MoChiEvent(MoChiEvent.TRANSFER_PAGE);
			aButClickedEvent.SetToPage(MoChiEvent.TO_HELP);
			aButClickedEvent.SetFromPage(MoChiEvent.FROM_GAME);
			dispatchEvent(aButClickedEvent);
		}
		
		private function Speed1ButtonClicked(e:MouseEvent):void
		{
			Debugger.Print("Speed1ButtonClicked:" + e.toString());
			_Speed1Button.visible = false;
			_Speed2Button.visible = true;
		}
		private function Speed2ButtonClicked(e:MouseEvent):void
		{
			Debugger.Print("Speed2ButtonClicked:" + e.toString());
			_Speed1Button.visible = true;
			_Speed2Button.visible = false;
		}
		private function PauseButtonClicked(e:MouseEvent):void
		{
			Debugger.Print("PauseButtonClicked:" + e.toString());
			if(playing)
			{
				Pause();
			}
			else
			{
				_backTimer.start();
				_PauseButton.visible = false;
			}
			
		}
		private function SoundOnButtonClicked(e:MouseEvent):void
		{
			Debugger.Print("SoundOnButtonClicked:" + e.toString());
			_SoundOnButton.visible = false;
			_SoundOffButton.visible = true;
			
		}
		private function SoundOffButtonClicked(e:MouseEvent):void
		{
			Debugger.Print("SoundOffButtonClicked:" + e.toString());
			_SoundOnButton.visible = true;
			_SoundOffButton.visible = false;
		}
		
	}
}