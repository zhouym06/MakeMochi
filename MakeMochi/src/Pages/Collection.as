package Pages
{
	import Utils.*;
	
	import flash.display.MovieClip;
	import flash.net.SharedObject;
		
	public class Collection extends MovieClip
	{
		private static var inited:Boolean = false;
		private static var hasCollected:Array = new Array(Constants.MOCHI_NUMBER);
		private static var MoChis:Array = new Array(Constants.MOCHI_NUMBER);
		private static var DarkMoChis:Array = new Array(Constants.MOCHI_NUMBER);
		
		public function Collection(w:int, h:int)
		{
			Debugger.Print("Collection" + w + "\t" + h + "\n");
			super();
			if(!inited)
			{
				initialise();
				inited = true;
			}
			addMoChis();
			SetMoChiPos10();
			//width = w;
			//height = h;
		}
		public static function Collect(index:int):void
		{
			Debugger.Print("hasCollected" + (index - 1));
			hasCollected[index - 1] = true;
			
			SaveData();
		}
		public static function LoadData():void
		{
			Debugger.Print("LoadData\n");
			var so:SharedObject = SharedObject.getLocal("MakeMoChi_Collected");
			if(so != null && so.data.hasCollected != null)
			{
				hasCollected = so.data.hasCollected;
			}
			Debugger.Print("LoadData fin\n");
		}
		public static function SaveData():void
		{
			Debugger.Print("SaveData\n");
			var so:SharedObject = SharedObject.getLocal("MakeMoChi_Collected");
			Debugger.Print("SaveData2\n");
			if(so != null)
			{
				Debugger.Print("SaveData3\n");
				so.data.hasCollected = hasCollected;
				so.flush();
			}
			Debugger.Print("SaveData fin\n");
		}
		private function addMoChis():void
		{
			Debugger.Append("addMoChis" + "\n");
			for(var i:int = 0; i < Constants.MOCHI_NUMBER; i++)
			{
				if(hasCollected[i])
				{
					addChild(MoChis[i] as MovieClip);
				}
				else
				{
					addChild(DarkMoChis[i] as MovieClip);
				}
			}
		}
		private function setLevel(begin:int, len:int, h:Number, w:Number):void
		{
			Debugger.Append("setLevel" + begin + ":" + len + ":" + h + ":" + w + "\n");
			for(var offset:int = 0; offset < len; offset++)
			{
				var posX:Number = - 0.5 * w + w / (len + 1) * (offset + 1);
				
				(MoChis[begin + offset] as MovieClip).x = posX;
				(MoChis[begin + offset] as MovieClip).y = h;
				var ratio:Number = (MoChis[begin + offset] as MovieClip).height / (MoChis[begin + offset] as MovieClip).width;
				(MoChis[begin + offset] as MovieClip).width = w / 5;
				(MoChis[begin + offset] as MovieClip).height = w / 5 * ratio;
				
				(DarkMoChis[begin + offset] as MovieClip).x = posX;
				(DarkMoChis[begin + offset] as MovieClip).y = h;
				ratio = (DarkMoChis[begin + offset] as MovieClip).height / (DarkMoChis[begin + offset] as MovieClip).width;
				(DarkMoChis[begin + offset] as MovieClip).width = w / 5;
				(DarkMoChis[begin + offset] as MovieClip).height = w / 5 * ratio;
			}
		}
		
		private function SetMoChiPos10():void
		{
			setLevel(0,2, -120, 400);
			setLevel(2,2, -40, 400);
			setLevel(4,3, 40, 400);
			setLevel(7,3, 120, 400);
		}
		private static function initialise():void
		{
			Debugger.Append("initialise\n");
			var i:int;
			//for(i = 0; i< Constants.MOCHI_NUMBER; i++)
			//	hasCollected[i] = false;
			
			for(i = 0; i< Constants.MOCHI_NUMBER; i++)
				MoChis[i] = GetMoChi(i + 1, false);
			for(i = 0; i< Constants.MOCHI_NUMBER; i++)
				DarkMoChis[i] = GetMoChi(i + 1, true);
		}
		public static function GetMoChi(index:int,isDark:Boolean):MovieClip
		{
			if(!isDark)
			{
				switch(index)
				{
					case 1:
						return new MoChi1();
						break;
					case 2:
						return new MoChi2();
						break;
					case 3:
						return new MoChi3();
						break;
					case 4:
						return new MoChi4();
						break;
					case 5:
						return new MoChi5();
						break;
					case 6:
						return new MoChi6();
						break;
					case 7:
						return new MoChi7();
						break;
					case 8:
						return new MoChi8();
						break;
					case 9:
						return new MoChi9();
						break;
					case 10:
						return new MoChi10();
						break;
					
				}
				return new MoChi1();
			}
			else
			{
				switch(index)
				{
					case 1:
						return new MoChi1_dark();
						break;
					case 2:
						return new MoChi2_dark();
						break;
					case 3:
						return new MoChi3_dark();
						break;
					case 4:
						return new MoChi4_dark();
						break;
					case 5:
						return new MoChi5_dark();
						break;
					case 6:
						return new MoChi6_dark();
						break;
					case 7:
						return new MoChi7_dark();
						break;
					case 8:
						return new MoChi8_dark();
						break;
					case 9:
						return new MoChi9_dark();
						break;
					case 10:
						return new MoChi10_dark();
						break;
						
				}
				return new MoChi1_dark();
			}
			
		}
	}
}