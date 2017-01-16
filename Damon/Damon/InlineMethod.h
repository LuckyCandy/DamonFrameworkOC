//
//  InlineMethod.h
//  Damon
//
//  Created by DamonLi on 2017/1/10.
//  Copyright © 2017年 Pioneer. All rights reserved.
//

#ifndef InlineMethod_h
#define InlineMethod_h

#pragma mark -UINavigation Bar
CG_INLINE UIView *InlineInitNavBar(UIViewController *control){
    __autoreleasing UIView *navBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, NAV_STATUS_HEIGHT)];
    [navBar setBackgroundColor:RGBColor(39, 38, 43)];
    
    [control.view addSubview:navBar];
    [control.view bringSubviewToFront:navBar];
    return navBar;
}

CG_INLINE UILabel *InlineNavTitle(UIView *superview,NSString *name){
    UILabel *titleLabel;
    titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(60,30,SCREEN_WIDTH - 60 * 2,24)];
    titleLabel.text = name;
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightHeavy];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [superview addSubview:titleLabel];
    return titleLabel;
}

CG_INLINE UIButton *InlineNavLeftBtn(UIView *superview,NSObject *target,SEL method){
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 20, 60, 44)];
    btn.titleLabel.font = [UIFont systemFontOfSize:13];
    [btn addTarget:target action:method forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[UIImage imageNamed:@"left_back"] forState:UIControlStateNormal];
    [btn setTitle:NSLocalizedString(@"left_back_title", nil) forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [superview addSubview:btn];
    return btn;
}

#endif /* InlineMethod_h */
