//
//  SecondViewController.m
//  Damon
//
//  Created by DamonLi on 2017/1/6.
//  Copyright © 2017年 Pioneer. All rights reserved.
//

#import "SecondViewController.h"
#import "MainViewController.h"

@implementation SecondViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    [self testMethod];
    DLog(@"sssssssssss");
}

-(void)testMethod{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(10, 30, 120, 30)];
    [button setTitle:@"Second" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
}

@end
