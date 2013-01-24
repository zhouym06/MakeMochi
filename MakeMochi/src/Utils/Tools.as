package Utils
{

	public class Tools
	{
		public function Tools()
		{
		}
		
		public static function GetSpeedIndex(inteval:int):int
		{
			if(inteval > 53)
			{
				return 1;			//BPM80		//750inteval
			}
			else
			{
				return 2;			//BPS2		//500inteval
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
		public static function GetTimerPos(left:Number, right:Number, begin:Number,end:Number, time:Number):int
		{
			var result:Number = left + (right - left) / (end - begin) * (time - begin);
			//Debugger.Print("GetTimerPos" + result);
			return result;
		}
	}
}