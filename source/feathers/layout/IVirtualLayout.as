package feathers.layout
{
	public interface IVirtualLayout extends ILayout
	{
		function get useVirtualLayout():Boolean;
		
		/**
		 * @private
		 */
		function set useVirtualLayout(value:Boolean):void;
	}
}