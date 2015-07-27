package feathers.core
{
	import createjs.Container;
	import createjs.DisplayObject;
	import createjs.Event;
	import createjs.Rectangle;
	import createjs.Stage;
	
	import feathers.events.FeathersEvent;
	import feathers.utils.DisplayUtil;
	
	public class FeathersControl extends Container implements IFeathersControl
	{
		/**
		 * @private
		 */
		private static const INVALIDATION_FLAG_ALL:String = "all";
		
		/**
		 * @private
		 */
		protected static const ILLEGAL_WIDTH_ERROR:String = "A component's width cannot be NaN.";
		
		/**
		 * @private
		 */
		protected static const ILLEGAL_HEIGHT_ERROR:String = "A component's height cannot be NaN.";
		
		/**
		 * Constructor.
		 */
		public function FeathersControl()
		{
			super();
			this._invalidationFlags = {};
			this._delayedInvalidationFlags = {};
			this["feathersControl_addedHandler"] = this.feathersControl_addedHandler.bind(this);
			this.addEventListener("added", this.feathersControl_addedHandler);
			this["feathersControl_removedHandler"] = this.feathersControl_removedHandler.bind(this);
			this.addEventListener("removed", this.feathersControl_removedHandler);
			this["feathersControl_waitForStage_tickHandler"] = this.feathersControl_waitForStage_tickHandler.bind(this);
		}
		
		/**
		 * @private
		 */
		protected var _depth:int = -1;
		
		public function get depth():int
		{
			return this._depth;
		}
		
		/**
		 * @private
		 */
		protected var _enabled:Boolean = true;
		
		public function get enabled():Boolean
		{
			return this._enabled;
		}
		
		/**
		 * @private
		 */
		public function set enabled(value:Boolean):void
		{
			if(this._enabled === value)
			{
				return;
			}
			this._enabled = value;
			this.invalidate(InvalidationFlag.STATE);
		}
		
		/**
		 * @private
		 */
		protected var _scaledMeasuredWidth:Number = 0;
		
		/**
		 * @private
		 */
		protected var _measuredWidth:Number = 0;
		
		/**
		 * The preferred width calculated when calling
		 * <code>commitAndMeasure()</code>. The parent component may use this
		 * value to calculate its own width, but it is only a suggestion so it
		 * may be ignored instead.
		 * 
		 * @see #commitAndMeasure()
		 * @see #width
		 */
		public function get measuredWidth():Number
		{
			return this._scaledMeasuredWidth;
		}
		
		/**
		 * @private
		 */
		protected var _scaledMeasuredHeight:Number = 0;
		
		/**
		 * @private
		 */
		protected var _measuredHeight:Number = 0;
		
		/**
		 * The preferred height calculated when calling
		 * <code>commitAndMeasure()</code>. The parent component may use this
		 * value to calculate its own height, but it is only a suggestion so it
		 * may be ignored instead.
		 * 
		 * @see #commitAndMeasure()
		 * @see #height
		 */
		public function get measuredHeight():Number
		{
			return this._scaledMeasuredHeight;
		}
		
		/**
		 * @private
		 */
		protected var _scaledMeasuredMinWidth:Number = 0;
		
		/**
		 * The minimum width calculated when calling
		 * <code>commitAndMeasure()</code>. The parent component may use this
		 * value to calculate its own width, but it is only a suggestion so it
		 * may be ignored instead.
		 * 
		 * @see #commitAndMeasure()
		 * @see #minWidth
		 */
		public function get measuredMinWidth():Number
		{
			return this._scaledMeasuredMinWidth;
		}
		
		/**
		 * @private
		 */
		protected var _scaledMeasuredMinHeight:Number = 0;
		
		/**
		 * The minimum height calculated when calling
		 * <code>commitAndMeasure()</code>. The parent component may use this
		 * value to calculate its own height, but it is only a suggestion so it
		 * may be ignored instead.
		 * 
		 * @see #commitAndMeasure()
		 * @see #minHeight
		 */
		public function get measuredMinHeight():Number
		{
			return this._scaledMeasuredMinHeight;
		}
		
		protected var explicitWidth:Number = NaN;
		protected var layoutWidth:Number = 0;
		protected var _scaledLayoutWidth:Number = 0;
		
		public function get width():Number
		{
			if(isNaN(this.explicitWidth))
			{
				return this._scaledLayoutWidth;
			}
			return this.explicitWidth;
		}
		
		/**
		 * @private
		 */
		public function set width(value:Number):void
		{
			if(this.explicitWidth === value)
			{
				return;
			}
			this.explicitWidth = value;
			this.invalidate(InvalidationFlag.SIZE);
		}
		
		protected var explicitHeight:Number = NaN;
		protected var layoutHeight:Number = 0;
		protected var _scaledLayoutHeight:Number = 0;
		
		public function get height():Number
		{
			if(isNaN(this.explicitHeight))
			{
				return this._scaledLayoutHeight;
			}
			return this.explicitHeight;
		}
		
		/**
		 * @private
		 */
		public function set height(value:Number):void
		{
			if(this.explicitHeight === value)
			{
				return;
			}
			this.explicitHeight = value;
			this.invalidate(InvalidationFlag.SIZE);
		}
		
		protected var explicitMinWidth:Number = NaN;
		protected var measuredMinWidth:Number = 0;
		
		public function get minWidth():Number
		{
			if(isNaN(this.explicitMinWidth))
			{
				return this._scaledMeasuredMinWidth;
			}
			return this.explicitMinWidth;
		}
		
		/**
		 * @private
		 */
		public function set minWidth(value:Number):void
		{
			if(this.explicitMinWidth === value)
			{
				return;
			}
			this.explicitMinWidth = value;
			this.invalidate(InvalidationFlag.SIZE);
		}
		
		protected var explicitMinHeight:Number = NaN;
		protected var measuredMinHeight:Number = 0;
		
		public function get minHeight():Number
		{
			if(isNaN(this.explicitMinHeight))
			{
				return this._scaledMeasuredMinHeight;
			}
			return this.explicitMinHeight;
		}
		
		/**
		 * @private
		 */
		public function set minHeight(value:Number):void
		{
			if(this.explicitMinHeight === value)
			{
				return;
			}
			this.explicitMinHeight = value;
			this.invalidate(InvalidationFlag.SIZE);
		}
		
		/**
		 * @private
		 */
		protected var explicitMaxWidth:Number = Number.POSITIVE_INFINITY;
		
		public function get maxWidth():Number
		{
			return this.explicitMaxWidth;
		}
		
		/**
		 * @private
		 */
		public function set maxWidth(value:Number):void
		{
			if(this.explicitMaxWidth === value)
			{
				return;
			}
			this.explicitMaxWidth = value;
			this.invalidate(InvalidationFlag.SIZE);
		}
		
		/**
		 * @private
		 */
		protected var explicitMaxHeight:Number = Number.POSITIVE_INFINITY;
		
		public function get maxHeight():Number
		{
			return this.explicitMaxHeight;
		}
		
		/**
		 * @private
		 */
		public function set maxHeight(value:Number):void
		{
			if(this.explicitMaxHeight === value)
			{
				return;
			}
			this.explicitMaxHeight = value;
			this.invalidate(InvalidationFlag.SIZE);
		}
		
		/**
		 * @private
		 */
		protected var _initializing:Boolean = false;
		
		/**
		 * @private
		 */
		protected var _initialized:Boolean = false;
		
		public function get initialized():Boolean
		{
			return this._initialized;
		}
		
		/**
		 * @private
		 */
		protected var _created:Boolean = false;
		
		public function get created():Boolean
		{
			return this._created;
		}
		
		/**
		 * @private
		 */
		protected var _fullyInvalid:Boolean = false;
		
		/**
		 * @private
		 */
		protected var _invalidateCount:int = 0;
		
		/**
		 * @private
		 */
		protected var _validationQueue:ValidationQueue;
		
		/**
		 * @private
		 */
		protected var _validating:Boolean = false;
		
		/**
		 * @private
		 */
		protected var _invalidationFlags:Object;
		
		/**
		 * @private
		 */
		protected var _delayedInvalidationFlags:Object;
		
		public function invalidate(flag:String = null):void
		{
			this._needsUpdate = true;
			var isAlreadyInvalid:Boolean = this.needsCommit();
			var isAlreadyDelayedInvalid:Boolean = false;
			if(this._validating)
			{
				for(var otherFlag:String in this._delayedInvalidationFlags)
				{
					isAlreadyDelayedInvalid = true;
					break;
				}
			}
			if(flag && flag !== INVALIDATION_FLAG_ALL)
			{
				if(this._validating)
				{
					this._needsDelayedUpdate = true;
					this._delayedInvalidationFlags[flag] = true;
				}
				else if(!this._invalidationFlags.hasOwnProperty(flag))
				{
					this._needsUpdate = true;
					this._invalidationFlags[flag] = true;
				}
			}
			else
			{
				if(this._validating)
				{
					this._needsDelayedUpdate = true;
					this._delayedInvalidationFlags[INVALIDATION_FLAG_ALL] = true;
				}
				else
				{
					this._needsUpdate = true;
					this._fullyInvalid = true;
				}
			}
			if(!this._validationQueue || !this._initialized)
			{
				//we'll add this component to the queue later, after it has been
				//added to the stage.
				return;
			}
			if(this._validating)
			{
				if(isAlreadyDelayedInvalid)
				{
					return;
				}
				this._invalidateCount++;
				this._validationQueue.addControl(this, this._invalidateCount >= 10);
				return;
			}
			if(isAlreadyInvalid)
			{
				return;
			}
			this._invalidateCount = 0;
			this._validationQueue.addControl(this, false);
		}
		
		public function needsCommit(flag:String = null):Boolean
		{
			if(this._fullyInvalid)
			{
				return true;
			}
			if(!flag) //return true if any flag is set
			{
				for(flag in this._invalidationFlags)
				{
					return true;
				}
				return false;
			}
			return this._invalidationFlags[flag];
		}
		
		protected var _needsDelayedUpdate:Boolean = false;
		
		protected var _needsUpdate:Boolean = false;
		
		public function needsUpdate():Boolean
		{
			return this._needsUpdate;
		}
		
		public function commitAndMeasure(customBounds:MeasureBounds = null):void
		{
			if(!this._initialized)
			{
				if(this._initializing)
				{
					//initializing components cannot validate until they've
					//finished initializing. we'll have to wait.
					return;
				}
				this.initializeInternal();
			}
			this._validating = true;
			var needsCommit:Boolean = this.needsCommit();
			if(needsCommit)
			{
				this.commit();
				for(var flag:String in this._invalidationFlags)
				{
					delete this._invalidationFlags[flag];
				}
				this._fullyInvalid = false;
				var needsNewCommit:Boolean = false;
				for(flag in this._delayedInvalidationFlags)
				{
					if(flag === INVALIDATION_FLAG_ALL)
					{
						this._fullyInvalid = true;
					}
					else
					{
						this._invalidationFlags[flag] = true;
					}
					delete this._delayedInvalidationFlags[flag];
					needsNewCommit = true;
				}
				if(needsNewCommit)
				{
					this._validationQueue.addControl(this, false);
				}
			}
			if(needsCommit || this.needsUpdate())
			{
				if(customBounds)
				{
					var savedExplicitWidth:Number = this.explicitWidth;
					var savedExplicitHeight:Number = this.explicitHeight;
					var savedExplicitMinWidth:Number = this.explicitMinWidth;
					var savedExplicitMinHeight:Number = this.explicitMinHeight;
					this.explicitWidth = customBounds.width;
					this.explicitHeight = customBounds.height;
				}
				this.measure();
				if(customBounds)
				{
					this.explicitWidth = savedExplicitWidth;
					this.explicitHeight = savedExplicitHeight;
					this.explicitMinWidth = savedExplicitMinWidth;
					this.explicitMinHeight = savedExplicitMinHeight;
				}
			}
			this._validating = false;
		}
		
		public function validate():void
		{
			if(this._validating)
			{
				//we were already validating, and something else told us to
				//validate. that's bad...
				if(this._validationQueue)
				{
					//...so we'll just try to do it later
					this._validationQueue.addControl(this, true);
				}
				return;
			}
			//we need to always measure when validating because the previous
			//measurement may not have been accepted by the parent component.
			this.commitAndMeasure();
			if(!this.needsUpdate())
			{
				return;
			}
			this._validating = true;
			this._needsUpdate = this._needsDelayedUpdate;
			this._needsDelayedUpdate = false;
			//copy the most recent measurements
			this.layoutWidth = this._measuredWidth;
			this.layoutHeight = this._measuredHeight;
			if(this._scaledLayoutWidth !== this._scaledMeasuredWidth ||
				this._scaledLayoutHeight !== this._scaledMeasuredHeight)
			{
				this._scaledLayoutWidth = this._scaledMeasuredWidth;
				this._scaledLayoutHeight = this._scaledMeasuredHeight;
				FeathersEvent.dispatch(this, FeathersEvent.RESIZE, false, false);
			}
			this.update(this.layoutWidth, this.layoutHeight);
			this._validating = false;
			if(!this._created)
			{
				this._created = true;
				FeathersEvent.dispatch(this, FeathersEvent.CREATION_COMPLETE, false, false);
			}
		}
		
		/**
		 * Conveniently sets both <code>x</code> and <code>y</code> at the same
		 * time.
		 */
		public function move(x:Number, y:Number):void
		{
			this.x = x;
			this.y = y;
		}
		
		/**
		 * Conveniently sets both <code>width</code> and <code>height</code> at
		 * the same time.
		 */
		public function setSize(width:Number, height:Number):void
		{
			this.width = width;
			this.height = height;
		}
		
		/**
		 * @private
		 */
		protected function initializeInternal():void
		{
			if(this._initialized || this._initializing)
			{
				return;
			}
			this._initializing = true;
			this.initialize();
			this.invalidate(); //invalidate everything!
			this._initializing = false;
			this._initialized = true;
			FeathersEvent.dispatch(this, FeathersEvent.INITIALIZE, false, false);
		}
		
		/**
		 * When <code>measure()</code> is called, the calculated dimensions
		 * should be saved with <code>saveMeasurements()</code>.
		 */
		protected function saveMeasurements(width:Number, height:Number,
			minWidth:Number = 0, minHeight:Number = 0):void
		{
			if(!isNaN(this.explicitMinWidth))
			{
				//the min width has been set explicitly. it has precedence over
				//the measured min width
				minWidth = this.explicitMinWidth;
			}
			if(!isNaN(this.explicitMinHeight))
			{
				//the min height has been set explicitly. it has precedence over
				//the measured min height
				minHeight = this.explicitMinHeight;
			}
			var maxWidth:Number = this.explicitMaxWidth;
			var maxHeight:Number = this.explicitMaxHeight;
			if(isNaN(this.explicitWidth))
			{
				if(width < minWidth)
				{
					width = minWidth;
				}
				else if(width > maxWidth)
				{
					width = maxWidth;
				}
			}
			else
			{
				//the width has been set explicitly. it has precedence over the
				//measured width
				width = this.explicitWidth;
			}
			if(isNaN(this.explicitHeight))
			{
				if(height < minHeight)
				{
					height = minHeight;
				}
				else if(height > maxHeight)
				{
					height = maxHeight;
				}
			}
			else
			{
				//the height has been set explicitly. it has precedence over the
				//measured height
				height = this.explicitHeight;
			}
			if(isNaN(width))
			{
				throw ILLEGAL_WIDTH_ERROR;
			}
			if(isNaN(height))
			{
				throw ILLEGAL_HEIGHT_ERROR;
			}
			var scaleX:Number = Math.abs(this.scaleX);
			var scaleY:Number = Math.abs(this.scaleY);
			this._measuredWidth = width;
			this._measuredHeight = height;
			this._scaledMeasuredWidth = width * scaleX;
			this._scaledMeasuredHeight = height * scaleY;
			//no unscaled minimums required
			this._scaledMeasuredMinWidth = minWidth * scaleX;
			this._scaledMeasuredMinHeight = minHeight * scaleY;
		}
		
		/**
		 * Called once when the component is first added to the stage, or before
		 * it validates for the first time (whichever happens first). Override
		 * this function to customize the initialization process. This is a good
		 * place to create children and set up event listeners. After this
		 * function returns, <code>FeathersEvent.INITIALIZE</code> is
		 * dispatched.
		 *
		 * @see #event:initialize feathers.events.FeathersEvent.INITIALIZE
		 */
		protected function initialize():void
		{
			
		}
		
		/**
		 * Called when the component validates, if properties are invalid.
		 * 
		 * <p>Called before both <code>measure()</code> and
		 * <code>update()</code> in the component validation cycle.</p>
		 */
		protected function commit():void
		{
		}
		
		/**
		 * Calculates the preferred dimensions of the component when properties
		 * are invalid or when <code>commitAndMeasure()</code> is called with
		 * custom bounds. Override this function to customize the calculated
		 * dimensions, including minimum and maximum dimensions.
		 * 
		 * <p>Called after <code>commit()</code>, and before
		 * <code>update()</code> in the component validation cycle.</p>
		 * 
		 * <p>When overriding this function, you must pass the calculated
		 * dimensions to <code>saveMeasurements()</code>.</p> 
		 * 
		 * <p>By default, the width and height are calculated based on the
		 * maximum positions of all children.</p>
		 */
		protected function measure():void
		{
			//this default implementation is just a simple one that is similar
			//to how a createjs.Container measures itself
			var maxX:Number = 0;
			var maxY:Number = 0;
			var itemCount:int = this.children.length;
			for(var i:int = 0; i < itemCount; i++)
			{
				var child:DisplayObject = this.children[i];
				if(child is IFeathersDisplayObject)
				{
					var feathersChild:IFeathersDisplayObject = IFeathersDisplayObject(child);
					feathersChild.commitAndMeasure(); //no restrictions!
					var childMaxX:Number = DisplayObject(feathersChild).x + feathersChild.measuredWidth;
					var childMaxY:Number = DisplayObject(feathersChild).y + feathersChild.measuredHeight;
				}
				else
				{
					//fall back to getBounds() for simple display objects
					var childBounds:Rectangle = child.getBounds();
					childMaxX = childBounds.x + childBounds.width;
					childMaxY = childBounds.y + childBounds.height;
				}
				if(!isNaN(childMaxX) && childMaxX > maxX)
				{
					maxX = childMaxX;
				}
				if(!isNaN(childMaxY) && childMaxY > maxY)
				{
					maxY = childMaxY;
				}
			}
			this.saveMeasurements(maxX, maxY, maxX, maxY);
		}
		
		/**
		 * Called when the component validates if properties are invalid or if
		 * the layout has not been updated since the last time that properties
		 * were committed.
		 * 
		 * <p>Called after both <code>commit()</code> and
		 * <code>measure()</code> in the component validation cycle.</p>
		 */
		protected function update(width:Number, height:Number):void
		{
			
		}
		
		/**
		 * @private
		 */
		protected function prepareForStage(stage:Stage):void
		{
			this._depth = DisplayUtil.getDepthFromStage(this);
			this._validationQueue = ValidationQueue.forStage(stage);
			if(this.needsCommit() || this.needsUpdate())
			{
				this._invalidateCount = 0;
				//add to validation queue, if required
				this._validationQueue.addControl(this, false);
			}
		}
		
		/**
		 * @private
		 */
		protected function feathersControl_addedHandler(event:createjs.Event):void
		{
			var stage:Stage = this.getStage();
			if(stage)
			{
				this.prepareForStage(stage);
			}
			else
			{
				this.addEventListener("tick", this.feathersControl_waitForStage_tickHandler);
			}
		}
		
		/**
		 * @private
		 */
		protected function feathersControl_removedHandler(event:createjs.Event):void
		{
			this._depth = -1;
			this._validationQueue = null;
			this.removeEventListener("tick", this.feathersControl_waitForStage_tickHandler);
		}
		
		/**
		 * @private
		 */
		protected function feathersControl_waitForStage_tickHandler(event:createjs.Event):void
		{
			var stage:Stage = this.getStage();
			if(!stage)
			{
				return;
			}
			this.removeEventListener("tick", this.feathersControl_waitForStage_tickHandler);
			this.prepareForStage(stage);
		}
	}
}