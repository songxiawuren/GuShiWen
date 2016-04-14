//
//  Constants.h
//  GuShiWen
//
//  Created by byn on 16/4/11.
//  Copyright © 2016年 byn. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

#define baseHost @"http://app.gushiwen.org"
#define imageHost @"img.gushiwen.org"
#define mainPage @"/api/upTimeTop11.aspx"
#define shiwen @"/api/shiwen/type.aspx"

#define allAuthorOwnImage @"/api/author/authorPicAll.aspx"
#define screenWidth ([UIScreen mainScreen].bounds.size.width)
#define screenHeight ([UIScreen mainScreen].bounds.size.height)

#define getAuthorInfoSucceed @"GSWGetAuthorInfoSucceed"

typedef void(^requestBlock)(id data,NSError *error);

typedef NS_ENUM(NSInteger,NetMethod) {
    NetMethodGet = 0,
    NetMethodPost
};

#endif /* Constants_h */
