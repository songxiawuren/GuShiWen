//
//  GSWPoemResponse.h
//  GuShiWen
//
//  Created by byn on 16/4/13.
//  Copyright © 2016年 byn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GSWMainPageResponse.h"

@interface GSWPoemResponse : NSObject

@property (nonatomic,strong) NSString *sumCount;
@property (nonatomic,strong) NSString *sumPage;
@property (nonatomic,strong) NSString *currentPage;
@property (nonatomic,strong) NSString *pageTitle;
@property (nonatomic,strong) NSString *keyStr;
@property (nonatomic,strong) NSMutableArray *gushiwens;

@property (nonatomic,strong) NSDictionary *objectMapperDictionary;

@end
