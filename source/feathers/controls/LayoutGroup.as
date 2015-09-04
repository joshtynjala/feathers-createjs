package feathers.controls
{
	import createjs.DisplayObject;
	
	import feathers.core.FeathersControl;
	import feathers.core.IFeathersDisplayObject;
	import feathers.core.InvalidationFlag;
	import feathers.core.MeasureBounds;
	import feathers.events.FeathersEvent;
	import feathers.layout.ILayout;
	import feathers.layout.ILayoutDisplayObject;
	import feathers.layout.IVirtualLayout;

	public class LayoutGroup extends FeathersControl
	{
		/**
		 * Constructor.
		 */
		public function LayoutGroup()
		{
			this.items = new Vector.<DisplayObject>();
			super();
		}
		
		/**
		 * 
		 */
		protected var items:Vector.<DisplayObject>;
		
		/**
		 * @private
		 */
		protected var _ignoreChildChanges:Boolean;
		
		/**
		 * @private
		 */
		protected var _layout:ILayout;
		
		/**
		 * Controls the way that the group's children are positioned and sized.
		 *
		 * <p>The following example tells the group to use a horizontal layout:</p>
		 *
		 * <listing version="3.0">
		 * var layout:HorizontalLayout = new HorizontalLayout();
		 * layout.gap = 20;
		 * layout.padding = 20;
		 * container.layout = layout;</listing>
		 *
		 * @default null
		 */
		public function get layout():ILayout
		{
			return this._layout;
		}
		
		/**
		 * @private
		 */
		public function set layout(value:ILayout):void
		{
			if(this._layout == value)
			{
				return;
			}
			if(this._layout)
			{
				this._layout.removeEventListener(FeathersEvent.CHANGE, layout_changeHandler);
			}
			this._layout = value;
			if(this._layout)
			{
				if(this._layout is IVirtualLayout)
				{
					IVirtualLayout(this._layout).useVirtualLayout = false;
				}
				this._layout.addEventListener(FeathersEvent.CHANGE, layout_changeHandler);
			}
			this.invalidate(InvalidationFlag.LAYOUT);
		}
		
		/**
		 * @private
		 */
		override public function addChild(child:DisplayObject):DisplayObject
		{
			this.addChildToLayout(child, this.children.length);
			return super.addChild(child);
		}
		
		/**
		 * @private
		 */
		override public function addChildAt(child:DisplayObject, index:Number):DisplayObject
		{
			this.addChildToLayout(child, index);
			return super.addChildAt(child, index);
		}
		
		/**
		 * @private
		 */
		override public function removeChildAt(index:Number):Boolean
		{
			var child:DisplayObject = this.getChildAt(index);
			if(child is IFeathersDisplayObject)
			{
				child.removeEventListener(FeathersEvent.RESIZE, child_resizeHandler);
			}
			if(child is ILayoutDisplayObject)
			{
				child.removeEventListener(FeathersEvent.LAYOUT_DATA_CHANGE, child_layoutDataChangeHandler);
			}
			this.items.splice(index, 1);
			this.invalidate(InvalidationFlag.LAYOUT);
			var result:Boolean = super.removeChildAt(index);
			return result;
		}
		
		/**
		 * @private
		 */
		override public function setChildIndex(child:DisplayObject, index:Number):void
		{
			super.setChildIndex(child, index);
			var oldIndex:int = this.items.indexOf(child);
			if(oldIndex == index)
			{
				return;
			}
			
			//the super function already checks if oldIndex < 0, and throws an
			//appropriate error, so no need to do it again!
			
			this.items.splice(oldIndex, 1);
			this.items.splice(index, 0, child);
			this.invalidate(InvalidationFlag.LAYOUT);
		}
		
		/**
		 * @private
		 */
		override public function swapChildrenAt(index1:Number, index2:Number):void
		{
			super.swapChildrenAt(index1, index2)
			var child1:DisplayObject = this.items[index1];
			var child2:DisplayObject = this.items[index2];
			this.items[index1] = child2;
			this.items[index2] = child1;
			this.invalidate(InvalidationFlag.LAYOUT);
		}
		
		/**
		 * @private
		 */
		override public function sortChildren(compareFunction:Function):void
		{
			super.sortChildren(compareFunction);
			this.items.sort(compareFunction);
			this.invalidate(InvalidationFlag.LAYOUT);
		}
		
		/**
		 * @private
		 */
		override protected function update(width:Number, height:Number):void
		{
			var oldIgnoreChildChanges:Boolean = this._ignoreChildChanges;
			this._ignoreChildChanges = true;
			if(this._layout)
			{
				this._layout.layout(this.items);
			}
			this._ignoreChildChanges = oldIgnoreChildChanges;
		}
		
		/**
		 * @private
		 */
		protected function addChildToLayout(child:DisplayObject, index:int):void
		{
			if(child is IFeathersDisplayObject)
			{
				child.addEventListener(FeathersEvent.RESIZE, child_resizeHandler);
			}
			if(child is ILayoutDisplayObject)
			{
				child.addEventListener(FeathersEvent.LAYOUT_DATA_CHANGE, child_layoutDataChangeHandler);
			}
			var oldIndex:int = this.items.indexOf(child);
			if(oldIndex === index)
			{
				return;
			}
			if(oldIndex >= 0)
			{
				this.items.splice(oldIndex, 1);
			}
			var itemCount:int = this.items.length;
			if(index === itemCount)
			{
				//faster than splice because it avoids gc
				this.items[index] = child;
			}
			else
			{
				this.items.splice(index, 0, child);
			}
			this.invalidate(InvalidationFlag.LAYOUT);
		}
		
		/**
		 * @private
		 */
		protected function layout_changeHandler(event:FeathersEvent):void
		{
			this.invalidate(InvalidationFlag.STYLES);
		}
		
		/**
		 * @private
		 */
		protected function child_resizeHandler(event:FeathersEvent):void
		{
			if(this._ignoreChildChanges)
			{
				return;
			}
			this.invalidate(InvalidationFlag.LAYOUT);
		}
		
		/**
		 * @private
		 */
		protected function child_layoutDataChangeHandler(event:FeathersEvent):void
		{
			if(this._ignoreChildChanges)
			{
				return;
			}
			this.invalidate(InvalidationFlag.LAYOUT);
		}
	}
}