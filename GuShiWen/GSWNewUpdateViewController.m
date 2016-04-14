//
//  GSWNewUpdateViewController.m
//  GuShiWen
//
//  Created by byn on 16/4/13.
//  Copyright © 2016年 byn. All rights reserved.
//

#import "GSWNewUpdateViewController.h"
#import "GSWMainPageRequest.h"
#import "GSWNetApiManager.h"
#import "GSWMainPageResponse.h"
#import "NSObject+ObjectDynamicSerilize.h"
#import "GSWHomeTableViewCell.h"

@interface GSWNewUpdateViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic ,strong) GSWMainPageResponse *dataSource;

@end

@implementation GSWNewUpdateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self dataInit];
    [self requestNewPoem];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getAuthorInfo) name:getAuthorInfoSucceed object:nil];
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
    
    GSWMainPageRequest *request = [[GSWMainPageRequest alloc] init];
    request.token = @"gswapi";
    __weak typeof(self) weakSelf = self;
    [[GSWNetApiManager sharedInstance] sendNewUpdatePoemRequest:request withBlock:^(id data, NSError *error) {
        if (!error) {
            GSWMainPageResponse *response = [NSObject initClassFromString:@"GSWMainPageResponse" WithDictionary:data];
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
