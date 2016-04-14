//
//  GSWRequestBuild.m
//  GuShiWen
//
//  Created by byn on 16/4/11.
//  Copyright © 2016年 byn. All rights reserved.
//

#import "GSWRequestBuild.h"
#import <objc/runtime.h>

@implementation GSWRequestBuild

- (NSDictionary *)getPropertyList {
    
    NSMutableDictionary *mutableDictionay = [[NSMutableDictionary alloc] init];
    unsigned int count = 0;
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    
    for (int i = 0; i < count; i++) {
        objc_property_t property = propertyList[i];
        const char *keyName = property_getName(property);
        char *typeName = property_copyAttributeValue(property, "T");
        
        [mutableDictionay setValue:[NSString stringWithCString:typeName encoding:NSUTF8StringEncoding] forKey:[NSString stringWithCString:keyName encoding:NSUTF8StringEncoding]];
        free(typeName);
    }
    
    free(propertyList);
    
    return mutableDictionay;
}

- (NSDictionary *)buildPropertyList
{
    
    NSMutableDictionary *returnDict = [[NSMutableDictionary alloc] init];
    NSDictionary *keysDict = [self getPropertyList];
    
    for (NSString *key in [keysDict allKeys]) {
        
        NSString *propertyType = [keysDict objectForKey:key];
        
        id value = [self valueForKey:key];
        
        if (!value) {
            continue;
        }
        
        if ([propertyType hasPrefix:@"@"]) {
                //object
            NSString *className = [propertyType substringWithRange:NSMakeRange(2, propertyType.length - 3)];
            
            if ([className isEqualToString:@"NSString"]) {
                
                [returnDict setValue:value forKey:key];
                
            } else if ([className isEqualToString:@"NSNumber"]) {
                
                [returnDict setValue:value forKey:key];
                
            } else if ([className isEqualToString:@"NSMutableArray"] || [className isEqualToString:@"NSArray"]) {
                
                if ([value isKindOfClass:[NSArray class]] || [value isKindOfClass:[NSMutableArray class]]) {
                    
                    NSMutableArray *arr = [[NSMutableArray alloc] init];
                    
                    NSString *elementClassName = [self valueForKeyPath:ArrayClassName(key)];
                    
                    if (elementClassName) {
                        value = (NSArray *)value;
                        for (int i = 0; i < [value count]; i++) {
                            id obj = [value objectAtIndex:i];
                            NSDictionary *objDict = [obj getPropertyList];
                            if (objDict) {
                                [arr addObject:objDict];
                            }
                        }
                    }
                    
                    [returnDict setValue:arr forKey:key];
                }
            } else {
                    //custom obj
                NSDictionary *dict = [value getPropertyList];
                
                if (dict) {
                    [returnDict setValue:dict forKey:key];
                }
            }
        }
        else {
                //统一格式化成 NSNumber类型
            [returnDict setValue:value forKey:key];
            
        }
    }
    return returnDict;
}
@end
