//
//  GSWNetApiManager.h
//  GuShiWen
//
//  Created by byn on 16/4/11.
//  Copyright © 2016年 byn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GSWRequestBuild.h"
#import "GSWHttpSessionManager.h"

@interface GSWNetApiManager : NSObject

+ (GSWNetApiManager *)sharedInstance;
- (void)sendNewUpdatePoemRequest: (GSWRequestBuild *)params withBlock : (requestBlock)block;
- (void)sendGetMainPageInfo : (NSInteger)currentPage withUrlString : (NSString *)url withBlock : (requestBlock)block;
- (void)sendGetAllAuthorWithPictureRequestWithBlock : (requestBlock)block;
@end
