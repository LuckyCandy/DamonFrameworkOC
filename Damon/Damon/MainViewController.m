//
//  MainViewController.m
//  Damon
//
//  Created by DamonLi on 2017/1/5.
//  Copyright © 2017年 Pioneer. All rights reserved.
//

#import "MainViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@interface MainViewController (){
    NSArray *tabTitleArrar;
    UIView *tabbar;
    NSInteger currentTabIndex;
}

@end

@implementation MainViewController

#pragma mark return MainViewController's singleton
+ (MainViewController *)sharedMainViewController{
    static MainViewController *mainViewControllerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        mainViewControllerInstance = [[self alloc] init];
    });
    return mainViewControllerInstance;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    if(SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7")) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    tabTitleArrar = [[NSArray alloc] initWithObjects:@"TAB1",@"TAB2",@"TAB3",@"TAB4", nil];
    [self createCustomTabbar];
    [self initTabbarControllers];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark create tabbar with self-defining style
-(void)createCustomTabbar{
    //Find & Hide all default tabbar view
    for(UIView *subview in self.view.subviews){
        if([subview isKindOfClass:[UITabBar class]]){
            subview.hidden = YES;
            break;
        }
    }
    
    if(!tabbar){
        CALayer *uplayer = [[CALayer alloc] init];
        uplayer.backgroundColor = [[UIColor grayColor] CGColor];
        uplayer.frame = CGRectMake(0, 0, SCREEN_WIDTH, 0.5f);
        tabbar = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - TABBAR_HEIGHT, SCREEN_WIDTH, TABBAR_HEIGHT)];
        [tabbar setBackgroundColor:RGBColorAlpha(235, 236, 238, 0.6)];
        [tabbar setUserInteractionEnabled:YES];
        [tabbar.layer addSublayer:uplayer];
        
        CGFloat buttonWidth = SCREEN_WIDTH / [tabTitleArrar count];
        for(int index = 0; index < [tabTitleArrar count];index ++){
            UIButton *reuseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [reuseBtn setFrame:CGRectMake(index * buttonWidth, 0, buttonWidth, TABBAR_HEIGHT)];
            reuseBtn.tag = index;
            [reuseBtn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tabbar-unselect-%d",index]] forState:UIControlStateNormal];
            [reuseBtn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"tabbar-selected-%d",index]] forState:UIControlStateSelected];
            [reuseBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 25, 12, 0)];
            reuseBtn.titleLabel.font = [UIFont systemFontOfSize:10];
            [reuseBtn setTitle:[tabTitleArrar objectAtIndex:index] forState:UIControlStateNormal];
            [reuseBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [reuseBtn setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
            [reuseBtn setTitleEdgeInsets:UIEdgeInsetsMake(25, 0, 0, 16)];
            [reuseBtn addTarget:self action:@selector(switchTab:) forControlEvents:UIControlEventTouchUpInside];
            [tabbar addSubview:reuseBtn];
            if(index == 0){
                [reuseBtn setSelected:YES];
                currentTabIndex = index;
            }
        }
    }
    [self.view addSubview:tabbar];
}

#pragma mark switch tabbar button
-(void)switchTab:(UIButton *)sender{
    [UIView animateWithDuration:0.5 animations:^{
        sender.imageView.transform = CGAffineTransformRotate(sender.transform, M_PI);
    }];
    //Reset to default
    sender.imageView.transform = CGAffineTransformIdentity;
    
    if(sender.tag == currentTabIndex){
        return;
    }
    for(UIView *subView in tabbar.subviews){
        if(subView.tag == sender.tag && [subView isKindOfClass:[UIButton class]]){
            [(UIButton *)subView setSelected:YES];
        }else{
            [(UIButton *)subView setSelected:NO];
        }
    }
    currentTabIndex = sender.tag;
    self.selectedIndex = currentTabIndex;
}

-(void)initTabbarControllers{
    FirstViewController *fvc = [[FirstViewController alloc] init];
    UINavigationController *fvcNav = [[UINavigationController alloc] initWithRootViewController:fvc];
    [fvcNav setNavigationBarHidden:YES animated:NO];
    
    SecondViewController *svc = [[SecondViewController alloc] init];
    UINavigationController *svcNav = [[UINavigationController alloc] initWithRootViewController:svc];
    [svcNav setNavigationBarHidden:YES animated:NO];
    
    FirstViewController *fvc2 = [[FirstViewController alloc] init];
    UINavigationController *fvcNav2 = [[UINavigationController alloc] initWithRootViewController:fvc2];
    [fvcNav2 setNavigationBarHidden:YES animated:NO];
    
    SecondViewController *svc2 = [[SecondViewController alloc] init];
    UINavigationController *svcNav2 = [[UINavigationController alloc] initWithRootViewController:svc2];
    [svcNav2 setNavigationBarHidden:YES animated:NO];
    
    self.viewControllers = @[fvcNav,svcNav,fvc2,svc2];
}

#pragma mark - Push & Pop
- (void)pushViewController:(UIViewController*)viewController{
    NSUInteger currentIndex = [self selectedIndex];
    UINavigationController* navCtrl = [[self viewControllers] objectAtIndex:currentIndex];
    [navCtrl pushViewController:viewController animated:YES];
}

- (void)popViewController{
    NSUInteger currentIndex = [self selectedIndex];
    UINavigationController* navCtrl = [[self viewControllers] objectAtIndex:currentIndex];
    [navCtrl popViewControllerAnimated:YES];
}

-(void)setTabbarHidden:(BOOL)isHidden{
    [tabbar setHidden:isHidden];
}

@end
