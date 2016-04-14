//
//  GSWNetApiManager.m
//  GuShiWen
//
//  Created by byn on 16/4/11.
//  Copyright © 2016年 byn. All rights reserved.
//

#import "GSWNetApiManager.h"
#import "GSWDatabaseOperation.h"
#import "GSWAuthorInfoResponse.h"
#import "NSObject+ObjectDynamicSerilize.h"
#import "GSWGlobalObject.h"

@implementation GSWNetApiManager

static GSWNetApiManager *manager;

+ (GSWNetApiManager *)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[GSWNetApiManager alloc] init];
    });
    return manager;
}

- (void)sendNewUpdatePoemRequest: (GSWRequestBuild *)params withBlock : (requestBlock)block {
    
        //NSDictionary *dicParams = [params buildPropertyList];
    NSInteger method = NetMethodGet;
    NSString *path = @"/api/upTimeTop11.aspx?n=1375339830&pwd=&page=1&id=0&token=gswapi";
    [[GSWHttpSessionManager sharedInstance] requestDataWithPath:path withParams:nil withMethodType:method andBlock:block];
}

- (void)sendGetAllAuthorWithPictureRequestWithBlock : (requestBlock)block {
    NSInteger method = NetMethodGet;
    NSString *path = @"/api/author/authorPicAll.aspx?token=gswapi";
    [[GSWHttpSessionManager sharedInstance] requestDataWithPath:path withParams:nil withMethodType:method andBlock:^(id data,NSError *error) {
        
        if (error) {
            return;
        }
        GSWAuthorInfoResponse *response = [NSObject initClassFromString:@"GSWAuthorInfoResponse" WithDictionary:data];
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            [[GSWDatabaseOperation sharedInstance] addItemToDatabase:[response valueForKey:@"authors"]];
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setValue:@"author" forKey:@"authorName"];
            [[GSWGlobalObject sharedInstance] getAllAuthorInfo];
        });
        
    }];
}

- (void)sendGetPoemPage: (NSInteger)currentPage withBlock : (requestBlock)block {
    NSInteger method = NetMethodGet;
    NSString *path = [NSString stringWithFormat:@"/api/shiwen/type.aspx?token=gswapi&page=%ld",currentPage];
    [[GSWHttpSessionManager sharedInstance] requestDataWithPath:path withParams:nil withMethodType:method andBlock:^(id data, NSError *error) {
        block(data,error);
    }];
}

@end





















