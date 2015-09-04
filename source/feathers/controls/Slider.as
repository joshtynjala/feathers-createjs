package feathers.controls
{
	import createjs.DisplayObject;
	import createjs.EventDispatcher;
	import createjs.MouseEvent;
	import createjs.Point;
	
	import feathers.core.FeathersControl;
	import feathers.core.IFeathersDisplayObject;
	import feathers.core.IValidating;
	import feathers.core.InvalidationFlag;
	import feathers.core.MeasureBounds;
	import feathers.events.FeathersEvent;
	
	public class Slider extends FeathersControl
	{
		/**
		 * Constructor.
		 */
		public function Slider()
		{
			super();
		}
		
		/**
		 * @private
		 */
		protected var _direction:String = Direction.HORIZONTAL;
		
		public function get direction():String
		{
			return this._direction;
		}
		
		/**
		 * @private
		 */
		public function set direction(value:String):void
		{
			if(this._direction === value)
			{
				return;
			}
			this._direction = value;
			this.invalidate(InvalidationFlag.STYLES);
		}
		
		/**
		 * @private
		 */
		protected var _minimum:Number = 0;
		
		public function get minimum():Number
		{
			return this._minimum;
		}
		
		/**
		 * @private
		 */
		public function set minimum(value:Number):void
		{
			if(this._minimum === value)
			{
				return;
			}
			this._minimum = value;
			this.invalidate(InvalidationFlag.DATA);
		}
		
		/**
		 * @private
		 */
		protected var _maximum:Number = 1;
		
		public function get maximum():Number
		{
			return this._maximum;
		}
		
		/**
		 * @private
		 */
		public function set maximum(value:Number):void
		{
			if(this._maximum === value)
			{
				return;
			}
			this._maximum = value;
			this.invalidate(InvalidationFlag.DATA);
		}
		
		/**
		 * @private
		 */
		protected var _value:Number = 0;
		
		public function get value():Number
		{
			return this._value;
		}
		
		/**
		 * @private
		 */
		public function set value(newValue:Number):void
		{
			if(this._step !== 0 && newValue !== this._maximum && newValue !== this._minimum)
			{
				newValue = this._minimum + Math.round((newValue - this._minimum) / this._step) * this._step;
			}
			if(newValue < this._minimum)
			{
				newValue = this._minimum;
			}
			else if(newValue > this._maximum)
			{
				newValue = this._maximum;
			}
			if(this._value === newValue)
			{
				return;
			}
			this._value = newValue;
			this.invalidate(InvalidationFlag.DATA);
			if(this._liveDragging || !this.isDragging)
			{
				FeathersEvent.dispatch(this, FeathersEvent.CHANGE, false, false);
			}
		}
		
		/**
		 * @private
		 */
		protected var _step:Number = 0;
		
		public function get step():Number
		{
			return this._step;
		}
		
		/**
		 * @private
		 */
		public function set step(value:Number):void
		{
			this._step = value;
		}
		
		/**
		 * @private
		 */
		protected var _minimumPadding:Number = 0;
		
		public function get minimumPadding():Number
		{
			return this._minimumPadding;
		}
		
		/**
		 * @private
		 */
		public function set minimumPadding(value:Number):void
		{
			if(this._minimumPadding === value)
			{
				return;
			}
			this._minimumPadding = value;
			this.invalidate(InvalidationFlag.STYLES);
		}
		
		/**
		 * @private
		 */
		protected var _maximumPadding:Number = 0;
		
		public function get maximumPadding():Number
		{
			return this._maximumPadding;
		}
		
		/**
		 * @private
		 */
		public function set maximumPadding(value:Number):void
		{
			if(this._maximumPadding === value)
			{
				return;
			}
			this._maximumPadding = value;
			this.invalidate(InvalidationFlag.STYLES);
		}
		
		protected var _thumbStartX:Number;
		protected var _thumbStartY:Number;
		protected var _pointerStartX:Number;
		protected var _pointerStartY:Number;
		
		protected var isDragging:Boolean = false;
		
		/**
		 * @private
		 */
		protected var _liveDragging:Boolean = true;
		
		public function get liveDragging():Boolean
		{
			return this._liveDragging;
		}
		
		/**
		 * @private
		 */
		public function set liveDragging(value:Boolean):void
		{
			this._liveDragging = value;
		}
		
		/**
		 * @private
		 */
		protected var _thumbSkin:IFeathersDisplayObject;
		
		public function get thumbSkin():IFeathersDisplayObject
		{
			return this._thumbSkin;
		}
		
		/**
		 * @private
		 */
		public function set thumbSkin(value:IFeathersDisplayObject):void
		{
			if(this._thumbSkin === value)
			{
				return;
			}
			var oldSkin:DisplayObject = this._thumbSkin as DisplayObject;
			if(oldSkin)
			{
				this._thumbSkin.removeEventListener("mousedown", thumbSkin_mousedownHandler);
				this._thumbSkin.removeEventListener(FeathersEvent.RESIZE, thumbSkin_resizeHandler);
				if(oldSkin.parent === this)
				{
					this.removeChild(oldSkin);
				}
			}
			this._thumbSkin = value;
			if(this._thumbSkin)
			{
				this.addChild(DisplayObject(this._thumbSkin));
				this._thumbSkin.addEventListener(FeathersEvent.RESIZE, thumbSkin_resizeHandler);
				this._thumbSkin.addEventListener("mousedown", thumbSkin_mousedownHandler);
			}
			this.invalidate(InvalidationFlag.STYLES);
		}
		
		/**
		 * @private
		 */
		protected var _trackSkin:IFeathersDisplayObject;
		
		public function get trackSkin():IFeathersDisplayObject
		{
			return this._trackSkin;
		}
		
		/**
		 * @private
		 */
		public function set trackSkin(value:IFeathersDisplayObject):void
		{
			if(this._trackSkin === value)
			{
				return;
			}
			var oldSkin:DisplayObject = this._trackSkin as DisplayObject;
			if(oldSkin)
			{
				this._trackSkin.removeEventListener(FeathersEvent.RESIZE, trackSkin_resizeHandler);
				if(oldSkin.parent === this)
				{
					this.removeChild(oldSkin);
				}
			}
			this._trackSkin = value;
			if(this._trackSkin)
			{
				this.addChildAt(DisplayObject(this._trackSkin), 0);
				this._trackSkin.addEventListener(FeathersEvent.RESIZE, trackSkin_resizeHandler);
			}
			this.invalidate(InvalidationFlag.STYLES);
		}
		
		/**
		 * @private
		 */
		protected var _measureBounds:MeasureBounds;
		
		/**
		 * @private
		 */
		override protected function measure():void
		{
			var measuredWidth:Number = 0;
			var measuredHeight:Number = 0;
			if(this._trackSkin)
			{
				if(!this._measureBounds)
				{
					this._measureBounds = new MeasureBounds();
				}
				else
				{
					this._measureBounds.reset();
				}
				if(this._direction === Direction.HORIZONTAL)
				{
					this._measureBounds.width = this.explicitWidth;
					this._measureBounds.minWidth = this.explicitMinWidth;
				}
				else
				{
					this._measureBounds.height = this.explicitHeight;
					this._measureBounds.minHeight = this.explicitMinHeight;
				}
				this._trackSkin.commitAndMeasure(this._measureBounds);
				measuredWidth = this._trackSkin.measuredWidth;
				measuredHeight = this._trackSkin.measuredHeight;
			}
			if(this._thumbSkin)
			{
				//the thumb will not be resized, so we can ask for its
				//dimensions without restrictions
				this._thumbSkin.commitAndMeasure();
				var thumbMeasuredWidth:Number = this._thumbSkin.measuredWidth;
				if(thumbMeasuredWidth > measuredWidth)
				{
					measuredWidth = thumbMeasuredWidth;
				}
				var thumbMeasuredHeight:Number = this._thumbSkin.measuredHeight;
				if(thumbMeasuredHeight > measuredHeight)
				{
					measuredHeight = thumbMeasuredHeight;
				}
			}
			this.saveMeasurements(measuredWidth, measuredHeight, measuredWidth, measuredHeight);
		}
		
		/**
		 * @private
		 */
		override protected function update(width:Number, height:Number):void
		{
			if(this._trackSkin)
			{
				this._trackSkin.move(0, 0);
				if(this._direction === Direction.VERTICAL)
				{
					this._trackSkin.height = height;
					DisplayObject(this._trackSkin).x = Math.round((width - this._trackSkin.width) / 2);
				}
				else //horizontal
				{
					this._trackSkin.width = width;
					DisplayObject(this._trackSkin).y = Math.round((height - this._trackSkin.height) / 2);
				}
			}
			if(this._thumbSkin)
			{
				this.updateThumbPosition();
			}
		}
		
		/**
		 * @private
		 */
		protected function updateThumbPosition():void
		{
			//this will auto-size the thumb, if needed
			if(this._thumbSkin is IValidating)
			{
				IValidating(this._thumbSkin).validate();
			}
			
			if(this._direction == Direction.VERTICAL)
			{
				var trackScrollableHeight:Number = this.layoutHeight - this._thumbSkin.height - this._minimumPadding - this._maximumPadding;
				DisplayObject(this._thumbSkin).x = (this.layoutWidth - this._thumbSkin.width) / 2;
				DisplayObject(this._thumbSkin).y = this._minimumPadding + trackScrollableHeight * (1 - (this._value - this._minimum) / (this._maximum - this._minimum));
			}
			else // horizontal
			{
				var trackScrollableWidth:Number = this.layoutWidth - this._thumbSkin.width - this._minimumPadding - this._maximumPadding;
				DisplayObject(this._thumbSkin).x = this._minimumPadding + (trackScrollableWidth * (this._value - this._minimum) / (this._maximum - this._minimum));
				DisplayObject(this._thumbSkin).y = (this.layoutHeight - this._thumbSkin.height) / 2;
			}
		}
		
		/**
		 * @private
		 */
		protected function locationToValue(location:Point):Number
		{
			var percentage:Number;
			if(this._direction == Direction.VERTICAL)
			{
				var trackScrollableHeight:Number = this.layoutHeight - this._thumbSkin.height - this._minimumPadding - this._maximumPadding;
				var yPosition:Number = Math.round(this._thumbStartY + location.y - this._pointerStartY - this._maximumPadding);
				if(yPosition < 0)
				{
					yPosition = 0;
				}
				else if(yPosition > trackScrollableHeight)
				{
					yPosition = trackScrollableHeight;
				}
				percentage = 1 - (yPosition / trackScrollableHeight);
			}
			else //horizontal
			{
				var trackScrollableWidth:Number = this.layoutWidth - this._thumbSkin.width - this._minimumPadding - this._maximumPadding;
				var xPosition:Number = Math.round(this._thumbStartX + location.x - this._pointerStartX - this._minimumPadding);
				if(xPosition < 0)
				{
					xPosition = 0;
				}
				else if(xPosition > trackScrollableWidth)
				{
					xPosition = trackScrollableWidth;
				}
				percentage = xPosition / trackScrollableWidth;
			}
			
			return this._minimum + percentage * (this._maximum - this._minimum);
		}
		
		/**
		 * @private
		 */
		protected function thumbSkin_resizeHandler(event:FeathersEvent):void
		{
			this.invalidate(InvalidationFlag.SIZE);
		}
		
		/**
		 * @private
		 */
		protected function trackSkin_resizeHandler(event:FeathersEvent):void
		{
			this.invalidate(InvalidationFlag.SIZE);
		}
		
		/**
		 * @private
		 */
		protected function thumbSkin_mousedownHandler(event:createjs.MouseEvent):void
		{
			if(!this._enabled)
			{
				return;
			}
			this.getStage().addEventListener("stagemousemove", slider_stage_stagemousemoveHandler);
			this.getStage().addEventListener("stagemouseup", slider_stage_stagemouseupHandler);
			var local:Point = this.globalToLocal(event.stageX, event.stageY);
			this._pointerStartX = local.x;
			this._pointerStartY = local.y;
			this._thumbStartX = DisplayObject(this._thumbSkin).x;
			this._thumbStartY = DisplayObject(this._thumbSkin).y;
			this.isDragging = true;
		}
		
		/**
		 * @private
		 */
		protected function slider_stage_stagemousemoveHandler(event:createjs.MouseEvent):void
		{
			if(!this._enabled)
			{
				return;
			}
			var local:Point = this.globalToLocal(event.stageX, event.stageY);
			this.value = this.locationToValue(local);
		}
		
		/**
		 * @private
		 */
		protected function slider_stage_stagemouseupHandler(event:createjs.MouseEvent):void
		{
			this.getStage().removeEventListener("stagemousemove", slider_stage_stagemousemoveHandler);
			this.getStage().removeEventListener("stagemouseup", slider_stage_stagemouseupHandler);
			this.isDragging = false;
			if(!this._liveDragging)
			{
				FeathersEvent.dispatch(this, FeathersEvent.CHANGE, false, false);
			}
		}
	}
}