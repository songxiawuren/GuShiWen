//
//  GSWBookTableViewCell.m
//  GuShiWen
//
//  Created by byn on 16/4/14.
//  Copyright © 2016年 byn. All rights reserved.
//

#import "GSWBookTableViewCell.h"
#import "GSWGlobalObject.h"
#import "UIImageView+AFNetworking.h"

@implementation GSWBookTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureCell : (GSWBookInfo *)bookInfo {
    
        //NSString *authorImg = [[GSWGlobalObject sharedInstance].authorInfo valueForKey:bookInfo.author];
    [_authorImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.gushiwen.org/bookPic/%@.jpg",bookInfo.pic]]];
    
    self.bookNameLabel.text = bookInfo.nameStr;
    self.authorInfoLabel.text = bookInfo.author;
    NSString *tempbookContentText = [bookInfo.cont stringByReplacingOccurrencesOfString:@"<br />" withString:@""];
    NSString *bookContent = [tempbookContentText stringByReplacingOccurrencesOfString:@"<p>" withString:@""];
    self.bookContentLabel.text = bookContent;
}

@end
























