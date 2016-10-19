//
//  replayKitControlFormPatch.m
//  replayKitControlForm
//
//  Created by Jonathan Hammond on 29/12/2015.
//  Copyright © 2015 Just Add Music Media. All rights reserved.
//

#import "ReplayKitControlPatch.h"
#import "ViewController.h"

@implementation ReplayKitControlPatch

- (void)processPatchWithContext:(PMRProcessContext *)context {

        RIColorRGBA randomColor = RIColorBlackRGBA;
    // Get the value from the on/off input.
    BOOL onOff = _start.booleanValue;
    
    // If the input is on, create a random color.
    if (onOff)
     
   //Hmmm how do reference/call "startClicked" method from the Viewer class??? I stumped ... note at best I am hacking no real experience in Obj c :( Promise to Objective-C programming guide soon :)
        

 //   [self startClicked];
        
           _colorOutput.colorValue = randomColor;
        }


@end
