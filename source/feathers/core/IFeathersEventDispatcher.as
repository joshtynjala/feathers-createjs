package feathers.core
{
	public interface IFeathersEventDispatcher
	{
		function addEventListener(type:String, listener:Object, useCapture:Boolean = false):Object;
		function removeEventListener(type:String, listener:Object, useCapture:Boolean = false):void;
		function dispatchEvent(event:Object, bubbles:Boolean = false, cancelable:Boolean = false):Boolean;
		function hasEventListener(type:String):Boolean;
		function willTrigger(type:String):Boolean;
		function on(type:String, listener:Object, scope:Object = null, once:Boolean = false, data:* = null, useCapture:Boolean = false):Function;
		function off(type:String, listener:Object, useCapture:Boolean = false):void;
		function removeAllEventListeners(type:String = null):void;
	}
}