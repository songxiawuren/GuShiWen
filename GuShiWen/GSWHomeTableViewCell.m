//
//  GSWHomeTableViewCell.m
//  GuShiWen
//
//  Created by byn on 16/4/12.
//  Copyright © 2016年 byn. All rights reserved.
//

#import "GSWHomeTableViewCell.h"
#import "UIImageView+AFNetworking.h"
#import "GSWDatabaseOperation.h"
#import "GSWGlobalObject.h"


@interface GSWHomeTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *authorImageView;
@property (weak, nonatomic) IBOutlet UILabel *poemNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *poemAuhorInfo;
@property (weak, nonatomic) IBOutlet UILabel *poemContent;

@end

@implementation GSWHomeTableViewCell

- (void)configureCell : (PoemInfo *)poemInfo {
    
    NSString *authorImg = [[GSWGlobalObject sharedInstance].authorInfo valueForKey:poemInfo.author];
    [_authorImageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.gushiwen.org/authorImg/%@.jpg",authorImg]]];
    
    _poemNameLabel.text = poemInfo.nameStr;
    _poemAuhorInfo.text = poemInfo.author;
    
    NSString *tempPoemText = [poemInfo.cont stringByReplacingOccurrencesOfString:@"<br />" withString:@""];
    NSString *poem = [tempPoemText stringByReplacingOccurrencesOfString:@"<p>" withString:@""];
    _poemContent.text = poem;
}


@end




















