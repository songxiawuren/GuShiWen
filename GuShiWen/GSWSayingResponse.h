//
//  GSWSayingResponse.h
//  GuShiWen
//
//  Created by byn on 16/4/14.
//  Copyright © 2016年 byn. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface GSWSayingInfo : NSObject

@property (nonatomic,strong) NSString *id;
@property (nonatomic,strong) NSString *nameStr;
@property (nonatomic,strong) NSString *classStr;
@property (nonatomic,strong) NSString *type;
@property (nonatomic,strong) NSString *shiID;
@property (nonatomic,strong) NSString *exing;
@property (nonatomic,strong) NSString *author;
@property (nonatomic,strong) NSString *shiName;
@property (nonatomic,strong) NSString *ipStr;

@end

@interface GSWSayingResponse : NSObject

@property (nonatomic,strong) NSString *sumCount;
@property (nonatomic,strong) NSString *sumPage;
@property (nonatomic,strong) NSString *currentPage;
@property (nonatomic,strong) NSString *pageTitle;
@property (nonatomic,strong) NSString *keyStr;
@property (nonatomic,strong) NSMutableArray *mingjus;

@property (nonatomic,strong) NSDictionary *objectMapperDictionary;

@end

