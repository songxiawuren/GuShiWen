//
//  NSObject+ObjectDynamicSerilize.h
//  GuShiWen
//
//  Created by byn on 16/4/12.
//  Copyright © 2016年 byn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ObjectDynamicSerilize)
+ (id)initClassFromString : (NSString *)className WithDictionary : (NSString *)jsonDictionaryf;
@end
