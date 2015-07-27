package feathers.layout
{
	import createjs.DisplayObject;
	
	import feathers.core.IFeathersEventDispatcher;

	public interface ILayout extends IFeathersEventDispatcher
	{
		function layout(items:Vector.<DisplayObject>):void;
	}
}