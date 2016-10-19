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
    if ((self = [super init]) != nil) {
        // Inputs
        [self addPort:[[FMRPrimitiveInputPort alloc] initWithName:@"start" uniqueKey:@"Form.start" defaultValue:[PMRPrimitive primitiveWithBooleanValue:NO]] portGroup:nil];
        [self addPort:[[FMRPrimitiveInputPort alloc] initWithName:@"stop" uniqueKey:@"Form.stop" defaultValue:[PMRPrimitive primitiveWithBooleanValue:NO]] portGroup:nil];
        
        // Outputs
      //  [self addPort:[[FMRPrimitiveOutputPort alloc] initWithName:@"Stop" uniqueKey:@"Form.stop"] portGroup:nil];
    }
    return self;
}

- (void)dealloc {
    
}

@end
