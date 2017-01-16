//
//  FirstViewController.m
//  Damon
//
//  Created by DamonLi on 2017/1/6.
//  Copyright © 2017年 Pioneer. All rights reserved.
//

#import "FirstViewController.h"
#import "MainViewController.h"
#import "OtherViewController.h"

@implementation FirstViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    DLog(@"wwwwwwwwww");
    [self testMethod];
    [self.view setBackgroundColor:[UIColor redColor]];
}

-(void)testMethod{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(10, 30, 120, 30)];
    [button setTitle:@"First" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void)clickAction:(UIButton *)sender{
    OtherViewController *vc = [[OtherViewController alloc] initWithFrame:CGRectMake(0, NAV_STATUS_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - NAV_STATUS_HEIGHT) withStyle:UITableViewStylePlain];
    [[MainViewController sharedMainViewController] pushViewController:vc];
}


@end
