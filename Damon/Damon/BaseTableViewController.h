//
//  BaseTableViewController.h
//  Damon
//
//  Created by DamonLi on 2017/1/13.
//  Copyright © 2017年 Pioneer. All rights reserved.
//

@interface BaseTableViewController : BaseViewController{
    UITableView *_tableView;
}

- (instancetype)initWithFrame:(CGRect)frame withStyle:(UITableViewStyle)style;

@end
