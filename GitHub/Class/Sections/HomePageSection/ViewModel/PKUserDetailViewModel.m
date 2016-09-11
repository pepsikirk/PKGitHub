//
//  PKUserDetailViewModel.m
//  GitHub
//
//  Created by pepsikirk on 16/9/4.
//  Copyright © 2016年 pepsikirk. All rights reserved.
//

#import "PKUserDetailViewModel.h"
#import "PKNetAPIManager.h"
#import "PKUserModel.h"

@interface PKUserDetailViewModel ()

@property (nonatomic, strong) PKUserModel *user;

@end

@implementation PKUserDetailViewModel

- (instancetype)initWithUser:(PKUserModel *)user {
    self = [super init];
    if (self) {
        _user = user;
    }
    return self;
}

#pragma mark - Public

- (void)requestUserDetailWithCompleteHandler:(PKUserDetailCompletionBlock)completeBlock {
    [[PKNetAPIManager sharedManager] userDetailWithUserName:self.user.login completeHandler:^(PKUserModel *model) {
        completeBlock(model, nil);
    } errorHandel:^(NSError *error) {
        completeBlock(nil, error);
    }];
}

@end
