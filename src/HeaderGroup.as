package
{
   import common.HalcyonCanvas;
   import common.UiEvent;
   
   import fl.controls.Button;
   
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   public class HeaderGroup extends HalcyonCanvas
   {
      public static const BUTTON_CLICK:String = "buttonClick";
      
      private var _sprite:Sprite;
      private var _leftButton:Button;
      private var _rightButton:Button;
      private var _title:TextField;
      
      public function HeaderGroup(argDisplayObject:DisplayObjectContainer, argWidth:Number=15, argHeight:Number=15)
      {
         super(argDisplayObject, argWidth, argHeight);
         _sprite = new Sprite();
         _sprite.graphics.lineStyle(0, 0x000000, 1);
         _sprite.graphics.beginFill(0x686868, 1);
         _sprite.graphics.drawRect(0, 0, argWidth, 40);
         this.addElement(_sprite, 0, 0, 0, 0);
         _leftButton = new Button();
         _leftButton.label = "Home";
         _leftButton.width = 60;
         this.addElement(_leftButton, 10, NaN, 7, NaN);
         _rightButton = new Button();
         _rightButton.label = "Help";
         _rightButton.width = 60;
         this.addElement(_rightButton, 10, NaN, NaN, 7);
         _title = new TextField();
         _title.text = "Welcome to iMeet";
         _title.mouseEnabled = false;
         var textFormat:TextFormat = new TextFormat();
         textFormat.size = 20;
         textFormat.bold = true;
         _title.setTextFormat(textFormat);
         this.addElement(_title, 7, NaN, _leftButton.width + 15, _rightButton.width + 15);
         
         _leftButton.addEventListener(MouseEvent.CLICK, onButtonClick, false, 0, true);
         _rightButton.addEventListener(MouseEvent.CLICK, onButtonClick, false, 0, true);
         
      }
      
      private function onButtonClick(event:Event):void {
         var uiEvent:UiEvent = new UiEvent(BUTTON_CLICK);
         uiEvent.object = event.currentTarget;
         dispatchEvent(uiEvent);
      }
   }
}