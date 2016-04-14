//
//  GSWBookTableViewCell.h
//  GuShiWen
//
//  Created by byn on 16/4/14.
//  Copyright © 2016年 byn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GSWBookResponse.h"

@interface GSWBookTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *authorImageView;
@property (weak, nonatomic) IBOutlet UILabel *bookNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorInfoLabel;
@property (weak, nonatomic) IBOutlet UILabel *bookContentLabel;

- (void)configureCell : (GSWBookInfo *)bookInfo;

@end
