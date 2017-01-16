//
//  DamonRequest.m
//  Damon
//
//  Created by DamonLi on 2017/1/13.
//  Copyright © 2017年 Pioneer. All rights reserved.
//

#import "DamonRequest.h"
#import "AFNetworking.h"

@implementation DamonRequest

#pragma mark return MainViewController's singleton
+ (DamonRequest *)sharedRequest{
    static DamonRequest *damonRequest = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        damonRequest = [[self alloc] init];
    });
    return damonRequest;
}

-(void)getRequestWithUrl:(NSString *)url params:(NSDictionary *)params completion:(void(^)(id result))completionBlock failure:(void(^)(void))failureBlock{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *obj = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        completionBlock(obj);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        DLog(@"网络连接失败,%@",error.localizedDescription);
    }];
}

@end
