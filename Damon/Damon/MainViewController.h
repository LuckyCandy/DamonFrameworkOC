//
//  MainViewController.h
//  Damon
//
//  Created by DamonLi on 2017/1/5.
//  Copyright © 2017年 Pioneer. All rights reserved.
//

@interface MainViewController : UITabBarController

+ (MainViewController *)sharedMainViewController;

- (void)pushViewController:(UIViewController*)viewController;

- (void)popViewController;

-(void)setTabbarHidden:(BOOL)isHidden;
@end

