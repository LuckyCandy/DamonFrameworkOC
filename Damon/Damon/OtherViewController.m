//
//  OtherViewController.m
//  Damon
//
//  Created by DamonLi on 2017/1/10.
//  Copyright © 2017年 Pioneer. All rights reserved.
//

#import "OtherViewController.h"
#import "MainViewController.h"
#import "MJRefresh.h"
#import "SongModel.h"

@interface OtherViewController()<UITableViewDataSource>{
    UIView *navBar;
    NSMutableArray *songList;
    int currentPage;
}

@end

@implementation OtherViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    //[self.view setBackgroundColor:[UIColor blueColor]];
    
    navBar = InlineInitNavBar(self);
    InlineNavTitle(navBar, @"测试");
    InlineNavLeftBtn(navBar, self, @selector(backAction));
    _tableView.dataSource = self;
    [_tableView.mj_header beginRefreshing];
    songList = [[NSMutableArray alloc] init];
    currentPage = 0;
}

-(void)backAction{
    [[MainViewController sharedMainViewController] popViewController];
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [songList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SongModel *song = [songList objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = song.title;
    return cell;
}

#pragma mark refresh table data
-(void)refreshAction{
    [self loadSongData:YES];
}

-(void)loadMoreAction{
    [self loadSongData:NO];
}

-(void)loadSongData:(BOOL)isRefresh{
    if(isRefresh){
        currentPage = 0;
        [songList removeAllObjects];
    }else{
        currentPage ++;
    }
    [[DamonRequest sharedRequest] getRequestWithUrl:@"http://tingapi.ting.baidu.com/v1/restserver/ting" params:@{@"method":@"baidu.ting.billboard.billList",@"type":@1,@"size":@10,@"offset":[NSString stringWithFormat:@"%d",currentPage * 10]} completion:^(NSDictionary* result){
        NSArray *array = [result objectForKey:@"song_list"];
        for(int index = 0;index < [array count];index ++){
            SongModel *song = [SongModel mj_objectWithKeyValues:[array objectAtIndex:index]];
            [songList addObject:song];
        }
        [_tableView reloadData];
        if(isRefresh){
            [_tableView.mj_header endRefreshing];
        }else if([array count] > 0){
            [_tableView.mj_footer resetNoMoreData];
        }else{
            [_tableView.mj_footer endRefreshingWithNoMoreData];
        }
        
    } failure:^(){
    }];
}

@end
