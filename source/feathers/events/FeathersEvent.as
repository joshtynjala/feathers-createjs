package feathers.events
{
	import createjs.Event;
	import createjs.EventDispatcher;

	public class FeathersEvent extends createjs.Event
	{
		public static const CHANGE:String = "change";
		public static const COMPLETE:String = "complete";
		public static const CREATION_COMPLETE:String = "creationComplete";
		public static const INITIALIZE:String = "initialize";
		public static const LAYOUT_DATA_CHANGE:String = "layoutDataChange";
		public static const READY:String = "ready";
		public static const REFRESH:String = "refresh";
		public static const RESIZE:String = "resize";
		public static const SCROLL:String = "scroll";
		public static const SCROLL_COMPLETE:String = "scrollComplete";
		public static const STATE_CHANGE:String = "stateChange";
		public static const TRIGGER:String = "trigger";

		/**
		 * @private
		 */
		protected static const EVENT_POOL:Vector.<FeathersEvent> = new <FeathersEvent>[];

		/**
		 * Dispatches an event from the object pool to improve performance by
		 * avoiding garbage collection.
		 */
		public static function dispatch(dispatcher:EventDispatcher, type:String, bubbles:Boolean = false, cancelable:Boolean = false, data:* = null):Boolean
		{
			var event:FeathersEvent;
			if(EVENT_POOL.length > 0)
			{
				event = EVENT_POOL.pop().reset(type, bubbles, cancelable, data);
			}
			else
			{
				event = new FeathersEvent(type, bubbles, cancelable, data);
			}
			
			var result:Boolean = dispatcher.dispatchEvent(event);
			
			//clear the things that would be considered memory leaks, but we'll
			//use reset() everything else.
			event.data = null;
			event.target = null;
			event.currentTarget = null;
			EVENT_POOL[EVENT_POOL.length] = event;
			
			return result;
		}

		/**
		 * Constructor.
		 */
		public function FeathersEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false, data:* = null)
		{
			super(type, bubbles, cancelable);
			this.data = data;
		}

		/**
		 * Optional, extra data to associate with the event.
		 */
		public var data:* = null;

		/**
		 * Resets all properties on the event, as if it were just instantiated.
		 */
		public function reset(type:String, bubbles:Boolean = false, cancelable:Boolean = false, data:* = null):FeathersEvent
		{
			this.type = type;
			this.bubbles = bubbles;
			this.cancelable = cancelable;
			this.data = data;
			this.timeStamp = Date.now();
			this.eventPhase = 0;
			this.defaultPrevented = false;
			this.propagationStopped = false;
			this.immediatePropagationStopped = false;
			this.removed = false;
			return this;
		}
	}
}