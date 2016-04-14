//
//  GSWAuthorInfoResponse.m
//  GuShiWen
//
//  Created by byn on 16/4/13.
//  Copyright © 2016年 byn. All rights reserved.
//

#import "GSWAuthorInfoResponse.h"

@implementation GSWAuthorInfoResponse

- (instancetype)init {
    if (self = [super init]) {
        self.objectMapperDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:@"GSWAuthorInfo",@"authors", nil];
    }
    return self;
}

@end

@implementation GSWAuthorInfo

@end
