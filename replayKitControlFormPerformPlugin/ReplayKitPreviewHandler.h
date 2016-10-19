//
//  ReplayKitPreviewHandler.h
//  ReplayKit
//
//  Created by Matt Oakes on 18/10/2016.
//  Copyright © 2016 JustAddMusicMedia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReplayKit/ReplayKit.h>
#import <Performer/PMDocumentPresentationCoordinator.h>

@interface ReplayKitPreviewHandler : NSObject

- (id)initWithPresentationCoordinator:(PMDocumentPresentationCoordinator *)presentationCoordinator;

@property (nonatomic, strong, readonly) PMDocumentPresentationCoordinator *presentationCoordinator;

@end
