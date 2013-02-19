package common
{
   import com.greensock.TweenMax;
   
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;

   public class TweenedButton extends Sprite
   {
      private var _tween:TweenMax;
      private var _icon:Sprite;
      
      public function TweenedButton(argClass:Class, argWidth:Number = 12, argHeight:Number = 12)
      {
         this.buttonMode = true;
         _icon = new argClass();
         _icon.width = argWidth;
         _icon.height = argHeight;
         this.addChild(_icon);
         this.addEventListener(MouseEvent.ROLL_OVER, onMouseOver, false, 0, true);
         this.addEventListener(MouseEvent.ROLL_OUT, onMouseOut, false, 0, true);
      }
      
      public function get icon():Sprite {
         return _icon;
      }
      
      public function set enabled(value:Boolean):void {
         if(value) {
            this.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver, false, 0, true);
            this.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut, false, 0, true);
         } else {
            this.removeEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            this.removeEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
         }
         onMouseOut(null);
         this.buttonMode = value;
      }
      
      private function onMouseOver(event:Event):void {
         _tween = TweenMax.to(this, .2, {tint:0x00ff00});
      }
      
      private function onMouseOut(event:Event):void {
         if(_tween)
            _tween.reverse(false);
      }
   }
}