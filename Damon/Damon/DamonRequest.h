//
//  DamonRequest.h
//  Damon
//
//  Created by DamonLi on 2017/1/13.
//  Copyright © 2017年 Pioneer. All rights reserved.
//

@interface DamonRequest : NSObject

+ (DamonRequest *)sharedRequest;

-(void)getRequestWithUrl:(NSString *)url params:(NSDictionary *)params completion:(void(^)(id result))completionBlock failure:(void(^)(void))failureBlock;

@end
