//
//  GSWPoemViewController.m
//  GuShiWen
//
//  Created by byn on 16/4/13.
//  Copyright © 2016年 byn. All rights reserved.
//

#import "GSWPoemViewController.h"
#import "NSObject+ObjectDynamicSerilize.h"
#import "GSWHomeTableViewCell.h"
#import "GSWPoemResponse.h"
#import "GSWNetApiManager.h"

@interface GSWPoemViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic ,strong) GSWPoemResponse *dataSource;
@property (nonatomic ,assign) NSInteger currentPage;

@end

@implementation GSWPoemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self dataInit];
    [self requestNewPoem];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dataInit {
    
    [self.tableView registerNib:[UINib nibWithNibName:@"GSWHomeTableViewCell" bundle:nil] forCellReuseIdentifier:@"GSWHomeTableViewCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)requestNewPoem {
    
    __weak typeof(self) weakSelf = self;
    [[GSWNetApiManager sharedInstance] sendGetPoemPage:weakSelf.currentPage withBlock:^(id data, NSError *error) {
        if (!error) {
            GSWPoemResponse *response = [NSObject initClassFromString:@"GSWPoemResponse" WithDictionary:data];
            weakSelf.dataSource = response;
            [weakSelf.tableView reloadData];
        }
        
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GSWHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GSWHomeTableViewCell"];
    [cell configureCell:[_dataSource.gushiwens objectAtIndex:indexPath.row]];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource.gushiwens count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

- (void)getAuthorInfo {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:getAuthorInfoSucceed object:nil
     ];
}

@end
