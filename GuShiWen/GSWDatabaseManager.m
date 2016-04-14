//
//  GSWDatabaseManager.m
//  GuShiWen
//
//  Created by byn on 16/4/12.
//  Copyright © 2016年 byn. All rights reserved.
//

#import "GSWDatabaseManager.h"

@implementation GSWDatabaseManager
static GSWDatabaseManager *manager;
+ (GSWDatabaseManager *)sharedInstance {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[GSWDatabaseManager alloc] init];
    });
    return manager;    
}

@synthesize databaseQueue = _databaseQueue;

- (NSString *)databaseDirectory {
    NSString *cacheDirectory = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    cacheDirectory = [cacheDirectory stringByAppendingPathComponent:@"Database"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDir = YES;
    BOOL isExist = [fileManager fileExistsAtPath:cacheDirectory isDirectory:&isDir];
    if (!isExist) {
        [fileManager createDirectoryAtPath:cacheDirectory withIntermediateDirectories:YES attributes:nil error:NULL];
    }
    return cacheDirectory;
}

- (FMDatabaseQueue *)databaseQueue {
    if (!_databaseQueue) {
        _databaseQueue = [FMDatabaseQueue databaseQueueWithPath:[[self databaseDirectory] stringByAppendingPathComponent:@"gswAuthorInfo.sqlite"]];
        if (nil == _databaseQueue) {
            return nil;
        }
        [self createTableIfNeeded];
    }
    return _databaseQueue;
}

- (void)createTableIfNeeded {
    NSString *sql = [NSString stringWithFormat:@"%@",@"CREATE TABLE IF NOT EXISTS authorInfo (id INTEGER PRIMARY KEY NOT NULL, \
                                                                                             nameStr TEXT, \
                                                                                             cont TEXT, \
                                                                                             chaodai TEXT, \
                                                                                             pic TEXT, \
                                                                                             likes TEXT, \
                                                                                             ipStr TEXT, \
                                                                                             creTime TEXT)"];
    [_databaseQueue inDatabase:^(FMDatabase *db) {
        BOOL b = [db executeUpdate:sql];
        int a = 0;
    }];
}

- (void)closeDatabase {
    if (_databaseQueue) {
        [_databaseQueue close];
    }
}
@end
