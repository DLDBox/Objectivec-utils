//
//  DTRippleViewController.m
//  DTRippleViewController
//
//  Created by Denis Berton
//  Copyright (c) 2013 clooket.com. All rights reserved.
//


#import "DTRippleViewController.h"


@interface DTRippleViewController ()<UIGestureRecognizerDelegate>
@end

@implementation DTRippleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
        
    self.view.backgroundColor = [UIColor clearColor];
    
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    [self cleanRipple];    
    stopUdpate = NO;
}

-(void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    stopUdpate = YES;
//    [self cleanRipple];
}

- (void)handlePanGesture:(UITapGestureRecognizer *)gesture {
  CGPoint location = [gesture locationInView:nil];
  [_ripple initiateRippleAtLocation:location];
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}
@end


