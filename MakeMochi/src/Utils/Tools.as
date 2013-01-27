package Utils
{

	import flash.utils.*;
	
	public class Tools
	{
		public function Tools()
		{
		}
		
		public static function GetSpeedIndex(inteval:int):int
		{
			if(inteval > 45)
			{
				return 1;
			}
			else
			{
				return 2;
			}
			/*
			if(inteval > 83)
			{
				return 1;			//BPM80		//750inteval
			}
			else if(inteval > 33)	
			{
				return 2;			//BPS2		//500inteval
			}
			return 3;				//BPS5		//200inteval
			*/
		}
		public static function GetMoChiIndex(score:int):int	// 1 to MOCHI_NUMBER
		{
			var maxIndex:Number = score / 50;	//need	500 to get MoChi_0;
			if(maxIndex > Constants.MOCHI_NUMBER)
				maxIndex = Constants.MOCHI_NUMBER - 0.1;
			var index:int = Constants.MOCHI_NUMBER - Math.floor(Math.random() * maxIndex);
			Debugger.Print("GetMoChiIndex:" + index + "\n");
			return index;
		}
		
		public static function GetTimerPos(left:Number, right:Number, begin:Number,end:Number, time:Number):int
		{
			var result:Number = left + (right - left) / (end - begin) * (time - begin);
			//Debugger.Print("GetTimerPos" + result);
			return result;
		}
	}
}