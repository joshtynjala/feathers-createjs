package feathers.core
{
	public interface IValidating
	{
		function invalidate(flag:String = null):void;
		function validate():void;
	}
}