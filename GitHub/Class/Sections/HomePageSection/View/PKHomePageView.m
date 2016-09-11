//
//  PKHomePageView.m
//  GitHub
//
//  Created by pepsikirk on 16/9/4.
//  Copyright © 2016年 pepsikirk. All rights reserved.
//

#import "PKHomePageView.h"
#import "Masonry.h"
#import "PKHomePageTableViewCell.h"
#import "NSObject+PKCommon.h"

@interface PKHomePageView ()

@property (nonatomic, strong, readwrite) UITableView *tableView;

@end

@implementation PKHomePageView

#pragma mark - LifeCycle

- (instancetype)init {
    self = [super init];
    if (self) {
        [self addSubview:self.tableView];
        [self setNeedsUpdateConstraints];
        [self updateConstraintsIfNeeded];
    }
    return self;
}

- (void)updateConstraints {
    
    __weak __typeof__(self) weakSelf = self;

    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf);
    }];
    [super updateConstraints];
}

#pragma mark - Public 

- (void)bindTableViewDelegate:(id <UITableViewDelegate>)delegate dataSoure:(id <UITableViewDataSource>)dataSoure {
    self.tableView.delegate = delegate;
    self.tableView.dataSource = dataSoure;
}

- (void)reloadData {
    [self.tableView reloadData];
}

#pragma mark - Getter

- (UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView registerNib:[UINib nibWithNibName:[PKHomePageTableViewCell className] bundle:nil] forCellReuseIdentifier:[PKHomePageTableViewCell className]];
    }
    
    return _tableView;
}


@end
