//
//  AppDelegate.m
//  replayKitDemo
//
//  Created by Jonathan Hammond on 29/12/15.
//  Copyright © 2015 Jonathan Hammond. All rights reserved.


#import "AppDelegate.h"
#import <Performer/PMDocumentConnectionManager.h>
#import <Performer/PMDocumentCacheManager.h>
#import <Performer/PMDocumentPresentationCoordinator.h>
#import "ConnectViewController.h"
#import "ReplayKitPreviewHandler.h"

@interface AppDelegate ()

@property (strong, nonatomic) PMDocumentConnectionManager *connectionManager;
@property (strong, nonatomic) PMDocumentCacheManager *documentManager;
@property (strong, nonatomic) PMDocumentPresentationCoordinator *presentationCoordinator;
@property (strong, nonatomic) ReplayKitPreviewHandler *replayKitPreviewHandler;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // presentation coordinator manages showing form documents
    _presentationCoordinator = [[PMDocumentPresentationCoordinator alloc] initWithWindow:self.window];
    
    // Handle the replay kit callbacks
    _replayKitPreviewHandler = [[ReplayKitPreviewHandler alloc] initWithPresentationCoordinator:_presentationCoordinator];
    
    _documentManager = [[PMDocumentCacheManager alloc] init];
    
    // assemble the main UI layout
    self.window.rootViewController = [[ConnectViewController alloc] init];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    application.idleTimerDisabled = YES;
    
    // start the server to handle inbound connections now that the app is ready
    _connectionManager = [[PMDocumentConnectionManager alloc] initWithPresentationCoordinator:_presentationCoordinator
                                                                                 cacheManager:_documentManager];
    [_connectionManager restartServer];
    return YES;
}

@end
