//
//  AFNetworkUtil.m
//  book
//
//  Created by chenxb on 17/1/21.
//  Copyright © 2017年 grace. All rights reserved.
//

#import "AFNetworkUtil.h"

@implementation AFNetworkUtil
+ (AFHTTPSessionManager*) getManager
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"application/x-javascript", nil];
    return manager;
}
@end
