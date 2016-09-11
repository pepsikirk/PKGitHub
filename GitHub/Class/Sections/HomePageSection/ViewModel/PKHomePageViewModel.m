//
//  PKHomePageViewModel.m
//  GitHub
//
//  Created by pepsikirk on 16/9/4.
//  Copyright © 2016年 pepsikirk. All rights reserved.
//

#import "PKHomePageViewModel.h"
#import "PKNetAPIManager.h"
#import "NSObject+PKCommon.h"
#import "PKHomePageTableViewCell.h"
#import "PKUserModel.h"

@interface PKHomePageViewModel ()

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, assign) NSUInteger page;
@property (nonatomic, assign) NSUInteger totalCount;

@property (nonatomic, copy) PKSelectUserBlock selectBlock;

@end

@implementation PKHomePageViewModel

#pragma mark - LifeCycle

- (instancetype)init {
    self = [super init];
    if (self) {
        _page = 0;
        _dataArray = [NSMutableArray new];
    }
    return self;
}

#pragma mark - Public

- (void)searchUsersWithIsFirst:(BOOL)isFirst completeHandler:(PKHomePageCompletionBlock)completeBlock {
    self.page++;
    
    [[PKNetAPIManager sharedManager] searchUsersWithPage:self.page completeHandler:^(NSArray *modelArray, NSInteger page, NSInteger totalCount) {
        self.page = page;
        self.totalCount = totalCount;
        [self.dataArray addObjectsFromArray:modelArray];
        completeBlock(nil);
    } errorHandel:^(NSError *error) {
        completeBlock(error);
    }];
}

- (void)setSelectUserBlock:(PKSelectUserBlock)block {
    self.selectBlock = block;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PKHomePageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[PKHomePageTableViewCell className] forIndexPath:indexPath];
    
    PKUserModel *user = self.dataArray[indexPath.row];
    [cell refreshCellWithUserModel:user];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    PKUserModel *user = self.dataArray[indexPath.row];
    self.selectBlock(user);
}


@end
