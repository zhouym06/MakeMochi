package GameStage
{
	import Utils.*;
	
	import flash.display.*;
	import flash.events.*;
	import flash.media.*;
	import flash.text.*;
	import flash.utils.*;
	

	public class _GameStage extends GameStage
	{
		
		//status
		private var playing:Boolean = false;
		private var inteval:int = Constants.INIT_INTEVAL;
		
		private var ComboRoll:int = 0;
		private var ComboMiss:int = 0;
		
		private var countDownTime:int = Constants.INIT_TIME;
		private var life:int = Constants.INIT_LIFE;
		private var score:int = Constants.INIT_SCORE;
		
		private var needWater:Boolean = false;
		private var started:Boolean = false;
		
		private var mainTimer:Timer = null;
		private var backTimer:Timer = null;
		private var countDownTimer:Timer = null;
		
		private var bgmChannel:SoundChannel = null;
		
		//components
		private var _Hammer5:MovieClip = null;
		private var _Hammer24:MovieClip = null;
		
		private var _ClickZone:SimpleButton = null;
		private var _RiceBefore:MovieClip = null;
		private var _RiceAfter:MovieClip = null;
		private var _Hands:MovieClip = null;
		
		private var _BarMask:MovieClip = null;
		private var _MoChiHead:MovieClip = null;
		private var _ScoreBoard:MovieClip = null;
		private var _LifeBoard:MovieClip = null;
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
			/*
			Debugger.Print("");
			for(var i:int = 0; i < 25; i++)
			{
				Debugger.Append(i + ":" + (getChildAt(i)).toString() + "\n");
			}
			*/
			//hammers
			_Hammer5 = getChildAt(12) as MovieClip;
			_Hammer24 = getChildAt(10) as MovieClip;
			_Hammer5.visible = false;
			//ScoreBar
			_BarMask = getChildAt(14) as MovieClip;
			_MoChiHead = getChildAt(17) as MovieClip;
			_ScoreBoard = getChildAt(18) as MovieClip;
			_LifeBoard = getChildAt(19) as MovieClip;
			(_ScoreBoard.getChildAt(1) as TextField).selectable = false;
			(_LifeBoard.getChildAt(1) as TextField).selectable = false;
			(_MoChiHead.getChildAt(1) as TextField).selectable = false;
			refreshScore();
			refreshTime();
			refreshLife();
			
			//motars
			_ClickZone = getChildAt(24) as SimpleButton;
			_RiceBefore = getChildAt(7) as MovieClip;
			_RiceAfter = getChildAt(5) as MovieClip;
			_Hands  = getChildAt(8) as MovieClip;
			
			//buttons
			_PauseButton = getChildAt(23) as SimpleButton;
			_GAAboutButton = getChildAt(0) as SimpleButton;
			_GAHelpButton = getChildAt(22) as SimpleButton;
			//_SoundOnButton = getChildAt(20) as SimpleButton;
			//_SoundOffButton = getChildAt(21) as SimpleButton;
			_SoundOnButton = getChildAt(21) as SimpleButton;
			_SoundOffButton = getChildAt(20) as SimpleButton;
			_Speed1Button = getChildAt(2) as SimpleButton;
			_Speed2Button = getChildAt(1) as SimpleButton;
			
			_GAAboutButton.visible = false;
			_Speed2Button.visible = false;
			if(Sounds.IsOn())
				_SoundOnButton.visible = false;
			else
				_SoundOffButton.visible = false;
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
			backTimer = new Timer(Constants.BACK_DELAY_INTEVAL, 1);
			mainTimer = new Timer(inteval);
			countDownTimer = new Timer(Constants.COUNT_DOWN_INTEVAL);
			
			backTimer.addEventListener("timer", BackTimeUp);
			mainTimer.addEventListener("timer", MainTimeUp);
			countDownTimer.addEventListener("timer", CountDownTimeUp);
			
			mainTimer.start();
			countDownTimer.start();
		}
		
		
		public function Pause():void
		{
			playing = false;
		}
		public function Continue():void
		{
			backTimer.start();
			Debugger.Print("");
			for(var i:int = 0; i < 23; i++)
			{
				Debugger.Append(i + ":" + (getChildAt(i)).toString() + "\n");
			}
		}
		
		private function SpeedUp():void			
		{
			if(inteval < 40)
				inteval -= 2;
			else
				inteval *= 0.8;
			if(inteval < Constants.FASTEST_INTEVAL)
				inteval = Constants.FASTEST_INTEVAL;
			mainTimer.stop();
			mainTimer = new Timer(inteval);
			mainTimer.addEventListener("timer", MainTimeUp);
			mainTimer.start();
			Debugger.Print("SpeedUp" + inteval);
			
		}
		private function SpeedDown():void		
		{
			
			if(inteval > 40)
				inteval += 2;
			else
				inteval *= 1.2;
			
			if(inteval > Constants.SLOWEST_INTEVAL)
				inteval = Constants.SLOWEST_INTEVAL;
			mainTimer.stop();
			mainTimer = new Timer(inteval);
			mainTimer.addEventListener("timer", MainTimeUp);
			mainTimer.start();
			Debugger.Print("SpeedDown" + inteval);
			
		}
		private function HandleHit():void
		{
			//Debugger.Print("HandleHit");
			Sounds.PlayHitSound();
			_Hands.gotoAndStop(1);
			SpeedDown();
			
			ComboRoll = 0;
			if(life > 0)
			{
				life--;
				refreshLife();
				return;
			}
			HandleEnd(true);
		}
		private function HandleEnd(dead:Boolean):void
		{
			Pause();
			Sounds.PlayEndSound();
			
			var end:MoChiEvent = new MoChiEvent(MoChiEvent.TRANSFER_PAGE);
			end.SetToPage(MoChiEvent.TO_END);
			end.SetFromPage(MoChiEvent.FROM_GAME);
			end.SetScore(score);
			end.SetDead(dead);
			dispatchEvent(end);
			stopBGM();
		}
		private function refreshTime():void
		{
			if(countDownTime <= 0)
			{
				HandleEnd(false);
			}
			(_MoChiHead.getChildAt(1) as TextField).text = countDownTime.toString();
		}
		private function refreshScore():void
		{
			(_ScoreBoard.getChildAt(1) as TextField).text = score.toString();
		}
		private function refreshLife():void
		{
			(_LifeBoard.getChildAt(1) as TextField).text = life.toString();
		}
		
		private function BackTimeUp(e:TimerEvent):void
		{
			//Debugger.Print("BackTimeUp:" + e.toString());
			playing = true;
			playBGM();
			_PauseButton.addEventListener(MouseEvent.CLICK, PauseButtonClicked);
		}
		private function CountDownTimeUp(e:TimerEvent):void
		{
			if(!playing)
				return;
			countDownTime --; 
			
			//Debugger.Print(_MoChiHead.x.toString());
			//Debugger.Append(_BarMask.x.toString());
			_MoChiHead.x = Tools.GetTimerPos(Constants.TIME_BAR_LEFT, Constants.TIME_BAR_RIGHT, Constants.INIT_TIME, 0, countDownTime);
			_BarMask.x  = Tools.GetTimerPos(Constants.TIME_BAR_LEFT, Constants.TIME_BAR_RIGHT, Constants.INIT_TIME, 0, countDownTime);
			refreshTime();
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
				Sounds.PlayBeginSound();
				started = true;
			}
			var frame:int = _Hammer24.currentFrame;
			var nextFrame:int = frame >=  _Hammer24.totalFrames ? 1 : frame + 1;
			_Hammer24.gotoAndStop(nextFrame);
			
			//if(nextFrame == 5 || nextFrame == 9)
			if(nextFrame == 4 )
			{
				Sounds.PlayHammerSound(inteval, true);
				if(_RiceBefore.visible == true)
				{
					ComboMiss++;
					ComboRoll = 0;
					SpeedDown();
				}
				_RiceAfter.visible = false;
				_RiceBefore.visible = true;
			}
			if(nextFrame == 8 )
			{
				Sounds.PlayHammerSound(inteval, false);
				_RiceAfter.visible = false;
				_RiceBefore.visible = true;
			}
			if(nextFrame > 3 && nextFrame < 10)
			{
				//Debugger.Print("Hit by Hammer!");
				if(_Hands.currentFrame == 3)
					HandleHit();
			}
		}
		
		
		
		private function OnRice(e:MouseEvent):void
		{
			if(!playing)
				return;
			//Debugger.Print("OnRice:");
			_Hands.gotoAndStop(4);
		}
		private function OutRice(e:MouseEvent):void
		{
			if(!playing)
				return;
			//Debugger.Print("OutRice:");
			_Hands.gotoAndStop(1);
		}
		private function DownRice(e:MouseEvent):void
		{
			//Debugger.Print("DownRice:");
			_Hands.gotoAndStop(3);
			if(_RiceBefore.visible == false && _RiceAfter.visible == false)
			{
				Continue();
			}
			if(_RiceAfter.visible == false)
			{
				
				ComboMiss = 0;
				ComboRoll++;
				if(ComboRoll > 1)
				{
					SpeedUp();
				}
				if(ComboRoll > 2 && (ComboRoll % 5 == 0))
				{
					life++;
					refreshLife();
					Sounds.PlayRollSound();
				}
				score += ComboRoll;
				refreshScore();
			}
			_RiceAfter.visible = true;
			_RiceBefore.visible = false;
			Sounds.PlayHandSound(inteval);
		}
		private function UpRice(e:MouseEvent):void
		{
			_Hands.gotoAndStop(2);
			if(!playing)
				return;
			//Debugger.Print("UpRice:");
			
		}
		
		
		private function HelpButtonClicked(e:MouseEvent):void
		{
			Debugger.Print("HelpButtonClicked:" + e.toString());
			Pause();
			var aButClickedEvent:MoChiEvent = new MoChiEvent(MoChiEvent.TRANSFER_PAGE);
			aButClickedEvent.SetToPage(MoChiEvent.TO_HELP);
			aButClickedEvent.SetFromPage(MoChiEvent.FROM_GAME);
			dispatchEvent(aButClickedEvent);
			stopBGM();
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
			_Hands.gotoAndStop(1);
			if(playing)
			{
				Pause();
				stopBGM();
			}
			else
			{
				backTimer.start();
				_PauseButton.removeEventListener(MouseEvent.CLICK, PauseButtonClicked);
			}
		}
		private function SoundOnButtonClicked(e:MouseEvent):void
		{
			Debugger.Print("SoundOnButtonClicked:" + e.toString());
			_SoundOnButton.visible = false;
			_SoundOffButton.visible = true;
			Sounds.SetSoundOn(true);
			playBGM();
			
		}
		private function SoundOffButtonClicked(e:MouseEvent):void
		{
			Debugger.Print("SoundOffButtonClicked:" + e.toString());
			_SoundOnButton.visible = true;
			_SoundOffButton.visible = false;
			Sounds.SetSoundOn(false);
			stopBGM();
		}
		private function playBGM():void
		{
			if(Sounds.IsOn())
			{
				if(bgmChannel == null)
				{
					bgmChannel = Sounds.GetGameBGM().play(0, int.MAX_VALUE);
					var st:SoundTransform = new SoundTransform();
					st.volume = 0.3;
					bgmChannel.soundTransform = st;
				}
				else
				{
					bgmChannel.stop();
					bgmChannel = Sounds.GetGameBGM().play(bgmChannel.position,int.MAX_VALUE);
				}
			}
		}
		private function stopBGM():void
		{
			if(bgmChannel != null)
			{
				bgmChannel.stop();
			}
		}
		
	}
}