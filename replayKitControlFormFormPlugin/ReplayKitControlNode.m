//
//  ReplayKitControlFormNode.m
//  ReplayKitControlForm
//
//  Created by Jonathan Hammond on 29/12/2015.
//  Copyright © 2015 Just Add Music Media. All rights reserved.
//

#import "ReplayKitControlNode.h"

@implementation ReplayKitControlNode

+ (NSString *)defaultName {
    return @"ReplayKit Control";
}

+ (NSString *)processClassName {
    return @"ReplayKitControlPatch";
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self addPort:[[FMRPrimitiveInputPort alloc] initWithName:@"Recording" uniqueKey:@"Form.recording" defaultValue:[PMRPrimitive primitiveWithBooleanValue:NO]] portGroup:nil];
    }
    return self;
}

@end
