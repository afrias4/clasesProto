package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import Utils.start.DStarling;
	
	/**
	 * ...
	 * @author ISIL
	 */
	[SWF(frameRate=60,height=600,width=480)]
	public class Main extends Sprite 
	{
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			var assets:Vector.<String> = new Vector.<String>();
			assets.push('assets/scene1.png');
			assets.push('assets/coin.png');
			assets.push('assets/spritewalk.png');
			assets.push('assets/spritewalk.xml');
			DStarling.init(Game, stage, assets, startGame);
		
			
		}
		
		private function startGame():void
		{
			trace("Star Game");
		}
	}
	
}