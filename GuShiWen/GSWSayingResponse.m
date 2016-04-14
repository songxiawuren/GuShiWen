//
//  GSWSayingResponse.m
//  GuShiWen
//
//  Created by byn on 16/4/14.
//  Copyright © 2016年 byn. All rights reserved.
//

#import "GSWSayingResponse.h"

@implementation GSWSayingResponse
- (instancetype)init {
    if (self = [super init]) {
        self.objectMapperDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:@"GSWSayingInfo",@"mingjus", nil];
    }
    return self;
}
@end

@implementation GSWSayingInfo

@end
