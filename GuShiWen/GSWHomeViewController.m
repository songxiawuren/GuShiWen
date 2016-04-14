//
//  GSWHomeViewController.m
//  GuShiWen
//
//  Created by byn on 16/4/11.
//  Copyright © 2016年 byn. All rights reserved.
//

#import "GSWHomeViewController.h"
#import "GSWPoemViewController.h"
#import "GSWSayingViewController.h"
#import "GSWBookViewController.h"
#import "Constants.h"
#import "GSWNewUpdateViewController.h"

@interface GSWHomeViewController () <UIScrollViewDelegate>

@property (nonatomic ,strong) NSArray *itemArray;
@property (nonatomic ,strong) UIViewController *currentViewController;
@property (nonatomic ,strong) GSWPoemViewController *poemViewController;
@property (nonatomic ,strong) GSWSayingViewController *sayingViewController;
@property (nonatomic ,strong) GSWBookViewController *bookViewController;
@property (nonatomic ,strong) GSWNewUpdateViewController *theNewUpdateViewController;
@property (nonatomic ,assign) NSInteger currentSelectChildPage;
@property (nonatomic ,strong) UIScrollView *scrollView;
@property (nonatomic ,strong) NSMutableDictionary *childViewControllerMapper;
@property (nonatomic ,strong) NSMutableArray *buttonArray;

@end

@implementation GSWHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self dataInit];
    [self uiInit];
    self.view.autoresizesSubviews = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dataInit {
    self.itemArray = [NSArray arrayWithObjects:@"最新",@"诗文",@"名句",@"书籍", nil];
    
}

- (void)uiInit {
    
    self.poemViewController = [[GSWPoemViewController alloc] init];
    self.poemViewController.view.frame = CGRectMake(screenWidth, 0, screenWidth, screenHeight-64);
    self.sayingViewController = [[GSWSayingViewController alloc] init];
    self.sayingViewController.view.frame = CGRectMake(screenWidth * 2, 0, screenWidth, screenHeight-64);
    self.bookViewController = [[GSWBookViewController alloc] init];
    self.bookViewController.view.frame = CGRectMake(screenWidth * 3, 0, screenWidth, screenHeight-64);
    self.theNewUpdateViewController = [[GSWNewUpdateViewController alloc] init];
    self.theNewUpdateViewController.view.frame = CGRectMake(0, 0, screenWidth, screenHeight-64);
    
    self.buttonArray = [[NSMutableArray alloc] init];
    CGFloat viewWidth = screenWidth -100;
    UIView *barView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, viewWidth, 30)];
    for (int i = 0; i < self.itemArray.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.tag = i + 100;
        [button setTitle:[self.itemArray objectAtIndex:i] forState:UIControlStateNormal];
        button.frame = CGRectMake(i * viewWidth/4, 0, viewWidth/4, 30);
        [button addTarget:self action:@selector(onButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [barView addSubview:button];
        [self.buttonArray addObject:button];
    }
    
    self.navigationItem.titleView = barView;
    self.currentSelectChildPage = 0;
    self.currentViewController = self.theNewUpdateViewController;
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, screenWidth,screenHeight)];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.theNewUpdateViewController.view];
    [self.scrollView addSubview:self.poemViewController.view];
    [self.scrollView addSubview:self.sayingViewController.view];
    [self.scrollView addSubview:self.bookViewController.view];
    [self.scrollView setContentSize:CGSizeMake(screenWidth * 4, 0)];
}

- (void)onButtonClicked : (id)sender {
    UIButton *button = sender;
    if (self.currentSelectChildPage == button.tag - 100) {
        return;
    }
    self.currentSelectChildPage = button.tag - 100;
    [UIView animateWithDuration:0.5 animations:^{
        [self.scrollView setContentOffset:CGPointMake(screenWidth * (self.currentSelectChildPage % 4), -64)];
    } completion:^(BOOL finished) {
        [self setScrollViewEndedState];
    }];
    
}

- (void)setScrollViewEndedState {
    if (self.currentSelectChildPage < 4) {
        for (int i = 0 ;i < self.buttonArray.count ;i ++) {
            
            UIButton *button = [self.buttonArray objectAtIndex:i];
            button.enabled = (self.currentSelectChildPage != i);
        }
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    float x = self.scrollView.contentOffset.x;
    self.currentSelectChildPage = x / screenWidth;
    [self setScrollViewEndedState];
}


@end


























