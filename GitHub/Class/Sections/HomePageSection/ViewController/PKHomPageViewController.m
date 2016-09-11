//
//  PKHomPageViewController.m
//  GitHub
//
//  Created by pepsikirk on 16/9/4.
//  Copyright © 2016年 pepsikirk. All rights reserved.
//

#import "PKHomPageViewController.h"
#import "PKHomePageView.h"
#import "PKHomePageViewModel.h"
#import "Masonry.h"
#import "MJRefresh.h"
#import "PKUserDetailViewController.h"
#import "MBProgressHUD.h"

@interface PKHomPageViewController ()

@property (nonatomic, strong) PKHomePageView *mainView;

@property (nonatomic, strong) PKHomePageViewModel *viewModel;

@end

@implementation PKHomPageViewController

#pragma mark - LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"GitHub";
    
    [self.mainView bindTableViewDelegate:self.viewModel dataSoure:self.viewModel];
    [self.view addSubview:self.mainView];
    self.mainView.hidden = YES;

    [self loadMoreData];
    [self setSelectCellBlock];
    self.mainView.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
}

- (void)updateViewConstraints {
    __weak __typeof__(self) weakSelf = self;
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view);
    }];
    
    [super updateViewConstraints];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private

- (void)setSelectCellBlock {
    __weak __typeof__(self) weakSelf = self;
    [self.viewModel setSelectUserBlock:^(PKUserModel *user) {
        __strong __typeof__(weakSelf) strongSelf = weakSelf;
        if (strongSelf) {
            PKUserDetailViewController *vc = [[PKUserDetailViewController alloc] initWithUser:user];
            [strongSelf.navigationController pushViewController:vc animated:YES];
        }
    }];
}

- (void)loadMoreData {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];

    __weak __typeof__(self) weakSelf = self;
    [self.viewModel searchUsersWithIsFirst:YES completeHandler:^(NSError *error) {
        __strong __typeof__(weakSelf) strongSelf = weakSelf;
        if (strongSelf && !error) {
            [weakSelf.mainView.tableView.mj_footer endRefreshing];
            [strongSelf.mainView reloadData];
            if (strongSelf.mainView.hidden) {
                strongSelf.mainView.hidden = NO;
            }
        }
        
        [hud hide:YES];
    }];
}

#pragma mark - Getter 

- (PKHomePageView *)mainView {
    if (!_mainView) {
        _mainView = [PKHomePageView new];
    }
    return _mainView;
}

- (PKHomePageViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [PKHomePageViewModel new];
    }
    return _viewModel;
}

@end
