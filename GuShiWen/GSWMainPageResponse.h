//
//  GSWMainPageResponse.h
//  GuShiWen
//
//  Created by byn on 16/4/11.
//  Copyright © 2016年 byn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GSWMainPageResponse : NSObject

@property (nonatomic,strong) NSMutableArray *gushiwens;
@property (nonatomic,strong) NSDictionary *objectMapperDictionary;

@end

@interface PoemInfo : NSObject

@property (nonatomic,strong) NSString *id;
@property (nonatomic,strong) NSString *nameStr;
@property (nonatomic,strong) NSString *author;
@property (nonatomic,strong) NSString *chaodai;
@property (nonatomic,strong) NSString *cont;
@property (nonatomic,strong) NSString *axing;
@property (nonatomic,strong) NSString *bxing;
@property (nonatomic,strong) NSString *cxing;
@property (nonatomic,strong) NSString *dxing;
@property (nonatomic,strong) NSString *exing;
@property (nonatomic,strong) NSString *type;
@property (nonatomic,strong) NSString *tag;
@property (nonatomic,strong) NSString *langsongAuthor;
@property (nonatomic,strong) NSString *langsongAuthorPY;

@end
