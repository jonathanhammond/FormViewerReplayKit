//
//  ReplayKitPreviewHandler.m
//  ReplayKit
//
//  Created by Matt Oakes on 18/10/2016.
//  Copyright © 2016 JustAddMusicMedia. All rights reserved.
//

#import "ReplayKitPreviewHandler.h"
#import "ReplayKitControlPatch.h"

@interface ReplayKitPreviewHandler () <RPPreviewViewControllerDelegate>

@end

@implementation ReplayKitPreviewHandler

- (id)initWithPresentationCoordinator:(PMDocumentPresentationCoordinator *)presentationCoordinator {
    self = [super init];
    if (self) {
        _presentationCoordinator = presentationCoordinator;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(replayKitFinished:) name:[ReplayKitControlPatch finishedNotificationName] object:nil];
    }
    return self;
}

- (void)replayKitFinished:(NSNotification *)notification {
    RPPreviewViewController *previewViewController = notification.object;
    previewViewController.previewControllerDelegate = self;
    
    [_presentationCoordinator.documentViewController presentViewController:previewViewController animated:YES completion:nil];
}

- (void)previewControllerDidFinish:(RPPreviewViewController *)previewController {
    [previewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)previewController:(RPPreviewViewController *)previewController didFinishWithActivityTypes:(NSSet <NSString *> *)activityTypes {
    NSLog(@"Activity - %@", activityTypes);
}

@end
