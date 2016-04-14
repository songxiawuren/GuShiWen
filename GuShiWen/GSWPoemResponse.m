//
//  GSWPoemResponse.m
//  GuShiWen
//
//  Created by byn on 16/4/13.
//  Copyright © 2016年 byn. All rights reserved.
//

#import "GSWPoemResponse.h"

@implementation GSWPoemResponse
- (instancetype)init {
    if (self = [super init]) {
        self.objectMapperDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:@"PoemInfo",@"gushiwens", nil];
    }
    return self;
}
@end
