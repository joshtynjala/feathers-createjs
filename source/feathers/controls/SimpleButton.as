package feathers.controls
{
	import createjs.DisplayObject;
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
	[Event(name="longPress",type="feathers.events.FeathersEvent")]

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
			this.addEventListener("rollover", simpleButton_rolloverHandler);
			this.addEventListener("rollout", simpleButton_rolloutHandler);
			this.addEventListener("mousedown", simpleButton_mousedownHandler);
		}
		
		protected var _mouseIsDown:Boolean = false;

		protected var _mouseIsOver:Boolean = false;
		
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
		
		protected var _keepDownStateOnRollOut:Boolean = false;
		
		public function get keepDownStateOnRollOut():Boolean
		{
			return this._keepDownStateOnRollOut;
		}

		public function set keepDownStateOnRollOut(value:Boolean):void
		{
			this._keepDownStateOnRollOut = value;
		}
		
		protected var _mousedownTime:Number;
		protected var _waitingForLongPress:Boolean = false;

		protected var _longPressEnabled:Boolean = false;

		public function get longPressEnabled():Boolean
		{
			return this._longPressEnabled;
		}

		public function set longPressEnabled(value:Boolean):void
		{
			this._longPressEnabled = value;
		}

		protected var _longPressDuration:Number = 0.5;

		public function get longPressDuration():Number
		{
			return this._longPressDuration;
		}

		public function set longPressDuration(value:Number):void
		{
			this._longPressDuration = value;
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
		protected function changeState(value:String):void
		{
			if(this._currentState === value)
			{
				return;
			}
			this._currentState = value;
			this.invalidate(InvalidationFlag.STATE);
			FeathersEvent.dispatch(this, FeathersEvent.STATE_CHANGE, false, false);
		}

		/**
		 * @private
		 */
		protected function trigger():void
		{
			FeathersEvent.dispatch(this, FeathersEvent.TRIGGER, false, false);
		}

		/**
		 * @private
		 */
		protected function simpleButton_rolloverHandler(event:createjs.MouseEvent):void
		{
			if(!this._enabled)
			{
				return;
			}
			this._mouseIsOver = true;
			if(this._mouseIsDown)
			{
				this.changeState(ButtonState.DOWN);
			}
			else
			{
				this.changeState(ButtonState.OVER);
			}
		}

		/**
		 * @private
		 */
		protected function simpleButton_rolloutHandler(event:createjs.MouseEvent):void
		{
			if(!this._enabled)
			{
				return;
			}
			this._mouseIsOver = false;
			if(this._mouseIsDown && this._keepDownStateOnRollOut)
			{
				this.changeState(ButtonState.DOWN);
			}
			else
			{
				this.changeState(ButtonState.UP);
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
			this._mouseIsDown = true;
			this.changeState(ButtonState.DOWN);
			if(this._longPressEnabled)
			{
				this._mousedownTime = Date.now();
				this._waitingForLongPress = true;
				this.addEventListener("tick", simpleButton_longPress_tickHandler);
			}
			//the target may be a skin that gets removed when the button state
			//changes, so we should listen for an event from the stage
			this.getStage().addEventListener("stagemouseup", simpleButton_stage_stagemouseupHandler);
		}
		
		/**
		 * @private
		 */
		protected function simpleButton_stage_stagemouseupHandler(event:createjs.MouseEvent):void
		{
			this.removeEventListener("tick", simpleButton_longPress_tickHandler);
			this.getStage().removeEventListener("stagemouseup", simpleButton_stage_stagemouseupHandler);
			this._mouseIsDown = false;
			if(this._mouseIsOver)
			{
				this.changeState(ButtonState.OVER);
			}
			else
			{
				this.changeState(ButtonState.UP);
			}
			var local:Point = this.globalToLocal(event.stageX, event.stageY);
			if((this._waitingForLongPress || !this._longPressEnabled) && this.hitTest(local.x, local.y))
			{
				this.trigger();
			}
		}

		/**
		 * @private
		 */
		protected function simpleButton_longPress_tickHandler(event:createjs.Event):void
		{
			var accumulatedTime:Number = (Date.now() - this._mousedownTime) / 1000;
			if(accumulatedTime >= this._longPressDuration)
			{
				this.removeEventListener("tick", simpleButton_longPress_tickHandler);
				this._waitingForLongPress = false;
				FeathersEvent.dispatch(this, FeathersEvent.LONG_PRESS, false, false);
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