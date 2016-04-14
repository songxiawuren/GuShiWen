//
//  GSWRequestBuild.h
//  GuShiWen
//
//  Created by byn on 16/4/11.
//  Copyright © 2016年 byn. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ArrayClassName(name) [NSString stringWithFormat:@"arrayElementType.%@",name]

@interface GSWRequestBuild : NSObject
- (NSDictionary *)buildPropertyList;
@end
