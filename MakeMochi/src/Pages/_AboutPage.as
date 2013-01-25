package Pages
{
	import flash.display.*;
	import flash.events.*;
	import flash.text.*;
	import Utils.*;
	
	
	public class _AboutPage extends AboutPage
	{
		public function _AboutPage(w:int, h:int)
		{
			super();
			width  = w;
			height = h;
			x = w / 2;
			y = h / 2;
			//Text
			(getChildAt(1) as TextField).autoSize="left";
			(getChildAt(1) as TextField).wordWrap=true;
			(getChildAt(1) as TextField).multiline=true;
			(getChildAt(1) as TextField).htmlText = "" +
				"		Mochi is a traditional food for the Japanese New Year. It is made of sticky rice and needs quite a lot of beating and rubbing. " + 
				"Workers using traditional methods take heavy physical labour and developed their art. " +
				"They can pound the paste with a hammer and rub it at the same time in an incredible speed. " +
				"Read more in <a href='http://en.wikipedia.org/wiki/Rice_cake'>Wikipedia</a> and " +
				"<a href='http://www.youtube.com/results?search_query=fast+mochi'>Youtube</a>.\n"
				+
				"		This game is made by <a href='yimingzhou060143@126.com'>Zhou Yiming</a> for <a href='http://unitt.topcareer.jp/2012/'>UNITT</a>. " +
				"I would like to thank 4th Valley for holding such a competition. And also to 京都アニメーション, " +
				"the game's theme is inspired by their <a href='http://ja.wikipedia.org/wiki/%E3%81%9F%E3%81%BE%E3%81%93%E3%81%BE%E3%83%BC%E3%81%91%E3%81%A3%E3%81%A8'>たまこまーけっと</a>. " +
				"I laughed so much for the charactors' name because they remind me of <a href='http://www.youtube.com/watch?v=SnmV2yOtuN0'>《大保镖》</a>.\n"
				+
				"		Since time is limited in 2 weeks and I am disabled with art. I was useing any resources I can find from the internet." +
				"Please inform me if any right is infringed.\n";
			(getChildAt(1) as TextField).selectable = false;
			//Button
			getChildAt(3).addEventListener(MouseEvent.CLICK, BackButtonClicked);
		}
		public function BackButtonClicked(e:Event):void
		{
			Debugger.Print("BackButtonClicked:" + e.toString());
			var bButClickedEvent:MoChiEvent = new MoChiEvent(MoChiEvent.TRANSFER_PAGE);
			bButClickedEvent.SetToPage(MoChiEvent.TO_OP);
			bButClickedEvent.SetFromPage(MoChiEvent.FROM_ABOUT);
			dispatchEvent(bButClickedEvent);
		}
	}
}