//
//  NSObject+ObjectDynamicSerilize.m
//  GuShiWen
//
//  Created by byn on 16/4/12.
//  Copyright © 2016年 byn. All rights reserved.
//

#import "NSObject+ObjectDynamicSerilize.h"
#import <objc/runtime.h>

@implementation NSObject (ObjectDynamicSerilize)
+ (id)initClassFromString : (NSString *)className WithDictionary : (NSString *)jsonDictionary {
    
    id destObject = [[NSClassFromString(className) alloc] init];
    NSDictionary *propertyDictionary = [destObject getClassPropertyList];
    
    for (id propertyKey in [propertyDictionary allKeys]) {
        
        id value = [jsonDictionary valueForKey:propertyKey];
        if (nil == value) {
            continue;
        }
        
        if ([value isKindOfClass: [NSString class]] || [value isKindOfClass:[NSNumber class]]) {
            if ([value isKindOfClass:[NSNumber class]]) {
                value = [value stringValue];
            }
            [destObject setValue:value forKey:propertyKey];
        } else if ([value isKindOfClass:[NSNull class]]) {
            [destObject setValue:nil forKey:propertyKey];
        } else if ([value isKindOfClass:[NSDictionary class]]) {
            id subProperty = [NSObject initClassFromString:propertyKey WithDictionary:value];
            [destObject setValue:subProperty forKey:propertyKey];
        } else if ([value isKindOfClass:[NSArray class]] || [value isKindOfClass:[NSMutableArray class]]) {
            NSArray *subArray = value;
            NSString *propertyName = [destObject valueForKeyPath:[NSString stringWithFormat:@"objectMapperDictionary.%@",propertyKey]];
            NSMutableArray *subDestArray = [[NSMutableArray alloc] init];
            for (int subIndex = 0; subIndex < [subArray count]; subIndex++) {
                id subDestObject = [NSObject initClassFromString:propertyName WithDictionary:[subArray objectAtIndex:subIndex]];
                if (subDestObject) {
                    [subDestArray addObject:subDestObject];
                }
            }
            [destObject setValue:subDestArray forKey:propertyKey];
            
        }
    }
    
    return destObject;
}

- (NSDictionary *)getClassPropertyList {
    
    NSMutableDictionary *propertyDictionary = [[NSMutableDictionary alloc] init];
    unsigned int count = 0;
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    for (int i = 0; i < count; i++) {
        objc_property_t property = propertyList[i];
        NSString *propertyType = [NSString stringWithUTF8String:property_getName(property)];
        [propertyDictionary setObject:propertyType forKey:propertyType];
    }
    free(propertyList);
    
    return propertyDictionary;
}
@end
