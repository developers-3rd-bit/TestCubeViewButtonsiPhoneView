package common
{
   import com.soma.ui.ElementUI;
   import com.soma.ui.layouts.CanvasUI;
   
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   
   public class HalcyonCanvas extends CanvasUI
   {
      public function HalcyonCanvas(reference:DisplayObjectContainer, width:Number = 15, height:Number = 15)
      {
         super(reference, width, height);
      }
      
      public function addElement(argDisplayObject:DisplayObject, argTop:Number = NaN, argBottom:Number = NaN, 
                                                   argLeft:Number = NaN, argRight:Number = NaN):void {
         var element:ElementUI = this.add(argDisplayObject);
         element.top = argTop;
         element.bottom = argBottom;
         element.left = argLeft;
         element.right = argRight;
         element.refresh();
      }
   }
}