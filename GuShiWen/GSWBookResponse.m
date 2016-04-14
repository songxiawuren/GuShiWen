//
//  GSWBookResponse.m
//  GuShiWen
//
//  Created by byn on 16/4/14.
//  Copyright © 2016年 byn. All rights reserved.
//

#import "GSWBookResponse.h"

@implementation GSWBookResponse
- (instancetype)init {
    if (self = [super init]) {
        self.objectMapperDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:@"GSWBookInfo",@"books", nil];
    }
    return self;
}
@end

@implementation GSWBookInfo

@end