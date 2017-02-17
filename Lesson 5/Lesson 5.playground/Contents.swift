//: Playground - noun: a place where people can play

import UIKit

// Gestures
//input from user on the screen
// can get every single location...but dont do that
// the user thinks of interaction as a gesture.
// iOS has an abstraction layer that thinks ov groups of locations and interactions a
// as gestures. no need to do the logic of how fast/ position of groups of
// locations

// gestures are recognized instances of
UIGestureRecognizer

// two parts
// 1 adding a gesture recog to a UIView -- asking the uiview to recognize that gesture
// 2 providing a method to handle the gesture -- not necessarily by the ui view
// essentially goes through a state machine (repeatedly)

// usually the first of these things done by your controller, doesnt have to be done by it, but its good to be done by it.
// but some views, its so fundamental, its already added - i.e. scrollview


// generally modifying only how it displays itself ->
//     the handler modified by the controller, 
//     the view, someone else, but never by the model.

// if the gesture changing the modler ->
//     then definitly the modler

// adding a gesture recognizer 
//     need to add a place
//     great place is did set

@IBOutlet weak var pannableView: UIView{
    didSet{
        let recognizer = UIPanGestureRecognizer( // creating panGestureRecognizer
            target: self, action: #selector(ViewController.pan(_:)) // takes 2 arguments
            //(1, who is going to handle the gesture when recognized (self: controller), 
            // 2: what method do you want me to invoke in self when recognized?: needs to be obj compat selector -> for this to be vis this needs to be inherit from NSObject)
            // create a compat obj-c compat selector, including argument names (_:)
        )
        pannableView.addGestureRecognizer(recognizer) // as soon as added, will recognize pan gestures to self
    }
}

// implementing handler -->
// looking at pan 
func translationInView(UIView) -> CGPoint // cumu since start of rec
func velocityInView(UIView) -> CGPoint // how fast in points p/sec
func setTranslation(CGPoint, inView:UIView)


var state: UIGestureRecognizer{get}

//.possible until rec starts
// for discrete - changes to .recognized swipe
// continuous from .Began thru .Changed to .Ended  -finger down to finger up -- in pan
// can go to .Failed or .Cancelled (e.g. interrupted gestures in phone calls or button presses)


// pan handler would look like
func pan(gesture: UIPanGestureRecognizer){
    // action was pan(_:) if no _: then no gesture arg
    // need pan gesture because need to know how far pan has gone
    switch gesture.state{
        //if changed or ended, else ignore
    case .changed: fallthrough
        // usually would just write case.changed,.Ended:
        // but this allows code to execute code for the next case down
    case .ended:
        let translation = gesture.translation(in: pannableView)
        // get the translation in the pannable view from the gesture
        // update anything that depends on the pan using translation.x and .y
        gesture.setTranslation(CGPointZero, in: pannableView)
        // set the translation back to zero so that the next call the translation will be incremental from the last time it was sent
    default: break
    }
}

// Pinches
UIPinchGestureRecognizer
var scale: CGFloat  // can reset
var velocity: CGFloat {get} // scale factor per sec

UIRotationGestureRecognizer
var rotation: CGFloat // not read only in rad
var velocity: CGFloat {get} // rad per sec

UISwipeGestureRecognizer
// set direction and number of fingers you want and then look for .Recognized
var direction: UISwipeGestureRecognizer // which swipes desired
var numberOfTouchesRequired: Int // finger count

UITapGestureRecognizer
//set nnumber of taps and fingers then look for .Ended
var numberOfTapsRequired: Int // single double ets
var numberOfTouchesRequired: Int //finger Count


