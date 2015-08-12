package feathers.controls.supportClasses
{
	import createjs.DisplayObject;
	import createjs.Graphics;
	import createjs.MouseEvent;
	import createjs.Shape;
	import createjs.Touch;
	
	import feathers.controls.ScrollPolicy;
	import feathers.core.FeathersControl;
	import feathers.core.InvalidationFlag;
	import feathers.core.MeasureBounds;
	import feathers.events.FeathersEvent;

	public class BaseScrollContainer extends FeathersControl
	{
		public function BaseScrollContainer(viewPort:IScrollViewPort)
		{
			super();
			this.viewPort = viewPort;
			this.addChildAt(DisplayObject(this.viewPort), 0);
			this._measureBounds = new MeasureBounds();
			this["baseScrollContainer_viewPort_resizeHandler"] = this.baseScrollContainer_viewPort_resizeHandler.bind(this);
			this.viewPort.addEventListener(FeathersEvent.RESIZE, this.baseScrollContainer_viewPort_resizeHandler);
			this["baseScrollContainer_mousedownHandler"] = this.baseScrollContainer_mousedownHandler.bind(this);
			this.addEventListener("mousedown", this.baseScrollContainer_mousedownHandler);
			this["baseScrollContainer_stage_stagemousemoveHandler"] = this.baseScrollContainer_stage_stagemousemoveHandler.bind(this);
			this["baseScrollContainer_stage_stagemouseupHandler"] = this.baseScrollContainer_stage_stagemouseupHandler.bind(this);
			this["baseScrollContainer_scroller_scrollCallback"] = this.baseScrollContainer_scroller_scrollCallback.bind(this);
			this["baseScrollContainer_scroller_scrollingCompleteCallback"] = this.baseScrollContainer_scroller_scrollingCompleteCallback.bind(this);
			this._scroller = new Scroller(this.baseScrollContainer_scroller_scrollCallback);
			this._scroller.options.scrollingComplete = this.baseScrollContainer_scroller_scrollingCompleteCallback;
			
			this.mask = new Shape();
		}
		
		protected var viewPort:IScrollViewPort;
		
		/**
		 * @private
		 */
		protected var _scroller:Scroller;
		
		/**
		 * @private
		 */
		protected var _scrollerClientWidth:Number;
		
		/**
		 * @private
		 */
		protected var _scrollerClientHeight:Number;
		
		/**
		 * @private
		 */
		protected var _scrollerContentWidth:Number;
		
		/**
		 * @private
		 */
		protected var _scrollerContentHeight:Number;
		
		/**
		 * @private
		 */
		protected var _scrollX:Number = 0;
		
		public function get scrollX():Number
		{
			return this._scrollX;
		}
		
		/**
		 * @private
		 */
		public function set scrollX(value:Number):void
		{
			if(this._scrollX === value)
			{
				return;
			}
			this._scrollX = value;
		}
		
		/**
		 * @private
		 */
		protected var _scrollY:Number = 0;
		
		public function get scrollY():Number
		{
			return this._scrollY;
		}
		
		/**
		 * @private
		 */
		public function set scrollY(value:Number):void
		{
			if(this._scrollY === value)
			{
				return;
			}
			this._scrollY = value;
		}
		
		/**
		 * @private
		 */
		protected var _minScrollX:Number = 0;
		
		public function get minScrollX():Number
		{
			return this._minScrollX;
		}
		
		/**
		 * @private
		 */
		protected var _minScrollY:Number = 0;
		
		public function get minScrollY():Number
		{
			return this._minScrollY;
		}
		
		/**
		 * @private
		 */
		protected var _maxScrollX:Number = 0;
		
		public function get maxScrollX():Number
		{
			return this._maxScrollX;
		}
		
		/**
		 * @private
		 */
		protected var _maxScrollY:Number = 0;
		
		public function get maxScrollY():Number
		{
			return this._maxScrollY;
		}
		
		/**
		 * @private
		 */
		protected var _scrollXPolicy:String = ScrollPolicy.AUTO;
		
		public function get scrollXPolicy():String
		{
			return this._scrollXPolicy;
		}
		
		/**
		 * @private
		 */
		public function set scrollXPolicy(value:String):void
		{
			if(this._scrollXPolicy === value)
			{
				return;
			}
			this._scrollXPolicy = value;
			this.invalidate(InvalidationFlag.SCROLL);
		}
		
		/**
		 * @private
		 */
		protected var _scrollYPolicy:String = ScrollPolicy.AUTO;
		
		public function get scrollYPolicy():String
		{
			return this._scrollYPolicy;
		}
		
		/**
		 * @private
		 */
		public function set scrollYPolicy(value:String):void
		{
			if(this._scrollYPolicy === value)
			{
				return;
			}
			this._scrollYPolicy = value;
			this.invalidate(InvalidationFlag.SCROLL);
		}

		/**
		 * @private
		 */
		protected var _measureBounds:MeasureBounds;
		
		/**
		 * @private
		 */
		protected function _getObjectsUnderPoint(x:Number, y:Number, arr:Array, mouse:Boolean, activeListener:Function = null, currentDepth:int = 0):Object
		{
			var result:Object = super._getObjectsUnderPoint(x, y, arr, mouse, activeListener, currentDepth);
			if(!result)
			{
				result = this;
			}
			return result;
		}
		
		/**
		 * @private
		 */
		override protected function commit():void
		{
			this.positionViewPort();
		}
		
		/**
		 * @private
		 */
		override protected function measure():void
		{
			this._measureBounds.width = this.explicitWidth;
			this._measureBounds.height = this.explicitHeight;
			this._measureBounds.minWidth = this.explicitMinWidth;
			this._measureBounds.minHeight = this.explicitMinHeight;
			this.viewPort.commitAndMeasure(this._measureBounds);
			this.saveMeasurements(this.viewPort.measuredWidth, this.viewPort.measuredHeight,
				this.viewPort.measuredMinWidth, this.viewPort.measuredMinHeight);
		}
		
		/**
		 * @private
		 */
		override protected function update(width:Number, height:Number):void
		{
			this.viewPort.validate();
			var contentWidth:Number = this.viewPort.width;
			var contentHeight:Number = this.viewPort.height;
			if(this._scrollerClientWidth !== width ||
				this._scrollerClientHeight !== height ||
				this._scrollerContentWidth !== contentWidth ||
				this._scrollerContentHeight !== contentHeight)
			{
				this._scrollerClientWidth = width;
				this._scrollerClientHeight = height;
				this._scrollerContentWidth = contentWidth;
				this._scrollerContentHeight = contentHeight;
				this._scroller.setDimensions(width, height, contentWidth, contentHeight);
			}
			var oldMinScrollX:Number = this._minScrollX;
			var oldMinScrollY:Number = this._minScrollY;
			var oldMaxScrollX:Number = this._maxScrollX;
			var oldMaxScrollY:Number = this._maxScrollY;
			this._maxScrollX = contentWidth - width;
			this._maxScrollY = contentHeight - height;
			if(oldMinScrollX !== this._minScrollX ||
				oldMinScrollY !== this._minScrollY ||
				oldMaxScrollX !== this._maxScrollX ||
				oldMaxScrollY !== this._maxScrollY)
			{
				FeathersEvent.dispatch(this, FeathersEvent.SCROLL, false, false);
			}
			this._scroller.options.scrollingX = this._scrollXPolicy !== ScrollPolicy.OFF && (this._scrollXPolicy !== ScrollPolicy.AUTO || contentWidth > width);
			this._scroller.options.scrollingY = this._scrollYPolicy !== ScrollPolicy.OFF && (this._scrollYPolicy !== ScrollPolicy.AUTO || contentHeight > height);
			
			var maskGraphics:Graphics = this.mask.graphics;
			maskGraphics.clear();
			maskGraphics.beginFill("#ff00ff");
			maskGraphics.drawRect(0, 0, width, height);
			maskGraphics.endFill();
		}
		
		/**
		 * @private
		 */
		protected function positionViewPort():void
		{
			DisplayObject(this.viewPort).x = -this._scrollX;
			DisplayObject(this.viewPort).y = -this._scrollY;
		}
		
		/**
		 * @private
		 */
		protected function baseScrollContainer_scroller_scrollCallback(left:Number, top:Number, zoom:Number):void
		{
			this._scrollX = Math.round(left);
			this._scrollY = Math.round(top);
			this.positionViewPort();
			FeathersEvent.dispatch(this, FeathersEvent.SCROLL, false, false);
		}
		
		/**
		 * @private
		 */
		protected function baseScrollContainer_scroller_scrollingCompleteCallback():void
		{
			FeathersEvent.dispatch(this, FeathersEvent.SCROLL_COMPLETE, false, false);
		}
		
		/**
		 * @private
		 */
		protected function baseScrollContainer_mousedownHandler(event:createjs.MouseEvent):void
		{
			var nativeEvent:UIEvent = event.nativeEvent;
			if("ontouchstart" in window) //TouchEvent
			{
				var touches:Object = TouchEvent(nativeEvent).touches;
			}
			else //MouseEvent and PointerEvent
			{
				touches = [nativeEvent];
			}
			this._scroller.doTouchStart(touches, nativeEvent.timeStamp);
			this.getStage().addEventListener("stagemousemove", this.baseScrollContainer_stage_stagemousemoveHandler);
			this.getStage().addEventListener("stagemouseup", this.baseScrollContainer_stage_stagemouseupHandler);
		}
		
		/**
		 * @private
		 */
		protected function baseScrollContainer_stage_stagemousemoveHandler(event:createjs.MouseEvent):void
		{
			var nativeEvent:UIEvent = event.nativeEvent;
			if("ontouchstart" in window) //TouchEvent
			{
				var touches:Object = TouchEvent(nativeEvent).touches;
			}
			else //MouseEvent and PointerEvent
			{
				touches = [nativeEvent];
			}
			this._scroller.doTouchMove(touches, nativeEvent.timeStamp);
		}
		
		/**
		 * @private
		 */
		protected function baseScrollContainer_stage_stagemouseupHandler(event:createjs.MouseEvent):void
		{
			this._scroller.doTouchEnd(event.nativeEvent.timeStamp);
			this.getStage().removeEventListener("stagemousemove", this.baseScrollContainer_stage_stagemousemoveHandler);
			this.getStage().removeEventListener("stagemouseup", this.baseScrollContainer_stage_stagemouseupHandler);
		}
		
		/**
		 * @private
		 */
		protected function baseScrollContainer_viewPort_resizeHandler(event:FeathersEvent):void
		{
			this.invalidate(InvalidationFlag.SIZE);
		}
	}
}