package feathers.controls
{
	import createjs.Text;

	import feathers.core.FeathersControl;
	import feathers.core.InvalidationFlag;

	public class Label extends FeathersControl
	{
		public function Label()
		{
			super();
		}
		
		protected var _textObject:createjs.Text;
		
		protected var _text:String;
		
		public function get text():String
		{
			return this._text;
		}

		public function set text(value:String):void
		{
			if(this._text === value)
			{
				return;
			}
			this._text = value;
			this.invalidate(InvalidationFlag.DATA);
		}
		
		override protected function initialize():void
		{
			if(!this._textObject)
			{
				this._textObject = new createjs.Text();
				this._textObject.font = "normal 20px sans-serif";
				this._textObject.color = "black";
				this.addChild(this._textObject);
			}
		}

		override protected function commit():void
		{
			this._textObject.text = this._text;
		}
		
		override protected function measure():void
		{
			if(this.explicitWidth === this.explicitWidth)
			{
				var textLineWidth:Number = this.explicitWidth;
			}
			else
			{
				textLineWidth = this.explicitMaxWidth;
			}
			if(textLineWidth < Number.POSITIVE_INFINITY)
			{
				this._textObject.lineWidth = textLineWidth;
			}
			else
			{
				this._textObject.lineWidth = 0;
			}
			var measuredWidth:Number = this._textObject.getMeasuredWidth();
			var measuredHeight:Number = this._textObject.getMeasuredHeight();
			this.saveMeasurements(measuredWidth, measuredHeight, measuredWidth, measuredHeight);
		}
	}
}
