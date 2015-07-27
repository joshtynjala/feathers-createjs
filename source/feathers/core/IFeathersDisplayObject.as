package feathers.core
{
	[Event(name="resize",type="feathers.events.FeathersEvent")]
	
	public interface IFeathersDisplayObject extends IFeathersEventDispatcher
	{
		function get depth():int;
		
		//function get x():Number;
		//function get y():Number;
		
		function get width():Number;
		function set width(value:Number):void;
		
		function get height():Number;
		function set height(value:Number):void;
		
		function get minWidth():Number;
		function set minWidth(value:Number):void;
		
		function get minHeight():Number;
		function set minHeight(value:Number):void;
		
		function get measuredWidth():Number;
		function get measuredHeight():Number;
		
		function get measuredMinWidth():Number;
		function get measuredMinHeight():Number;
		
		function get maxWidth():Number;
		function set maxWidth(value:Number):void;
		
		function get maxHeight():Number;
		function set maxHeight(value:Number):void;
		
		//function get parent():Container;
		
		function move(x:Number, y:Number):void;
		function setSize(width:Number, height:Number):void;
		
		function commitAndMeasure(withBounds:MeasureBounds = null):void;
	}
}