//
//  GSWMainPageResponse.m
//  GuShiWen
//
//  Created by byn on 16/4/11.
//  Copyright © 2016年 byn. All rights reserved.
//

#import "GSWMainPageResponse.h"

@implementation GSWMainPageResponse

- (instancetype)init {
    if (self = [super init]) {
        self.objectMapperDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:@"PoemInfo",@"gushiwens", nil];
    }
    return self;
}

@end

@implementation PoemInfo

@end