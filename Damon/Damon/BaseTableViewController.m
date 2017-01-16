//
//  BaseTableViewController.m
//  Damon
//
//  Created by DamonLi on 2017/1/13.
//  Copyright © 2017年 Pioneer. All rights reserved.
//

#import "BaseTableViewController.h"
#import "MainViewController.h"
#import "MJRefresh.h"

@implementation BaseTableViewController

- (instancetype)initWithFrame:(CGRect)frame withStyle:(UITableViewStyle)style
{
    self = [super initWithNibName:nil bundle:nil];
    if(self){
        _tableView = [[UITableView alloc] initWithFrame:frame style:style];
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshAction)];
        _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreAction)];
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        [self.view addSubview:_tableView];
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

#pragma mark refresh table data
-(void)refreshAction{
    DLog(@"Base TableView Refresh Table Data");
}

#pragma mark loadmore table data
-(void)loadMoreAction{
    DLog(@"Base TableView LoadMore Table Data");
}



@end
