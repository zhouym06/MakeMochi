package Utils
{
	import flash.text.TextFormat;

	public class Constants
	{
		public static var BACK_DELAY_INTEVAL:int = 500;
		public static var COUNT_DOWN_INTEVAL:int = 1000;
		
		public static var FASTEST_INTEVAL:int = 20;
		public static var SLOWEST_INTEVAL:int = 100;
		public static var INIT_INTEVAL:int = 72;
		
		
		public static var INIT_TIME:int = 40;
		public static var INIT_LIFE:int = 10;
		public static var INIT_SCORE:int = 0;
		
		public static var TIME_BAR_LEFT:int = -336;
		public static var TIME_BAR_RIGHT:int = 34;
		
		public static var TIMER_FONT_NAME:String = "Jokerman";
		//public static var TIMER_FONT_NAME:String = "Gill Sans Ultra Bold";
		//public static var TIMER_FONT_NAME:String = "Ravie"
		public static var TIMER_FONT:TextFormat = new TextFormat(TIMER_FONT_NAME, 24 ,0xFF0000);
		
		public function Constants()
		{
		}
		
	}
}