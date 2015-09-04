package feathers.skins
{
	import createjs.Bitmap;
	import createjs.DisplayObject;
	import createjs.Rectangle;
	
	import feathers.core.IFeathersDisplayObject;
	import feathers.core.MeasureBounds;
	import feathers.events.FeathersEvent;
	
	public class BitmapSkin extends DisplayObject implements IFeathersDisplayObject
	{
		public function BitmapSkin(imageOrUri:Object, scale9Grid:Rectangle = null,
			customImageWidth:Number = 0, customImageHeight:Number = 0)
		{
			super();
			this._bitmap = new Bitmap(imageOrUri);
			this._image = this._bitmap.image as HTMLImageElement;
			if(!this._image)
			{
				this._canvas = this._bitmap.image as HTMLCanvasElement;
				if(!this._canvas)
				{
					this._video = this._bitmap.image as HTMLVideoElement;
					if(!this._video)
					{
						throw "BitmapSkin requires HTMLImageElement, HTMLCanvasElement, HTMLVideoElement, or a String URL";
					}
				}
			}
			this._scale9Grid = scale9Grid;
			this._customImageWidth = customImageWidth;
			this._customImageHeight = customImageHeight;
			if(this._image)
			{
				if(this._image.complete)
				{
					this.saveImageValues();
				}
				else
				{
					this._image.addEventListener("load", image_loadHandler, false);
				}
			}
			else if(this._canvas)
			{
				this._imageNaturalWidth = this._canvas.width;
				this._imageNaturalHeight = this._canvas.height;
			}
			else if(this._video)
			{
				if(this._video.readyState > 0)
				{
					this.saveVideoValues();
				}
				else
				{
					this._video.addEventListener("loadedmetadata", video_loadedmetadataHandler, false);
				}
			}
		}
		
		protected var _bitmap:Bitmap;
		protected var _image:HTMLImageElement;
		protected var _canvas:HTMLCanvasElement;
		protected var _video:HTMLVideoElement;
		
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
		protected var _scale9Grid:Rectangle;
		
		public function get scale9Grid():Rectangle
		{
			return this._scale9Grid;
		}
		
		/**
		 * @private
		 */
		public function set scale9Grid(value:Rectangle):void
		{
			this._scale9Grid = value;
		}
		
		protected var explicitWidth:Number = NaN;
		
		public function get width():Number
		{
			if(isNaN(this.explicitWidth))
			{
				return this.measuredWidth;
			}
			return this.explicitWidth;
		}
		
		public function set width(value:Number):void
		{
			if(this.explicitWidth === value)
			{
				return;
			}
			this.explicitWidth = value;
			if(this._image.complete)
			{
				this._bitmap.scaleX = value / this._imageNaturalWidth;
			}
			FeathersEvent.dispatch(this, FeathersEvent.RESIZE, false, false);
		}
		
		protected var explicitHeight:Number = NaN;
		
		public function get height():Number
		{
			if(isNaN(this.explicitHeight))
			{
				return this.measuredHeight;
			}
			return this.explicitHeight;
		}
		
		public function set height(value:Number):void
		{
			if(this.explicitHeight === value)
			{
				return;
			}
			this.explicitHeight = value;
			if(this._image.complete)
			{
				this._bitmap.scaleY = value / this._imageNaturalHeight;
			}
			FeathersEvent.dispatch(this, FeathersEvent.RESIZE, false, false);
		}
		
		protected var explicitMinWidth:Number = NaN;
		
		public function get minWidth():Number
		{
			if(isNaN(this.explicitMinWidth))
			{
				return this.measuredMinWidth;
			}
			return this.explicitMinWidth;
		}
		
		public function set minWidth(value:Number):void
		{
			if(this.explicitMinWidth === value)
			{
				return;
			}
			this.explicitMinWidth = value;
			FeathersEvent.dispatch(this, FeathersEvent.RESIZE, false, false);
		}
		
		protected var explicitMinHeight:Number = NaN;
		
		public function get minHeight():Number
		{
			if(isNaN(this.explicitMinHeight))
			{
				return this.measuredMinHeight;
			}
			return this.explicitMinHeight;
		}
		
		public function set minHeight(value:Number):void
		{
			if(this.explicitMinHeight === value)
			{
				return;
			}
			this.explicitMinHeight = value;
			FeathersEvent.dispatch(this, FeathersEvent.RESIZE, false, false);
		}
		
		protected var _customImageWidth:Number;
		
		protected var _imageNaturalWidth:Number = 0;
		
		public function get measuredWidth():Number
		{
			if(this._customImageWidth > 0)
			{
				return this._customImageWidth;
			}
			return this._imageNaturalWidth;
		}
		
		protected var _customImageHeight:Number;
		
		protected var _imageNaturalHeight:Number = 0;
		
		public function get measuredHeight():Number
		{
			if(this._customImageHeight > 0)
			{
				return this._customImageHeight;
			}
			return this._imageNaturalHeight;
		}
		
		public function get measuredMinWidth():Number
		{
			if(this._customImageWidth > 0)
			{
				return this._customImageWidth;
			}
			return this._imageNaturalHeight;
		}
		
		public function get measuredMinHeight():Number
		{
			if(this._customImageHeight > 0)
			{
				return this._customImageHeight;
			}
			return this._imageNaturalHeight;
		}
		
		public function get maxWidth():Number
		{
			return 0;
		}
		
		public function set maxWidth(value:Number):void
		{
		}
		
		public function get maxHeight():Number
		{
			return 0;
		}
		
		public function set maxHeight(value:Number):void
		{
		}
		
		public function setSize(width:Number, height:Number):void
		{
			this.width = width;
			this.height = height;
		}
		
		public function move(x:Number, y:Number):void
		{
			this.x = x;
			this.y = y;
		}
		
		public function commitAndMeasure(measureBounds:MeasureBounds = null):void
		{
			
		}
		
		override public function draw(ctx:CanvasRenderingContext2D, ignoreCache:Boolean = false):Boolean
		{
			if(this._scale9Grid)
			{
				var image:Object = this._bitmap.image;
				var drawWidth:Number = this.width;
				var drawHeight:Number = this.height;
				var centerX:Number = this._scale9Grid.width;
				var centerY:Number = this._scale9Grid.height;
				if(centerX == 0) //vertical
				{
					if(centerY == 0)
					{
						throw "One of scale9Grid width or height must be greater than zero.";
					}
					var scale3Region1:Number = this.scale9Grid.y;
					var scale3Region3:Number = this._imageNaturalHeight - scale3Region1 - centerY;
					var oppositeEdgeScale:Number = drawWidth / this._imageNaturalWidth;
					var scaledFirstRegion:Number = scale3Region1 * oppositeEdgeScale;
					var scaledThirdRegion:Number = scale3Region3 * oppositeEdgeScale;
					var scaledSecondRegion:Number = drawHeight - scaledFirstRegion - scaledThirdRegion;
					
					ctx.drawImage(image, 0, 0, this._imageNaturalWidth, scale3Region1, 0, 0, drawWidth, scaledFirstRegion);
					ctx.drawImage(image, 0, scale3Region1, this._imageNaturalWidth, centerY, 0, scaledFirstRegion, drawWidth, scaledSecondRegion);
					ctx.drawImage(image, 0, scale3Region1 + centerY, this._imageNaturalWidth, scale3Region3, 0, scaledFirstRegion + scaledSecondRegion, drawWidth, scaledThirdRegion);
				}
				else if(centerY == 0) //horizontal
				{
					scale3Region1 = this.scale9Grid.x;
					scale3Region3 = this._imageNaturalWidth - scale3Region1 - centerX;
					oppositeEdgeScale = drawHeight / this._imageNaturalHeight;
					scaledFirstRegion = scale3Region1 * oppositeEdgeScale;
					scaledThirdRegion = scale3Region3 * oppositeEdgeScale;
					scaledSecondRegion = drawWidth - scaledFirstRegion - scaledThirdRegion;
					
					ctx.drawImage(image, 0, 0, scale3Region1, this._imageNaturalHeight, 0, 0, scaledFirstRegion, drawHeight);
					ctx.drawImage(image, scale3Region1, 0, centerX, this._imageNaturalHeight, scaledFirstRegion, 0, scaledSecondRegion, drawHeight);
					ctx.drawImage(image, scale3Region1 + centerX, 0, scale3Region3, this._imageNaturalHeight, scaledFirstRegion + scaledSecondRegion, 0, scaledThirdRegion, drawHeight);
				}
				else
				{
					var left:Number = this._scale9Grid.x;
					var top:Number = this._scale9Grid.y;
					var right:Number = this._imageNaturalWidth - centerX - left;
					var bottom:Number = this._imageNaturalHeight - centerY - top;
					var scaledCenterX:Number = drawWidth - left - right;
					var scaledCenterY:Number = drawHeight - top - bottom;
					
					ctx.drawImage(image, 0, 0, left, top, 0, 0, left, top);
					ctx.drawImage(image, left, 0, centerX, top, left, 0, scaledCenterX, top);
					ctx.drawImage(image, left + centerX, 0, right, top, left + scaledCenterX, 0, right, top);
					
					ctx.drawImage(image, 0, top, left, centerY, 0, top, left, scaledCenterY);
					ctx.drawImage(image, left, top, centerX, centerY, left, top, scaledCenterX, scaledCenterY);
					ctx.drawImage(image, left + centerX, top, right, centerY, left + scaledCenterX, top, right, scaledCenterY);
					
					ctx.drawImage(image, 0, top + centerY, left, bottom, 0, top + scaledCenterY, left, bottom);
					ctx.drawImage(image, left, top + centerY, centerX, bottom, left, top + scaledCenterY, scaledCenterX, bottom);
					ctx.drawImage(image, left + centerX, top + centerY, right, bottom, left + scaledCenterX, top + scaledCenterY, right, bottom);
				}
			}
			else
			{
				ctx.save();
				this._bitmap.updateContext(ctx);
				this._bitmap.draw(ctx, ignoreCache);
				ctx.restore();
			}
			return true;
		}
		
		/**
		 * @private
		 */
		protected function scaleBitmap():void
		{
			if(isNaN(this.explicitWidth))
			{
				this._bitmap.scaleX = 1;
			}
			else
			{
				this._bitmap.scaleX = this.explicitWidth / this.measuredWidth;
			}
			if(isNaN(this.explicitHeight))
			{
				this._bitmap.scaleY = 1;				
			}
			else
			{
				this._bitmap.scaleY = this.explicitHeight / this.measuredHeight;
			}
		}
		
		/**
		 * @private
		 */
		protected function saveImageValues():void
		{
			this._imageNaturalWidth = this._image.naturalWidth;
			this._imageNaturalHeight = this._image.naturalHeight;
			this.scaleBitmap();
		}
		
		/**
		 * @private
		 */
		protected function saveVideoValues():void
		{
			this._imageNaturalWidth = this._video.videoWidth;
			this._imageNaturalHeight = this._video.videoHeight;
		}
		
		/**
		 * @private
		 */
		protected function image_loadHandler(event:Object):void
		{
			var oldWidth:Number = this._imageNaturalWidth;
			var oldHeight:Number = this._imageNaturalHeight;
			this.saveImageValues();
			if((this._customImageWidth === 0 && this._imageNaturalWidth !== oldWidth) ||
				(this._customImageHeight === 0 && this._imageNaturalHeight !== oldHeight))
			{
				FeathersEvent.dispatch(this, FeathersEvent.RESIZE, false, false);
			}
		}
		
		/**
		 * @private
		 */
		protected function video_loadedmetadataHandler(event:Object):void
		{
			var oldWidth:Number = this._imageNaturalWidth;
			var oldHeight:Number = this._imageNaturalHeight;
			this.saveVideoValues();
			if((this._customImageWidth === 0 && this._imageNaturalWidth !== oldWidth) ||
				(this._customImageHeight === 0 && this._imageNaturalHeight !== oldHeight))
			{
				FeathersEvent.dispatch(this, FeathersEvent.RESIZE, false, false);
			}
		}
	}
}