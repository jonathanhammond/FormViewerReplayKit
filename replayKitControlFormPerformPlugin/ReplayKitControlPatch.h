//
//  ReplayKitControlFormPatch.h
//  ReplayKitControlForm
//
//  Created by Jonathan Hammond on 29/12/2015.
//  Copyright © 2015 Just Add Music Media. All rights reserved.
//

#import <Performer/Performer.h>

@interface ReplayKitControlPatch : PMRPatch

@property (nonatomic, readonly) PMRPrimitiveInputPort *recording;

+ (NSNotificationName)finishedNotificationName;

@end
