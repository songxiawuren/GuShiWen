//
//  GSWAuthorInfoResponse.h
//  GuShiWen
//
//  Created by byn on 16/4/13.
//  Copyright © 2016年 byn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GSWAuthorInfoResponse : NSObject

@property (nonatomic,strong) NSArray *authors;
@property (nonatomic,strong) NSDictionary *objectMapperDictionary;
@end

@interface GSWAuthorInfo : NSObject

@property (nonatomic,strong) NSString *id;
@property (nonatomic,strong) NSString *nameStr;
@property (nonatomic,strong) NSString *cont;
@property (nonatomic,strong) NSString *chaodai;
@property (nonatomic,strong) NSString *pic;
@property (nonatomic,strong) NSString *likes;
@property (nonatomic,strong) NSString *ipStr;
@property (nonatomic,strong) NSString *creTime;

@end