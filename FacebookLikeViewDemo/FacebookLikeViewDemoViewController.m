//
//  LikeButtonDemoViewController.m
//  LikeButtonDemo
//
//  Created by Tom Brow on 6/27/11.
//  Copyright 2011 Yardsellr. All rights reserved.
//

#import "FacebookLikeViewDemoViewController.h"
#import "Facebook+Extras.h"

@interface FacebookLikeViewDemoViewController () <FacebookLikeViewDelegate, FBSessionDelegate>

@end


@implementation FacebookLikeViewDemoViewController

@synthesize facebookLikeView=_facebookLikeView;

- (void)dealloc
{
    [_facebookLikeView release];
    [super dealloc];
}

#pragma mark FBSessionDelegate methods

- (void)fbDidLogin {
	self.facebookLikeView.alpha = 1;
    [self.facebookLikeView load];
}

- (void)fbDidLogout {
	self.facebookLikeView.alpha = 1;
    [self.facebookLikeView load];
}

#pragma mark FacebookLikeViewDelegate methods

- (void)facebookLikeViewRequiresLogin:(FacebookLikeView *)aFacebookLikeView {
    [[Facebook sharedFacebook] authorize:[NSArray array] delegate:self];
}

- (void)facebookLikeViewDidRender:(FacebookLikeView *)aFacebookLikeView {
    [UIView beginAnimations:@"" context:nil];
    [UIView setAnimationDelay:0.5];
    self.facebookLikeView.alpha = 1;
    [UIView commitAnimations];
}

- (void)facebookLikeViewDidLike:(FacebookLikeView *)aFacebookLikeView {
    NSLog(@"like %@", aFacebookLikeView.href);
}

- (void)facebookLikeViewDidUnlike:(FacebookLikeView *)aFacebookLikeView {
    NSLog(@"unlike %@", aFacebookLikeView.href);
}

#pragma mark UIViewController methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.facebookLikeView.href = [NSURL URLWithString:@"http://www.yardsellr.com"];
    self.facebookLikeView.layout = @"button_count";
    self.facebookLikeView.showFaces = NO;
    
    self.facebookLikeView.alpha = 0;
    [self.facebookLikeView load];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.facebookLikeView = nil;
}

@end