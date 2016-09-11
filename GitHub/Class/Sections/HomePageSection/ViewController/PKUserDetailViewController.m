//
//  PKUserDetailViewController.m
//  GitHub
//
//  Created by pepsikirk on 16/9/4.
//  Copyright © 2016年 pepsikirk. All rights reserved.
//

#import "PKUserDetailViewController.h"
#import "PKUserModel.h"
#import "PKUserDetailViewModel.h"
#import "PKUsersDetailView.h"
#import "Masonry.h"
#import "NSObject+PKCommon.h"
#import "MBProgressHUD.h"

@interface PKUserDetailViewController ()

@property (nonatomic, strong) PKUserDetailViewModel *viewModel;
@property (nonatomic, strong) PKUsersDetailView *mainView;

@end

@implementation PKUserDetailViewController

- (instancetype)initWithUser:(PKUserModel *)user {
    self = [super init];
    if (self) {
        _viewModel = [[PKUserDetailViewModel alloc] initWithUser:user];
        self.title = user.login;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    __weak __typeof__(self) weakSelf = self;
    [self.viewModel requestUserDetailWithCompleteHandler:^(PKUserModel *user, NSError *error) {
        __strong __typeof__(weakSelf) strongSelf = weakSelf;
        if (strongSelf && user) {
            [self.mainView refreshViewWithUser:user];
        }
        [hud hide:YES];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Getter

- (PKUsersDetailView *)mainView {
    if (!_mainView) {
        _mainView = [[[NSBundle mainBundle] loadNibNamed:[PKUsersDetailView className] owner:self options:nil] lastObject];
        [self.view addSubview:_mainView];
        
        __weak __typeof__(self) weakSelf = self;
        [_mainView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(weakSelf.view);
        }];
    }
    return _mainView;
}

@end
