package Utils
{
	public class Debugger
	{
		import flash.text.*;
		
		public static var debugging:Boolean = true;
		//public static var debugging:Boolean = false;
		private static var debugTextField:TextField;
		
		public function Debugger()
		{
			debugTextField = new TextField();
		}
		public static function SetWidth(w:Number):void
		{
			if(debugTextField == null)
				debugTextField = new TextField();
			debugTextField.width = w;
		}
		public static function getDebugger():TextField
		{
			if(debugTextField == null)
				debugTextField = new TextField();
			return debugTextField;
		}
		public static function Append(str:String):void
		{
			if(!debugging)
				return;
			if(debugTextField == null)
				debugTextField = new TextField();
			//debugTextField.text += str;
			debugTextField.appendText(str);
		}
		public static function Print(str:String):void
		{
			if(!debugging)
				return;
			if(debugTextField == null)
				debugTextField = new TextField();
			debugTextField.text = str;
		}
	}
}