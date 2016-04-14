//
//  GSWBookViewController.m
//  GuShiWen
//
//  Created by byn on 16/4/14.
//  Copyright © 2016年 byn. All rights reserved.
//

#import "GSWBookViewController.h"
#import "GSWNetApiManager.h"
#import "GSWBookResponse.h"
#import "GSWBookTableViewCell.h"
#import "NSObject+ObjectDynamicSerilize.h"

@interface GSWBookViewController () <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic ,strong) GSWBookResponse *dataSource;
@property (nonatomic ,assign) NSInteger currentPage;
@end

@implementation GSWBookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self dataInit];
    [self requestBook];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dataInit {
    [self.tableView registerNib:[UINib nibWithNibName:@"GSWBookTableViewCell" bundle:nil] forCellReuseIdentifier:@"GSWBookTableViewCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    _currentPage = 1;
}

- (void)requestBook {
    
    __weak typeof(self) weakSelf = self;
    [[GSWNetApiManager sharedInstance] sendGetMainPageInfo:self.currentPage withUrlString:guwenUrl withBlock:^(id data, NSError *error) {
        if (!error) {
            GSWBookResponse *response = [NSObject initClassFromString:@"GSWBookResponse" WithDictionary:data];
            weakSelf.dataSource = response;
            [weakSelf.tableView reloadData];
        }        
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GSWBookTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GSWBookTableViewCell"];
    [cell configureCell:[_dataSource.books objectAtIndex:indexPath.row]];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource.books count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}


@end
