package feathers.core
{
	import createjs.Event;
	import createjs.Stage;

	public class ValidationQueue
	{
		/**
		 * @private
		 */
		private static const QUEUES:Array = [];
		
		/**
		 * Gets the validation queue for the specified Stage instance. If
		 * a validation queue does not exist for the specified Stage
		 * instance, a new one will be created.
		 */
		public static function forStage(stage:Stage):ValidationQueue
		{
			if(!stage)
			{
				return null;
			}
			var index:int = QUEUES["indexOf"](stage);
			var queue:ValidationQueue;
			if(index >= 0)
			{
				queue = ValidationQueue(QUEUES[index + 1]);
			}
			else
			{
				queue = new ValidationQueue(stage);
				QUEUES[QUEUES.length] = stage;
				QUEUES[QUEUES.length] = queue;
			}
			return queue;
		}
		
		/**
		 * Constructor.
		 */
		public function ValidationQueue(stage:Stage)
		{
			this._delayedQueue = new <IValidating>[];
			this._queue = new <IValidating>[];
			this["validationQueue_stage_tickHandler"] = this.validationQueue_stage_tickHandler.bind(this);
			stage.addEventListener("tick", this.validationQueue_stage_tickHandler);
		}
		
		protected var _isValidating:Boolean = false;
		
		/**
		 * If true, the queue is currently validating.
		 *
		 * <p>In the following example, we check if the queue is currently validating:</p>
		 *
		 * <listing version="3.0">
		 * if( queue.isValidating )
		 * {
		 *     // do something
		 * }</listing>
		 */
		public function get isValidating():Boolean
		{
			return this._isValidating;
		}
		
		/**
		 * @private
		 */
		protected var _delayedQueue:Vector.<IValidating>;
		
		/**
		 * @private
		 */
		protected var _queue:Vector.<IValidating>;
		
		/**
		 * 
		 */
		public function addControl(control:IValidating, delayIfValidating:Boolean):void
		{
			var currentQueue:Vector.<IValidating> = (this._isValidating && delayIfValidating) ? this._delayedQueue : this._queue;
			if(currentQueue.indexOf(control) >= 0)
			{
				//already queued
				return;
			}
			var queueLength:int = currentQueue.length;
			if(this._isValidating && currentQueue === this._queue)
			{
				if(control is IFeathersDisplayObject)
				{
					//special case: we need to keep it sorted
					var depth:int = IFeathersDisplayObject(control).depth;
					
					//we're traversing the queue backwards because it's
					//significantly more likely that we're going to push than that
					//we're going to splice, so there's no point to iterating over
					//the whole queue
					for(var i:int = queueLength - 1; i >= 0; i--)
					{
						var otherControl:IFeathersDisplayObject = currentQueue[i] as IFeathersDisplayObject;
						if(!otherControl)
						{
							continue;
						}
						var otherDepth:int = otherControl.depth;
						//we can skip the overhead of calling queueSortFunction and
						//of looking up the value we've already stored in the depth
						//local variable.
						if(depth >= otherDepth)
						{
							break;
						}
					}
					//add one because we're going after the last item we checked
					//if we made it through all of them, i will be -1, and we want 0
					i++;
					if(i === queueLength)
					{
						currentQueue[queueLength] = control;
					}
					else
					{
						currentQueue.splice(i, 0, control);
					}
				}
				else
				{
					currentQueue[queueLength] = control;
				}
			}
			else
			{
				currentQueue[queueLength] = control;
			}
		}
		
		/**
		 * @private
		 */
		protected function validationQueue_stage_tickHandler(event:createjs.Event):void
		{
			if(this._isValidating)
			{
				return;
			}
			var queueLength:int = this._queue.length;
			if(queueLength === 0)
			{
				return;
			}
			this._isValidating = true;
			this._queue = this._queue.sort(this.queueSortFunction);
			while(this._queue.length > 0) //rechecking length after the shift
			{
				var item:IValidating = this._queue.shift();
				if(item is IFeathersDisplayObject && IFeathersDisplayObject(item).depth < 0)
				{
					//skip items that are no longer on the display list
					continue;
				}
				item.validate();
			}
			var temp:Vector.<IValidating> = this._queue;
			this._queue = this._delayedQueue;
			this._delayedQueue = temp;
			this._isValidating = false;
		}
		
		/**
		 * @private
		 */
		protected function queueSortFunction(first:IValidating, second:IValidating):int
		{
			var firstDisplayObject:IFeathersDisplayObject = first as IFeathersDisplayObject;
			var secondDisplayObject:IFeathersDisplayObject = second as IFeathersDisplayObject;
			if(firstDisplayObject)
			{
				if(!secondDisplayObject)
				{
					return -1;
				}
			}
			else
			{
				if(secondDisplayObject)
				{
					return 1;
				}
				else
				{
					return 0;
				}
			}
			var difference:int = secondDisplayObject.depth - firstDisplayObject.depth;
			if(difference > 0)
			{
				return -1;
			}
			else if(difference < 0)
			{
				return 1;
			}
			return 0;
		}
	}
}