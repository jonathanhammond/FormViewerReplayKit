//
//  ViewController.m
//  replayKitDemo
//
//  Created by JackSong on 15/10/7.
//  Copyright © 2015年 JoeySong. All rights reserved.
//

#import "ViewController.h"
#import "CoverView.h"
#import <Performer/PMDocumentConnectionManager.h>
#import <Performer/PMDocumentCacheManager.h>
#import <Performer/PMDocumentPresentationCoordinator.h>
#import "ConnectViewController.h"
@interface ViewController ()<RPPreviewViewControllerDelegate>

@property (strong, nonatomic) PMDocumentConnectionManager *connectionManager;
@property (strong, nonatomic) PMDocumentCacheManager *documentManager;
@property (strong, nonatomic) PMDocumentPresentationCoordinator *presentationCoordinator;
@property (nonatomic, weak) UILabel *timeLable;
@property (nonatomic, weak) UIButton *startBtn;
@property (nonatomic, weak) UIButton *stopBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    
    

    
  //  application.idleTimerDisabled = YES;
    
    // start the server to handle inbound connections now that the app is ready
    _connectionManager = [[PMDocumentConnectionManager alloc] initWithPresentationCoordinator:_presentationCoordinator
                                                                                 cacheManager:_documentManager];
    [_connectionManager restartServer];
    
    
}



- (void)setupUI
{
    
    //Form Viewer
    UIWindow * form = [[UIWindow alloc] init];
    //UIWindow * form = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    
    
    // presentation coordinator manages showing form documents
    _presentationCoordinator = [[PMDocumentPresentationCoordinator alloc] initWithWindow:form];
    
  //  _documentManager = [[PMDocumentCacheManager alloc] init];
    
    [self.view addSubview:form];
    form.rootViewController = [[ConnectViewController alloc] init];
   // form.backgroundColor = [UIColor blackColor];
    form.frame = CGRectMake(0, 200, 100, 100);
    [form makeKeyAndVisible];
    
    
    UIButton *start = [UIButton buttonWithType:UIButtonTypeCustom];
    self.startBtn = start;
    [self.view addSubview:start];
    [start setTitle:@"start record" forState:UIControlStateNormal];
    start.backgroundColor = [UIColor greenColor];
    start.frame = CGRectMake(0, 0, 100, 100);
    [start addTarget:self action:@selector(startClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *stop = [UIButton buttonWithType:UIButtonTypeCustom];
    self.stopBtn = stop;
    [self.view addSubview:stop];
    [stop setTitle:@"stop record" forState:UIControlStateNormal];
    stop.frame = CGRectMake(0, 100, 100, 100);
    stop.backgroundColor = [UIColor redColor];
    [stop addTarget:self action:@selector(stopClicked:) forControlEvents:UIControlEventTouchUpInside];
    

    
    
}

- (void)startClicked:(UIButton *)btn
{
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
        }
        [self.startBtn setTitle:@"Recording" forState:UIControlStateNormal];
    }];
}

- (void)stopClicked:(UIButton *)btn
{
    RPScreenRecorder *recorder = [RPScreenRecorder sharedRecorder];
    if (!recorder.recording) {
        return;
    }
    [recorder stopRecordingWithHandler:^(RPPreviewViewController * _Nullable previewViewController, NSError * _Nullable error) {
        if (error) {
            NSLog(@"stop error - %@",error);
        }
        [self.startBtn setTitle:@"start record" forState:UIControlStateNormal];
        previewViewController.previewControllerDelegate = self;
//        NSLog(@"subviews-%@",previewViewController.view.subviews);
//        NSLog(@"subviews-%@",previewViewController.view.subviews[0].subviews);
//        NSLog(@"subviews-%@",previewViewController.view.subviews[0].subviews[0].subviews);

//        id view = previewViewController.view.subviews[0];
//        id remote = [view performSelector:@selector(remoteViewController)];
//        NSLog(@"remote- %@",remote);
        
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        CGFloat height = [UIScreen mainScreen].bounds.size.height;
//        UIView *coverView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width - 50, 62)];
//        coverView.backgroundColor = [UIColor redColor];
//        [previewViewController.view addSubview:coverView];
        CoverView *cover = [[CoverView alloc] init];
        cover.frame = CGRectMake(0, 0, width, height);
        cover.backgroundColor = [UIColor purpleColor];
//        cover.alpha = 0.5;
        cover.userInteractionEnabled = NO;
//        [previewViewController.view.subviews[0].subviews[0] addSubview:cover];
        
        
//        SEL originalSelector = @selector(loadPreviewViewControllerWithMovieURL: completion:);
//        [previewViewController performSelector:originalSelector withObject:[NSURL URLWithString:@"good"] withObject:nil];
        
//        [self presentViewController:previewViewController animated:YES completion:nil];
        [self presentViewController:previewViewController animated:NO completion:^{
            NSLog(@"complition");
        }];
    }];
}

- (void)previewControllerDidFinish:(RPPreviewViewController *)previewController
{
    [previewController dismissViewControllerAnimated:YES completion:nil];
}

/* @abstract Called when the view controller is finished and returns a set of activity types that the user has completed on the recording. The built in activity types are listed in UIActivity.h. */
- (void)previewController:(RPPreviewViewController *)previewController didFinishWithActivityTypes:(NSSet <NSString *> *)activityTypes
{
    NSLog(@"activity - %@",activityTypes);
}

@end
