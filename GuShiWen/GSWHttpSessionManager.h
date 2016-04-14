//
//  GSWHttpSessionManager.h
//  GuShiWen
//
//  Created by byn on 16/4/11.
//  Copyright © 2016年 byn. All rights reserved.
//

#import "AFNetworking.h"
#import "Constants.h"

@interface GSWHttpSessionManager : AFHTTPSessionManager

+ (instancetype)sharedInstance;

- (void)requestDataWithPath: (NSString *)path
                 withParams: (NSDictionary *)params
             withMethodType: (NSInteger)methodType
                   andBlock: (requestBlock)block;
@end
