//
//  replayKitControlFormPlugin.m
//  replayKitControlForm
//
//  Created by Jonathan Hammond on 29/12/2015.
//  Copyright © 2015 Just Add Music Media. All rights reserved.
//

#import "replayKitControlFormPlugin.h"
#import "replayKitControlFormNode.h"

@implementation replayKitControlFormPlugin

+ (NSString *)name {
    return @"replayKitControlForm";
}

+ (NSString *)description {
    return @"Created by Jonathan Hammond on 29/12/2015";
}

+ (NSArray *)nodeClasses {
    return @[[replayKitControlFormNode class]];
}

@end
