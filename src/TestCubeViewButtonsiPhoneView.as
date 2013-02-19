package
{
   import com.greensock.TweenMax;
   import com.greensock.events.TweenEvent;
   import com.soma.ui.ElementUI;
   
   import common.HalcyonCanvas;
   import common.TweenedButton;
   import common.UiEvent;
   
   import fl.controls.Button;
   
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.display.StageAlign;
   import flash.display.StageScaleMode;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.system.Capabilities;
   
   [SWF(width="320", height="480")]
   public class TestCubeViewButtonsiPhoneView extends Sprite
   {
      private var _halcyonCanvas:HalcyonCanvas;
      private var _header:HeaderGroup;
      private var _contentGroup:ContentGroup;
      private var _bottomButtonsGroup:BottomButtonsGroup;
      private var _screenWidth:Number = 320;
      private var _screenHeight:Number = 480;
      private var _headerHeight:Number = 40;
      private var _bottomButtonsGroupHeight:Number = 48;
      private var _maskingShape:Shape;
      private var _bottomButtonsGroupInitialY:Number;
      private var _contentGroupInitialTop:Number;
      private var _contentGroupInitialBottom:Number;
      
      public function TestCubeViewButtonsiPhoneView()
      {
         _halcyonCanvas = new HalcyonCanvas(this, _screenWidth, _screenHeight);
         _header = new HeaderGroup(_halcyonCanvas, _screenWidth, _headerHeight);
         _halcyonCanvas.addElement(_header, 0, NaN, 0, 1); 
         _bottomButtonsGroup = new BottomButtonsGroup(_halcyonCanvas, _screenWidth, 48);
         stage.scaleMode = StageScaleMode.NO_SCALE;
         stage.align = StageAlign.LEFT;
         _maskingShape = new Shape;
         _maskingShape.graphics.lineStyle();
         drawMask(0, 0);
         this.mask = _maskingShape;
         _halcyonCanvas.addElement(_bottomButtonsGroup, NaN, 10, 10, NaN);
         _contentGroup = new ContentGroup(this, _screenWidth, _screenHeight - (_headerHeight + _bottomButtonsGroupHeight + 30));
         _contentGroupInitialTop = _headerHeight + 10;
         _contentGroupInitialBottom = _bottomButtonsGroupHeight + 20;
         _halcyonCanvas.addElement(_contentGroup, _contentGroupInitialTop, _contentGroupInitialBottom, 10, NaN);
         
         _contentGroup.addEventListener(MouseEvent.CLICK, onMouseClick, false, 0, true);
         _header.addEventListener(HeaderGroup.BUTTON_CLICK, onButtonClick, false, 0, true);
         _bottomButtonsGroup.addEventListener(HeaderGroup.BUTTON_CLICK, onButtonClick, false, 0, true);
         stage.addEventListener(Event.RESIZE, onResize, false, 0, true);
         
         this.addChild(_halcyonCanvas);
         _bottomButtonsGroupInitialY = _bottomButtonsGroup.y;
      }
      
      private function onButtonClick(uiEvent:UiEvent):void {
         if(uiEvent.object is Button) {
            _contentGroup.label = uiEvent.object.label + " button clicked.";
         } else if(uiEvent.object is TweenedButton) {
            var tweenedButton:TweenedButton = uiEvent.object as TweenedButton;
            if(tweenedButton.icon is McWebcam) {
               _contentGroup.label = "Webcam button clicked.";
            } else if(tweenedButton.icon is McCall) {
               _contentGroup.label = "Call button clicked.";
            } else if(tweenedButton.icon is McInfo) {
               _contentGroup.label = "Info button clicked.";
            } else if(tweenedButton.icon is McHelp) {
               _contentGroup.label = "Help button clicked.";
            } else if(tweenedButton.icon is McAway) {
               _contentGroup.label = "Away button clicked.";
            } 
         }
      }
      
      private var _isHidden:Boolean = false;
      
      private function onMouseClick(event:Event):void {
         TweenMax.to(_header, .5, {y:_isHidden ? 0 : -_headerHeight - 1});
         var tweenMax:TweenMax = TweenMax.to(_bottomButtonsGroup, .5, {y:_isHidden ? _bottomButtonsGroupInitialY : _bottomButtonsGroupInitialY + _bottomButtonsGroupHeight + 10});
         _isHidden = !_isHidden;
		 if(_isHidden)
			 tweenMax.addEventListener(TweenEvent.COMPLETE, effectCompleted, false, 0, true);	
		 else
			 updateContentGroup();			 		 
      }
	  
	  private function updateContentGroup():void {
		  var element:ElementUI = _halcyonCanvas.getElementAt(2);
		  element.top = _isHidden ? 0 : _contentGroupInitialTop;
		  element.bottom = _isHidden ? 0 : _contentGroupInitialBottom;
		  element.refresh(); 
	  }
	  
	  private function effectCompleted(event:Event):void {
		  event.currentTarget.removeEventListener(TweenEvent.COMPLETE, effectCompleted);
		  updateContentGroup();
	  }
      
      private function onResize(event:Event):void {
         _isHidden = false;
         drawMask(0, 0);
      }
      
      private function drawMask(argX:Number, argY:Number):void {
         _maskingShape.graphics.clear();
         _maskingShape.graphics.beginFill(0xFFFFFF, 1);
         _maskingShape.graphics.drawRect(argX, argY, _screenWidth, _screenHeight); 
         _maskingShape.graphics.endFill();
      }
   }
}