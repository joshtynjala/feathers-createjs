package feathers.layout
{
	import feathers.core.IFeathersDisplayObject;
	
	/**
	 * Dispatched when a property of the display object's layout data changes.
	 *
	 * @eventType feathers.events.FeathersEventType.LAYOUT_DATA_CHANGE
	 */
	[Event(name="layoutDataChange",type="feathers.events.FeathersEvent")]
	
	/**
	 * A display object that may have extra data associated with it that may be
	 * used by advanced layouts.
	 * 
	 * @see feathers.layouts.ILayout
	 */
	public interface ILayoutDisplayObject extends IFeathersDisplayObject
	{
		/**
		 * Determines if the layout should transform this object or ignore it.
		 *
		 * <p>In the following example, the display object is excluded from
		 * the layout:</p>
		 *
		 * <listing version="3.0">
		 * object.includeInLayout = false;</listing>
		 */
		function get includeInLayout():Boolean;
		
		/**
		 * @private
		 */
		function set includeInLayout(value:Boolean):void;

		/**
		 * Extra parameters associated with this display object that will be
		 * used by the layout algorithm.
		 */
		function get layoutData():ILayoutData;
		
		/**
		 * @private
		 */
		function set layoutData(value:ILayoutData):void;
	}
}