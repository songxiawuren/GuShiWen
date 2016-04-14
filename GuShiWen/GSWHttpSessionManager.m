//
//  GSWHttpSessionManager.m
//  GuShiWen
//
//  Created by byn on 16/4/11.
//  Copyright © 2016年 byn. All rights reserved.
//

#import "GSWHttpSessionManager.h"

@implementation GSWHttpSessionManager
static GSWHttpSessionManager *manager;

+ (instancetype)sharedInstance {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[GSWHttpSessionManager alloc] initWithBaseURL:[NSURL URLWithString:baseHost]];
    });
    return manager;
}

- (id)initWithBaseURL:(NSURL *)url {
    
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    return self;
}

- (void)requestDataWithPath: (NSString *)path
                 withParams: (NSDictionary *)params
             withMethodType: (NSInteger)methodType
                   andBlock: (requestBlock)block {

    switch (methodType) {
        case NetMethodGet: {
            [self GET:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                block(responseObject,task.error);
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                block(task,error);
            }];
        }
            break;
        case NetMethodPost: {
            
            [self POST:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                block(responseObject,task.error);
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                block(nil,error);
            }];

        }
            break;
    }
}
@end
