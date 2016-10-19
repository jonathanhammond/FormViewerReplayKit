//
//  replayKitControlFormPatch.m
//  replayKitControlForm
//
//  Created by Jonathan Hammond on 29/12/2015.
//  Copyright © 2015 Just Add Music Media. All rights reserved.
//

#import "ReplayKitControlPatch.h"
#import <ReplayKit/ReplayKit.h>

@implementation ReplayKitControlPatch

- (void)processPatchWithContext:(PMRProcessContext *)context {
    if (_recording.booleanValue) {
        [self startRecording];
    }
    else {
        [self stopRecording];
    }
}

- (void)startRecording {
    RPScreenRecorder *recorder = [RPScreenRecorder sharedRecorder];
    if (!recorder.available) {
        NSLog(@"recorder is not available");
        return;
    }
    
    if (recorder.recording) {
        NSLog(@"it is recording");
        return;
    }
    
    [recorder startRecordingWithMicrophoneEnabled:YES handler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"start recorder error - %@",error);
            return;
        }
        
        NSLog(@"Recording...");
    }];
}

- (void)stopRecording {
    RPScreenRecorder *recorder = [RPScreenRecorder sharedRecorder];
    if (!recorder.recording) {
        NSLog(@"Was not recording");
        return;
    }
    
    [recorder stopRecordingWithHandler:^(RPPreviewViewController * _Nullable previewViewController, NSError * _Nullable error) {
        if (error) {
            NSLog(@"stop error - %@", error);
            return;
        }
        
        NSNotification *notification = [NSNotification notificationWithName:[ReplayKitControlPatch finishedNotificationName] object:previewViewController];
        [[NSNotificationCenter defaultCenter] postNotification:notification];
        
        NSLog(@"Finished recording");
    }];
}

+ (NSNotificationName)finishedNotificationName {
    return @"replayKitFinished";
}

@end
