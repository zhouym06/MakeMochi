package Utils
{
	import flash.events.Event;
	
	public class MoChiEvent extends Event
	{
		public static const TRANSFER_PAGE:String = "transfer_page";
		
		public static const TO_OP:String = "to_op";
		public static const TO_ABOUT:String = "to_about";
		public static const TO_GAME:String = "to_game";
		public static const TO_HELP:String = "to_help";
		public static const TO_END:String = "to_end";
		
		public static const FROM_OP:String = "from_op";
		public static const FROM_ABOUT:String = "from_about";
		public static const FROM_GAME:String = "from_game";
		public static const FROM_HELP:String = "from_help";
		public static const FROM_END:String = "from_end";
		
		private var to_page:String = null;
		private var from_page:String = null;
		private var score:int = 0;
		private var dead:Boolean = false;
		public function MoChiEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		public function SetToPage(to:String):void
		{
			to_page = to;
		}
		public function GetToPage():String
		{
			return to_page;
		}
		public function SetFromPage(from:String):void
		{
			from_page = from;
		}
		public function GetFromPage():String
		{
			return from_page;
		}
		public function SetScore(s:int):void
		{
			score = s;
		}
		public function GetScore():int
		{
			return score;
		}
		public function SetDead(d:Boolean):void
		{
			dead = d;
		}
		public function GetDead():Boolean
		{
			return dead;
		}
	}
}