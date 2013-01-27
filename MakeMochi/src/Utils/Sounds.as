package Utils
{
	import flash.media.Sound;
	
	public class Sounds
	{
		private static var inited:Boolean = false;
		private static var soundOn:Boolean = true;
		
		private static var SoundA_BPM80:Array = new Array(8);
		private static var SoundB_BPM80:Array = new Array(8);
		
		private static var SoundA_BPS2:Array = new Array(4);
		private static var SoundB_BPS2:Array = new Array(4);
		
		private static var SoundA_BPS5:Array = new Array(4);
		private static var SoundB_BPS5:Array = new Array(4);
		private static var SoundC_BPS5:Array = new Array(4);
		
		private static var BeginSound:Sound = null;
		private static var EndSound:Sound = null;
		private static var HaiYouSound:Sound = null;
		private static var OpeningBGMSound:Sound = null;
		private static var Roll:Sound = null;
		private static var Hit:Sound = null;
		private static var Clear:Sound = null;
		private static var GameBGMSound:Sound = null;
		
		public function Sounds()
		{
		}
		private static function Init():void
		{
			if(inited)
				return;
			Debugger.Print("Init\n");
			
			BeginSound 		= new begin();
			EndSound 		= new end();
			HaiYouSound 	= new HaiYou();
			OpeningBGMSound = new openingBGM();
			Roll			= new RollSound();
			Hit				= new HitSound();
			Clear			= new clearSound();
			GameBGMSound	= new GameBGM();
			
			SoundA_BPM80[0] = new BPM80A1();
			SoundA_BPM80[1] = new BPM80A2();
			SoundA_BPM80[2] = new BPM80A3();
			SoundA_BPM80[3] = new BPM80A4();
			SoundA_BPM80[4] = new BPM80A5();
			SoundA_BPM80[5] = new BPM80A6();
			SoundA_BPM80[6] = new BPM80A7();
			SoundA_BPM80[7] = new BPMA808();	//change swc if mysophobia
			
			SoundB_BPM80[0] = new BPM80B1();
			SoundB_BPM80[1] = new BPM80B2();
			SoundB_BPM80[2] = new BPM80B3();
			SoundB_BPM80[3] = new BPM80B4();
			SoundB_BPM80[4] = new BPM80B5();
			SoundB_BPM80[5] = new BPM80B6();
			SoundB_BPM80[6] = new BPM80B7();
			SoundB_BPM80[7] = new BPM80B8();
			
			SoundA_BPS2[0] = new bps2A1();
			SoundA_BPS2[1] = new bps2A2();
			SoundA_BPS2[2] = new bps2A3();
			SoundA_BPS2[3] = new bps2A4();
			
			SoundB_BPS2[0] = new bps2B1();
			SoundB_BPS2[1] = new bps2B2();
			SoundB_BPS2[2] = new bps2B3();
			SoundB_BPS2[3] = new bps2B4();
			
			SoundA_BPS5[0] = new bps5A1();
			SoundA_BPS5[1] = new bps5A2();
			SoundA_BPS5[2] = new bps5A3();
			SoundA_BPS5[3] = new bps5A4();
			
			SoundB_BPS5[0] = new bps5B1();
			SoundB_BPS5[1] = new bps5B2();
			SoundB_BPS5[2] = new bps5B3();
			SoundB_BPS5[3] = new bps5B4();
			
			SoundC_BPS5[0] = new bps5C1();
			SoundC_BPS5[1] = new bps5C2();
			SoundC_BPS5[2] = new bps5C3();
			SoundC_BPS5[3] = new bps5C4();
			inited = true;
			
		}

		public static function SetSoundOn(isOn:Boolean):void
		{
			soundOn = isOn;
		}
		public static function IsOn():Boolean
		{
			return soundOn;
		}
		
		public static function PlayOpeningBGM():void
		{
			if(soundOn)
				GetOpeningBGM().play();
		}
		public static function PlayBeginSound():void
		{
			if(soundOn)
				GetBeginSound().play();
		}
		public static function PlayEndSound():void
		{
			if(soundOn)
				GetEndSound().play();
		}
		public static function PlayHaiYouSound():void
		{
			if(soundOn)
				GetHaiYouSound().play();
		}
		public static function PlayHammerSound(inteval:int, left:Boolean):void
		{
			if(soundOn)
				GetHammerSound(inteval, left).play();
		}
		public static function PlayHandSound(inteval:int):void
		{
			if(soundOn)
				GetHandSound(inteval).play();
		}
		public static function PlayRollSound():void
		{
			if(soundOn)
				GetRollSound().play();
		}
		public static function PlayHitSound():void
		{
			if(soundOn)
				GetHitSound().play();
		}
		public static function PlayClearSound():void
		{
			if(soundOn)
				GetClearSound().play();
		}
		public static function PlayGameBGM():void
		{
			if(soundOn)
				GetGameBGM().play();
		}
		public static function GetGameBGM():Sound
		{
			
			Init();
			return GameBGMSound;
		}
		
		public static function GetOpeningBGM():Sound
		{
			Init();
			return OpeningBGMSound;
		}
		public static function GetBeginSound():Sound
		{
			Init();
			return BeginSound;
		}
		public static function GetEndSound():Sound
		{
			Init();
			return EndSound;
		}
		public static function GetHaiYouSound():Sound
		{
			Init();
			return HaiYouSound;
		}
		public static function GetRollSound():Sound
		{
			Init();
			return Roll;
		}
		public static function GetHitSound():Sound
		{
			Init();
			return Hit;
		}
		public static function GetClearSound():Sound
		{
			Init();
			return Clear;
		}
		
		public static function GetHammerSound(inteval:int, left:Boolean):Sound
		{
			Init();
			//Debugger.Print("GetHammerSound");
			
			var randomIndex:int = 1;
			switch(Tools.GetSpeedIndex(inteval))
			{
				case 1:
					
					randomIndex = Math.floor(Math.random() * 8);
					//Debugger.Append("1:" + randomIndex + "\n");
					return SoundA_BPM80[randomIndex];
					break;
				case 2:
					randomIndex = Math.floor(Math.random() * 4);
					//Debugger.Append("2:" + randomIndex + "\n");
					return SoundA_BPS2[randomIndex];
					break;
				case 3:
					randomIndex = Math.floor(Math.random() * 4);
					//Debugger.Append("3:" + randomIndex + "\n");
					if(left)
						return SoundA_BPS5[randomIndex];
					return SoundB_BPS5[randomIndex];
					break;
			}
			return new BPM80A2();
		}
		public static  function GetHandSound(inteval:int):Sound
		{
			Init();
			//Debugger.Print("GetHandSound");
			
			var randomIndex:int = 1;
			switch(Tools.GetSpeedIndex(inteval))
			{
				case 1:
					randomIndex = Math.floor(Math.random() * 8);
					//Debugger.Append("1:" + randomIndex + "\n");
					return SoundB_BPM80[randomIndex];
					break;
				case 2:
					randomIndex = Math.floor(Math.random() * 4);
					//Debugger.Append("2:" + randomIndex + "\n");
					return SoundB_BPS2[randomIndex];
					break;
				case 3:
					randomIndex = Math.floor(Math.random() * 4);
					//Debugger.Append("3:" + randomIndex + "\n");
					return SoundC_BPS5[randomIndex];
					break;
			}
			return new BPM80B2();
		}
	}
}