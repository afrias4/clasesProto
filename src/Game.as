package 
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import Utils.start.DStarling;
	/**
	 * ...
	 * @author isil
	 */
	public class Game extends Sprite
	{
		
		private var contador:int = 1;
		public function Game() 
		{
	
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		private function onAdded(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		public function start():void
		{
			var back:Image = new Image(DStarling.assetsManager.getTexture("scene1"));
			addChild(back);
			back.x = 0;
			back.y = 0;
			back.width = stage.stageWidth;
			back.height = stage.stageHeight;
			var timer:Timer = new Timer(1000);
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			timer.start();
			stage.addEventListener(TouchEvent.TOUCH,onTouch);
		}
		
		private function onTimer(e:TimerEvent):void 
		{
			
			
			if (contador % 3 == 0)
			{
				var mc2:Image = new Image(DStarling.assetsManager.getTexture("coin"));
				addChild(mc2);
				mc2.x = Math.random() * stage.stageWidth;
				mc2.y = Math.random() * stage.stageHeight;
				mc2.addEventListener(TouchEvent.TOUCH, onTouch);
				contador++;
				mc2.name = 'coin';
				return;
			}
				var mc:MovieClip = new MovieClip(DStarling.assetsManager.getTextures("walk000"));
				addChild(mc);
				mc.x = Math.random() * stage.stageWidth;
				mc.y = Math.random() * stage.stageHeight;
				Starling.juggler.add(mc);
				mc.addEventListener(TouchEvent.TOUCH, onTouch);
				contador++;
				mc.name = 'green';
		}
		
		private function onTouch2(e:TouchEvent):void 
		{
			var mc2:Image = e.currentTarget as Image;
			var touch:Touch = e.getTouch(mc2);
			if (touch != null)
			{
				if (touch.phase == TouchPhase.BEGAN)
				{
					removeChild(mc2);
					mc2.removeEventListener(TouchEvent.TOUCH, onTouch);
				}
			}
			
		}
		
		private function onTouch(e:TouchEvent):void 
		{
			var touch:Touch = e.getTouch(this);
			if (touch != null)
			{
				if (touch.phase == TouchPhase.BEGAN)
				{
					var content:DisplayObject = e.target as DisplayObject;
					if (content.name == 'coin' || content.name == 'green')
					{
						removeChild(content);
					}
				}
			}
			
		}
		
		
	}

}