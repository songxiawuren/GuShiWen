//
//  GSWDatabaseManager.h
//  GuShiWen
//
//  Created by byn on 16/4/12.
//  Copyright © 2016年 byn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"

@interface GSWDatabaseManager : NSObject
+ (GSWDatabaseManager *)sharedInstance;
@property (nonatomic ,strong) FMDatabaseQueue *databaseQueue;
@end
