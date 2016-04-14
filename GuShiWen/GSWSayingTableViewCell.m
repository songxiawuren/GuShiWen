//
//  GSWSayingTableViewCell.m
//  GuShiWen
//
//  Created by byn on 16/4/14.
//  Copyright © 2016年 byn. All rights reserved.
//

#import "GSWSayingTableViewCell.h"
#import "GSWGlobalObject.h"
#import "UIImageView+AFNetworking.h"

@implementation GSWSayingTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureCell : (GSWSayingInfo *)sayingInfo {
    NSString *authorImg = [[GSWGlobalObject sharedInstance].authorInfo valueForKey:sayingInfo.author];
    [_authorImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.gushiwen.org/authorImg/%@.jpg",authorImg]]];
    
    _sayingName.text = sayingInfo.shiName;
    _authorInfoLabel.text = sayingInfo.author;
    NSString *tempSayingText = [sayingInfo.nameStr stringByReplacingOccurrencesOfString:@"<br />" withString:@""];
    NSString *saying = [tempSayingText stringByReplacingOccurrencesOfString:@"<p>" withString:@""];
    _sayingContentLabel.text = saying;
}

@end
