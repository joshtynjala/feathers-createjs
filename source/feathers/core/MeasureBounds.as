package feathers.core
{
	public class MeasureBounds
	{
		public function MeasureBounds()
		{
		}
		
		public var width:Number = NaN;
		public var height:Number = NaN;
		public var minWidth:Number = NaN;
		public var minHeight:Number = NaN;
		
		public function reset():void
		{
			this.width = NaN;
			this.height = NaN;
			this.minWidth = NaN;
			this.minHeight = NaN;
		}
	}
}