//
//  replayKitControlFormPlugin.m
//  replayKitControlForm
//
//  Created by Jonathan Hammond on 29/12/2015.
//  Copyright © 2015 Just Add Music Media. All rights reserved.
//

#import "ReplayKitControlPlugin.h"
#import "ReplayKitControlNode.h"

@implementation ReplayKitControlPlugin

+ (NSString *)name {
    return @"ReplayKit Control";
}

+ (NSString *)description {
    return @"Created by Jonathan Hammond on 29/12/2015";
}

+ (NSArray *)nodeClasses {
    return @[[ReplayKitControlNode class]];
}

@end
