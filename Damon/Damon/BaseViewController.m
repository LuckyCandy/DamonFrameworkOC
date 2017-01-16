//
//  BaseViewController.m
//  Damon
//
//  Created by DamonLi on 2017/1/6.
//  Copyright © 2017年 Pioneer. All rights reserved.
//

#import "BaseViewController.h"
#import "MainViewController.h"

@implementation BaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[MainViewController sharedMainViewController] setTabbarHidden:YES];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[MainViewController sharedMainViewController] setTabbarHidden:NO];
}

@end
