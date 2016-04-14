//
//  GSWSayingTableViewCell.h
//  GuShiWen
//
//  Created by byn on 16/4/14.
//  Copyright © 2016年 byn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GSWSayingResponse.h"

@interface GSWSayingTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *authorImageView;
@property (weak, nonatomic) IBOutlet UILabel *sayingName;
@property (weak, nonatomic) IBOutlet UILabel *authorInfoLabel;
@property (weak, nonatomic) IBOutlet UILabel *sayingContentLabel;

- (void)configureCell : (GSWSayingInfo *)sayingInfo;

@end
