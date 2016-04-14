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
#define shiwenUrl @"/api/shiwen/type.aspx?token=gswapi&page=%ld"
#define sayingUrl @"/api/mingju/Default.aspx?token=gswapi&page=%ld"
#define guwenUrl @"/api/guwen/Default.aspx?token=gswapi&page=%ld"
#define shiwenView @"/api/shiwen/view.aspx?token=gswapi&id=%ld"
#define mingjuView @"/api/mingju/ju.aspx?token=gswapi&id=%ld"
#define guwenView @"/api/guwen/book/aspx?token=gswapi&id=%ld"
#define guwenSubView @"/api/guwen/bookv.aspx?token=gswapi&id=%ld"
#define guwenViewFanYi @"/api/guwen/bfanyi.aspx?token=gswapi&id=%ld"
#define guwenViewShangXi @"/api/guwen/bshangxi.aspx?token=gswapi&id=%ld"
#define shiwenFanYi @"/api/shiwen/fanyi.aspx?token=gswapi&id=%ld"
#define shiwenShangXi @"/api/shiwen/shangxi.aspx?token=gswapi&id=%ld"
#define author @"/api/author/author.aspx?tken=gswapi&id=%ld"
#define authorZiLiao @"/api/author/ziliao.aspx?token=gswapi&id=%ld"






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
