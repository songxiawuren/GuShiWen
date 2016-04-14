//
//  GSWDatabaseOperation.m
//  GuShiWen
//
//  Created by byn on 16/4/12.
//  Copyright © 2016年 byn. All rights reserved.
//

#import "GSWDatabaseOperation.h"
#import "GSWDatabaseManager.h"
#import "GSWAuthorInfoResponse.h"

@implementation GSWDatabaseOperation

static GSWDatabaseOperation *manager;
+ (GSWDatabaseOperation *)sharedInstance {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[GSWDatabaseOperation alloc] init];
    });
    return manager;
}

- (NSArray *)getAuthorImageWithAuthorName : (NSString *)name {
    
    __block NSMutableArray *array = [[NSMutableArray alloc] init];
    NSString *queryString = @"SELECT pic FROM authorInfo WHERE nameStr = ?";
    NSLog(@"before queue");
    FMDatabaseQueue *queue = [[GSWDatabaseManager sharedInstance] databaseQueue];
    [queue inDatabase:^(FMDatabase *db) {
        FMResultSet *rs = [db executeQuery:queryString,name];
        NSLog(@"in queue");
        if (!rs) {
            [rs close];
            return;
        }
        while ([rs next]) {
            [array addObject:[rs stringForColumn:@"pic"]];
        }
        [rs close];
    }];
    NSLog(@"end queue");
    return array;
}

- (NSMutableDictionary *)getAllAuthorInfo {
    
    __block NSMutableDictionary *authorInfo = [[NSMutableDictionary alloc] init];
    
    NSString *queryString = @"SELECT * FROM authorInfo";
    FMDatabaseQueue *queue = [[GSWDatabaseManager sharedInstance] databaseQueue];
    [queue inDatabase:^(FMDatabase *db) {
        FMResultSet *rs = [db executeQuery:queryString];
        
        if (!rs) {
            [rs close];
            return;
        }
        while ([rs next]) {
            [authorInfo setValue:[rs stringForColumn:@"pic"] forKey:[rs stringForColumn:@"nameStr"]];
        }
        [rs close];
    }];
    
    return authorInfo;

}

- (void)addItemToDatabase : (NSArray *)itemArray {
    
    FMDatabaseQueue *queue = [[GSWDatabaseManager sharedInstance] databaseQueue];
    [queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        
       NSString *deleteSql = @"DELETE FROM authorInfo";
        if (![db executeUpdate:deleteSql]) {
            *rollback = YES;
            return;
        }
        
        NSString *insertSql = @"INSERT INTO authorInfo(id,nameStr,cont,chaodai,pic,likes,ipStr,creTime) VALUES (?,?,?,?,?,?,?,?)";
        for (GSWAuthorInfo *authorInfo in itemArray) {
            NSInteger authorId = [authorInfo.id integerValue];
            NSString *nameStr = authorInfo.nameStr ?:@"";
            NSString *cont = authorInfo.cont?:@"";
            NSString *chaodai = authorInfo.chaodai?:@"";
            NSString *pic = authorInfo.pic?:@"";
            NSString *likes = authorInfo.likes?:@"";
            NSString *ipStr = authorInfo.ipStr?:@"";
            NSString *creTime = authorInfo.creTime?:@"";
            if (![db executeUpdate:insertSql,[NSNumber numberWithInteger:authorId],nameStr,cont,chaodai,pic,likes,ipStr,creTime]) {
                *rollback = YES;
                return;
            }
        }
        if (!*rollback) {
            NSLog(@"rollback !!!");
        }
        
    }];
    
    NSLog(@"rollback return");
    
}


@end


























