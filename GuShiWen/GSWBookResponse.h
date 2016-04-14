//
//  GSWBookResponse.h
//  GuShiWen
//
//  Created by byn on 16/4/14.
//  Copyright © 2016年 byn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GSWBookInfo : NSObject

@property (nonatomic,strong) NSString *id;
@property (nonatomic,strong) NSString *nameStr;
@property (nonatomic,strong) NSString *author;
@property (nonatomic,strong) NSString *chaodai;
@property (nonatomic,strong) NSString *cont;
@property (nonatomic,strong) NSString *fenlei;
@property (nonatomic,strong) NSString *axing;
@property (nonatomic,strong) NSString *bxing;
@property (nonatomic,strong) NSString *cxing;
@property (nonatomic,strong) NSString *dxing;
@property (nonatomic,strong) NSString *ipStr;
@property (nonatomic,strong) NSString *nameStrKey;
@property (nonatomic,strong) NSString *pic;
@property (nonatomic,strong) NSString *classStr;
@property (nonatomic,strong) NSString *type;
@property (nonatomic,strong) NSString *creTime;

@end

@interface GSWBookResponse : NSObject

@property (nonatomic,strong) NSString *sumCount;
@property (nonatomic,strong) NSString *sumPage;
@property (nonatomic,strong) NSString *currentpage;
@property (nonatomic,strong) NSString *pageTitle;
@property (nonatomic,strong) NSString *keyStr;
@property (nonatomic,strong) NSMutableArray *books;

@property (nonatomic,strong) NSDictionary *objectMapperDictionary;

@end
