//
//  replayKitControlFormPatch.h
//  replayKitControlForm
//
//  Created by Jonathan Hammond on 29/12/2015.
//  Copyright © 2015 Just Add Music Media. All rights reserved.
//

#import <Performer/Performer.h>

@interface replayKitControlFormPatch : PMRPatch

@property (nonatomic, readonly) PMRPrimitiveInputPort *start;
@property (nonatomic, readonly) PMRPrimitiveInputPort *stop;
@property (nonatomic, readonly) PMRPrimitiveOutputPort *colorOutput;

@end
