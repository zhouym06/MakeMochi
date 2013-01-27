package Utils
{
	import flash.text.TextFormat;

	public class Constants
	{
		public static var MOCHI_NUMBER:int = 10;
		public static var BACK_DELAY_INTEVAL:int = 500;
		public static var COUNT_DOWN_INTEVAL:int = 1000;
		
		public static var FASTEST_INTEVAL:int = 25;
		public static var SLOWEST_INTEVAL:int = 70;
		public static var INIT_INTEVAL:int = 60;
		
		
		public static var INIT_TIME:int = 40;
		public static var INIT_LIFE:int = 5;
		public static var INIT_SCORE:int = 0;
		
		public static var TIME_BAR_LEFT:int = -336;
		public static var TIME_BAR_RIGHT:int = 34;
		
		public static var TIMER_FONT_NAME:String = "Jokerman";
		//public static var TIMER_FONT_NAME:String = "Gill Sans Ultra Bold";
		//public static var TIMER_FONT_NAME:String = "Ravie"
		public static var TIMER_FONT:TextFormat = new TextFormat(TIMER_FONT_NAME, 24 ,0xFF0000);
		
		public static var COMMENT_FONT_NAME:String = "Arial";
		public static var COMMENT_FONT:TextFormat = new TextFormat(COMMENT_FONT_NAME, 18 ,0x000000);
		
		public static var MoChiName:Array = ["いちご大福",
			"草餅", "水饅頭", "柏餅",
			"花見だんご", "豆大福", "萩の餅",
			"御手洗団子", "もみじ饅頭", "紅白まんじゅう"];
		
		public static var MoChiComment:Array = [
			"正月にも使えそうないちご大福のアイコンです。筆者はいちご大福と言えばこしあん。こしあん一筋。いちごの入っていない大福にいちごをブチ込むという暴挙に出たこともあるぐらい、いちご大福は大好きです。流石に白い目で見られました。たはー。",
			"草餅はもともとハハコグサを使って作られていました。ひな壇に飾る菱餅の最下段がこの草餅。しかし現在の草餅はヨモギを使った蓬餅を指すことが多く、私も草餅を蓬餅のつもりで描いて、あとで気づいた次第です。私は餡が入っているのより、きなこと黒蜜をかけたほうが断然お気に入りです。こしあんは許せる。ただしつぶあんテメーはダメだ。", 
			"水饅頭、葛饅頭、水仙饅頭   葛粉を使った生地と餡玉をお猪口に入れて固めた、夏季ならではの生菓子。「水の都」岐阜県大垣市で、明治初期に生まれたんだとか。そのまま器に盛っても良いですが、水に浮かべても涼し気です。 水まんじゅうの素に、伊那食品工業の「露草（つゆくさ）」があるみたいなので、家庭でもあのぷるぷるもっちり感が再現できそうですね！", 
			"こしあん、つぶあん、みそあんなどを包んだ上新粉の餅を、柏の葉でくるんだ和菓子。端午の節句の供え物です。柏の葉は新芽が育つまでは古い葉が落ちないので、家系が途切れないという意味で「子孫繁栄」の願いを込めているんだそうな。元々は東日本人の文化らしいです。地元人として知っていなきゃいけないですよね。反省反省。",
			"奈良時代の貴族の行事が起源の花見。奈良時代は中国から渡来した梅を鑑賞したが、平安時代になると桜に移り変わったという。花見団子は江戸時代からの定番で、春の桜を「桜色」、冬の名残を雪として「白色」、夏への予兆をヨモギを使った「緑色」で表現しているそうな。「花より団子」とは言いますが、団子にも風情があるんですね～。", 
			"豆大福は、赤エンドウや大豆を混ぜた大福で、古くから東京を代表する和菓子。東京には多くの豆大福店がありますが、その中でも有名な「東京三大豆大福」というのがありまして、音羽の「群林堂」、原宿の「瑞穂」、高輪の「松島屋」が美味しいらしい。私は豆大福にそれほど縁がなかったけれど、名店の豆大福はやっぱり食べてみたいです。", 
			"萩の餅、御萩 現代ではおはぎとぼたもちの区別はあまり無く、地域によっても区別の仕方が違うそうです。 正式には季節によって名称が変わるだけなんだそうな。 春は「牡丹餅」、夏は「夜船」、秋は「御萩」、冬は「北窓」と、それぞれ由来のある名前があるんですね～。 おはぎに対して、中身が完全な餅になっているのが、「あんころ餅」なんだそうです。 アイコンは左がつぶあん、右をこしあんにしてみました。",
			"御手洗団子 みたらし団子は、３～５個のだんごを串に挿し、火に炙って焼き目を付け、甘辛だれをかけたもの。 京都市左京区下鴨の加茂みたらし茶屋が発祥。 下鴨神社にある御手洗池（みたらしのいけ）の水泡を模しているとか。 やっぱり甘辛だれはとろりとしていて、だんごは柔らかい手作りのがいいですよね！", 
			"もみじ饅頭 広島県厳島の名産、もみじまんじゅう。通称もみまん。 カステラ生地であんを包み、もみじの葉型に入れて焼き上げたもで、基本はこしあん。 発祥は厳島の菓子職人・高津常助とされていて、名所・紅葉谷の旅館に要人が多く宿泊していたことから、紅葉谷の名にふさわしいお菓子を仲居に頼まれて作ったそうな。 2002年からは揚げもみじが発売。私は未経験ですが、なんだかサクサクしそうな見た目です！ ", 
			"お祝い事に配られる２つ１組の饅頭。なんと、日本の「紅白」の起源は源平合戦にあるという説が。源氏が白旗、平氏が赤旗を掲げて戦ったらしいです。日本史が苦手な筆者は知りませんでしたよ・・・。他にも「ハレ」と「ケ」説、赤飯説など。イメージだと紅白まんじゅうはこしあんなんですが、他の餡もあったりするんでしょうか？"
		];
		
		public function Constants()
		{
		}
		
		public static function GetMoChiName(index:int):String
		{
			return MoChiName[index - 1];
		}
		public static function GetMoChiComment(index:int):String
		{
			return MoChiComment[index - 1];
		}
		
	}
}