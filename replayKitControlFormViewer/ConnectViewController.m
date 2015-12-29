//
//  ConnectViewController.m
//  CustomPatch
//
//  Created by Max Weisel on 11/19/15.
//  Copyright © 2015 Max Weisel. All rights reserved.
//

#import "ConnectViewController.h"

@implementation ConnectViewController {
    UIImageView *_connectImageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _connectImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Connect.png"]];
    [self.view addSubview:_connectImageView];
    
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    
    
    
//    CGSize viewSize = self.view.bounds.size;
    CGRect imageFrame = _connectImageView.frame;
    imageFrame.origin.x = roundf((imageFrame.size.width)/4.0f);
    imageFrame.origin.y = roundf((imageFrame.size.height)/4.0f);
    _connectImageView.frame = imageFrame;
    
    

}




@end
