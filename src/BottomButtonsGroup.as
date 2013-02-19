package
{
   import common.HalcyonHGroup;
   import common.TweenedButton;
   import common.UiEvent;
   
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   
   public class BottomButtonsGroup extends HalcyonHGroup
   {
      public static const BUTTON_CLICK:String = "buttonClick";
      
      private var _webcamBtn:TweenedButton;
      private var _connectBtn:TweenedButton;
      private var _infoBtn:TweenedButton;
      private var _helpBtn:TweenedButton;
      private var _awayBtn:TweenedButton;
      private var _webcamBtn2:TweenedButton;
      private var _connectBtn2:TweenedButton;
      private var _preferredButtonWidth:Number = 48;
      private var _preferredButtonHieght:Number = 48;
      private var _extraWidth:Number;
      
      public function BottomButtonsGroup(reference:DisplayObjectContainer, width:Number=15, height:Number=15)
      {
         super(reference, width, height);
         this.horizontalgap = 15;
         _webcamBtn = new TweenedButton(McWebcam, _preferredButtonWidth, _preferredButtonHieght);
         _connectBtn = new TweenedButton(McCall, _preferredButtonWidth, _preferredButtonHieght);
         _infoBtn = new TweenedButton(McInfo, _preferredButtonWidth, _preferredButtonHieght);
         _helpBtn = new TweenedButton(McHelp, _preferredButtonWidth, _preferredButtonHieght);
         _awayBtn = new TweenedButton(McAway, _preferredButtonWidth, _preferredButtonHieght);
         _webcamBtn2 = new TweenedButton(McWebcam, _preferredButtonWidth, _preferredButtonHieght);
         _connectBtn2 = new TweenedButton(McCall, _preferredButtonWidth, _preferredButtonHieght);
         
         this.addChild(_webcamBtn);
         this.addChild(_connectBtn);
         this.addChild(_helpBtn);
         this.addChild(_infoBtn);
         this.addChild(_awayBtn);
         this.addChild(_webcamBtn2);
         this.addChild(_connectBtn2);
         
         _extraWidth = this.numChildren * _preferredButtonWidth + ((this.numChildren - 1) * horizontalgap) - width + 5;
         
         _webcamBtn.addEventListener(MouseEvent.CLICK, onButtonClick, false, 0, true);
         _connectBtn.addEventListener(MouseEvent.CLICK, onButtonClick, false, 0, true);
         _infoBtn.addEventListener(MouseEvent.CLICK, onButtonClick, false, 0, true);
         _helpBtn.addEventListener(MouseEvent.CLICK, onButtonClick, false, 0, true);
         _awayBtn.addEventListener(MouseEvent.CLICK, onButtonClick, false, 0, true);
         _webcamBtn2.addEventListener(MouseEvent.CLICK, onButtonClick, false, 0, true);
         _connectBtn2.addEventListener(MouseEvent.CLICK, onButtonClick, false, 0, true);
         this.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
         this.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
      }
      
      private function onMouseDown(event:MouseEvent):void {
         this.startDrag(false, new Rectangle(-_extraWidth, this.y, 120, 0));
         this.addEventListener(MouseEvent.ROLL_OUT, onMouseUp, false, 0, true);
      }
      
      private function onMouseUp(event:MouseEvent):void {
         this.stopDrag();
         this.removeEventListener(MouseEvent.ROLL_OUT, onMouseUp);
      }
      
      private function onButtonClick(event:Event):void {
         var uiEvent:UiEvent = new UiEvent(BUTTON_CLICK);
         uiEvent.object = event.currentTarget;
         dispatchEvent(uiEvent);
      }
   }
}