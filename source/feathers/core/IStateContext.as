package feathers.core
{
	[Event(name="stateChange",type="feathers.events.FeathersEvent")]
	
	public interface IStateContext
	{
		function get currentState():String;
	}
}