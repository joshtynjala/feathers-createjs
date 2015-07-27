package feathers.core
{
	public interface IFeathersControl extends IFeathersDisplayObject, IValidating
	{
		function get enabled():Boolean;
		function set enabled(value:Boolean):void;
	}
}