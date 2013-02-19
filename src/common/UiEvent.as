package common {

   import flash.events.Event;
   
	public class UiEvent extends Event {
      public var text:String;
      public var object:Object;
		public var eventName:String;
		
		public function UiEvent(eventName:String) {
			super(eventName);
			this.eventName = eventName;
		}		
	}
}