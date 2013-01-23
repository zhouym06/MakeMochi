package Utils
{
	public class Constants
	{
		public static var BACK_INTEVAL:int = 500;
		public static var FASTEST_INTEVAL:int = 20;
		public static var SLOWEST_INTEVAL:int = 100;
		public function Constants()
		{
		}
		public static function getSpeedIndex(inteval:int):int
		{
			if(inteval > 83)
			{
				return 1;			//BPM80		//750inteval
			}
			else if(inteval > 33)	
			{
				return 2;			//BPS2		//500inteval
			}
			return 3;				//BPS5		//200inteval
		}
	}
}