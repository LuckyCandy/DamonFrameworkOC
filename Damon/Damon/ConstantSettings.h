//
//  ConstantSettings.h
//  Damon
//
//  Created by DamonLi on 2017/1/5.
//  Copyright © 2017年 Pioneer. All rights reserved.
//

#ifndef ConstantSettings_h
#define ConstantSettings_h

#pragma mark - Value

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

#define NAV_STATUS_HEIGHT 64
#define TABBAR_HEIGHT 46
#define NAVBAR_HEIGHT 44
#define STATUS_HEIGHT 20

#define BUTTON_DOWN_COLOR [UIColor grayColor]

#pragma mark - Method
#define RGBColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define RGBColorAlpha(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

#endif
