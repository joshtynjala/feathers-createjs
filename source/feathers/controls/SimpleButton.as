package feathers.controls
{
	import createjs.DisplayObject;
	import createjs.EventDispatcher;
	import createjs.MouseEvent;
	import createjs.Point;
	
	import feathers.core.FeathersControl;
	import feathers.core.IFeathersDisplayObject;
	import feathers.core.IStateContext;
	import feathers.core.IValidating;
	import feathers.core.InvalidationFlag;
	import feathers.core.MeasureBounds;
	import feathers.events.FeathersEvent;
	
	[Event(name="stateChange",type="feathers.events.FeathersEvent")]
	[Event(name="trigger",type="feathers.events.FeathersEvent")]

	public class SimpleButton extends FeathersControl implements IStateContext
	{
		/**
		 * Constructor.
		 */
		public function SimpleButton()
		{
			super();
			this._measureBounds = new MeasureBounds();
			this._currentState = ButtonState.UP;
			this._skinsForStates = {};
			this["simpleButton_mousedownHandler"] = this.simpleButton_mousedownHandler.bind(this);
			this.addEventListener("mousedown", this.simpleButton_mousedownHandler);
			this["simpleButton_stage_stagemouseupHandler"] = this.simpleButton_stage_stagemouseupHandler.bind(this);
			this["currentSkin_resizeHandler"] = this.currentSkin_resizeHandler.bind(this);
		}
		
		/**
		 * @private
		 */
		protected var _currentState:String;
		
		/**
		 * The current mouse or touch state of the button.
		 * 
		 * @see ButtonState.UP
		 * @see ButtonState.DOWN
		 * @see ButtonState.OVER
		 * @see ButtonState.DISABLED
		 * @see #getSkinForState()
		 * @see #setSkinForState()
		 */
		public function get currentState():String
		{
			return this._currentState;
		}
		
		/**
		 * @private
		 */
		protected var _currentSkin:IFeathersDisplayObject;
		
		/**
		 * @private
		 */
		protected var _skin:IFeathersDisplayObject;
		
		/**
		 * The background skin of the button.
		 * 
		 * <p>If a background skin has been set for the current state, then
		 * the value of the <code>skin</code> property will be ignored.</p>
		 * 
		 * @see #getSkinForState()
		 * @see #setSkinForState()
		 */
		public function get skin():IFeathersDisplayObject
		{
			return this._skin;
		}
		
		/**
		 * @private
		 */
		public function set skin(value:IFeathersDisplayObject):void
		{
			if(this._skin === value)
			{
				return;
			}
			this._skin = value;
			this.invalidate(InvalidationFlag.STYLES);
		}

		/**
		 * @private
		 */
		protected var _measureBounds:MeasureBounds;
		
		/**
		 * @private
		 */
		protected var _skinsForStates:Object;
		
		/**
		 * Gets the background skin for a specific state.
		 * 
		 * <p>If no background skin has been set for the current state, then
		 * the value of the <code>skin</code> property will be used instead.</p>
		 * 
		 * @see #currentState
		 * @see #setSkinForState()
		 */
		public function getSkinForState(state:String):IFeathersDisplayObject
		{
			return this._skinsForStates[state];
		}
		
		/**
		 * Sets the background skin for a specific state.
		 * 
		 * <p>If no background skin has been set for the current state, then
		 * the value of the <code>skin</code> property will be used instead.</p>
		 * 
		 * @see #currentState
		 * @see #getSkinForState()
		 */
		public function setSkinForState(state:String, skin:IFeathersDisplayObject):void
		{
			if(skin)
			{
				this._skinsForStates[state] = skin;
			}
			else
			{
				delete this._skinsForStates[state];
			}
			this.invalidate(InvalidationFlag.STYLES);
		}
		
		/**
		 * @private
		 */
		override protected function commit():void
		{
			var commitStyles:Boolean = this.needsCommit(InvalidationFlag.STYLES);
			var commitState:Boolean = this.needsCommit(InvalidationFlag.STATE);
			
			if(commitStyles || commitState)
			{
				this.refreshSkin();
			}
		}
		
		/**
		 * @private
		 */
		override protected function measure():void
		{
			if(!this._currentSkin)
			{
				this.saveMeasurements(0, 0, 0, 0);
				return;
			}
			//the skin has the same measurement restrictions as the button
			this._measureBounds.width = this.explicitWidth;
			this._measureBounds.height = this.explicitHeight;
			this._measureBounds.minWidth = this.explicitMinWidth;
			this._measureBounds.minHeight = this.explicitMinHeight;
			this._currentSkin.commitAndMeasure(this._measureBounds);
			var measuredWidth:Number = this._currentSkin.measuredWidth;
			var measuredHeight:Number = this._currentSkin.measuredHeight;
			var measuredMinWidth:Number = this._currentSkin.measuredMinWidth;
			var measuredMinHeight:Number = this._currentSkin.measuredMinHeight;
			this.saveMeasurements(measuredWidth, measuredHeight, measuredMinWidth, measuredMinHeight);
		}
		
		/**
		 * @private
		 */
		override protected function update(layoutWidth:Number, layoutHeight:Number):void
		{
			if(!this._currentSkin)
			{
				return;
			}
			this._currentSkin.setSize(layoutWidth, layoutHeight);
			if(this._currentSkin is IValidating)
			{
				IValidating(this._currentSkin).validate();
			}
		}
		
		/**
		 * @private
		 */
		protected function refreshSkin():void
		{
			var oldSkin:IFeathersDisplayObject = this._currentSkin;
			if(this._skinsForStates.hasOwnProperty(this._currentState))
			{
				this._currentSkin = IFeathersDisplayObject(this._skinsForStates[this._currentState]);
			}
			else
			{
				this._currentSkin = this._skin;
			}
			if(this._currentSkin !== oldSkin)
			{
				if(oldSkin)
				{
					oldSkin.removeEventListener(FeathersEvent.RESIZE, currentSkin_resizeHandler);
					this.removeChild(DisplayObject(oldSkin));
				}
				if(this._currentSkin)
				{
					this._currentSkin.addEventListener(FeathersEvent.RESIZE, currentSkin_resizeHandler);
					this.addChildAt(DisplayObject(this._currentSkin), 0);
				}
			}
		}
		
		/**
		 * @private
		 */
		protected function simpleButton_mousedownHandler(event:createjs.MouseEvent):void
		{
			if(!this._enabled)
			{
				return;
			}
			this._currentState = ButtonState.DOWN;
			this.invalidate(InvalidationFlag.STATE);
			FeathersEvent.dispatch(this, FeathersEvent.STATE_CHANGE, false, false);
			//the target may be a skin that gets removed when the button state
			//changes, so we should listen for an event from the stage
			this.getStage().addEventListener("stagemouseup", this.simpleButton_stage_stagemouseupHandler);
		}
		
		/**
		 * @private
		 */
		protected function simpleButton_stage_stagemouseupHandler(event:createjs.MouseEvent):void
		{
			this.getStage().removeEventListener("stagemouseup", this.simpleButton_stage_stagemouseupHandler);
			this._currentState = ButtonState.UP;
			this.invalidate(InvalidationFlag.STATE);
			FeathersEvent.dispatch(this, FeathersEvent.STATE_CHANGE, false, false);
			var local:Point = this.globalToLocal(event.stageX, event.stageY);
			if(this.hitTest(local.x, local.y))
			{
				FeathersEvent.dispatch(this, FeathersEvent.TRIGGER, false, false);
			}
		}
		
		/**
		 * @private
		 */
		protected function currentSkin_resizeHandler(event:FeathersEvent):void
		{
			this.invalidate(InvalidationFlag.SIZE);
		}
	}
}