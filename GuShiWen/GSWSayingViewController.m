//
//  GSWSayingViewController.m
//  GuShiWen
//
//  Created by byn on 16/4/14.
//  Copyright © 2016年 byn. All rights reserved.
//

#import "GSWSayingViewController.h"
#import "GSWSayingTableViewCell.h"
#import "GSWSayingResponse.h"
#import "GSWNetApiManager.h"
#import "NSObject+ObjectDynamicSerilize.h"

@interface GSWSayingViewController () <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic ,strong) GSWSayingResponse *dataSource;
@property (nonatomic ,assign) NSInteger currentPage;

@end

@implementation GSWSayingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self dataInit];
    [self requestSaying];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dataInit {
    [self.tableView registerNib:[UINib nibWithNibName:@"GSWSayingTableViewCell" bundle:nil] forCellReuseIdentifier:@"GSWSayingTableViewCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)requestSaying {
    
    __weak typeof(self) weakSelf = self;
    [[GSWNetApiManager sharedInstance] sendGetMainPageInfo:self.currentPage withUrlString:sayingUrl withBlock:^(id data, NSError *error) {
        if (!error) {
            GSWSayingResponse *response = [NSObject initClassFromString:@"GSWSayingResponse" WithDictionary:data];
            weakSelf.dataSource = response;
            [weakSelf.tableView reloadData];
        }
        
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GSWSayingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GSWSayingTableViewCell"];
    [cell configureCell:[_dataSource.mingjus objectAtIndex:indexPath.row]];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource.mingjus count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

@end
