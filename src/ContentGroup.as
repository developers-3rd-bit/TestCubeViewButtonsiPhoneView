package
{
   import common.HalcyonCanvas;
   
   import flash.display.DisplayObjectContainer;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   public class ContentGroup extends HalcyonCanvas
   {
      private var _label:TextField;
      private var _textFormat:TextFormat;
      
      public function ContentGroup(reference:DisplayObjectContainer, width:Number=15, height:Number=15)
      {
         super(reference, width, height);
         _label = new TextField();
         _label.mouseEnabled = false;
         _textFormat = new TextFormat();
         _textFormat.size = 20;
         this.addElement(_label, 5, NaN, 5, 0);
      }
      
      public function set label(value:String):void {
         _label.text = value;
         _label.setTextFormat(_textFormat);
      }
   }
}