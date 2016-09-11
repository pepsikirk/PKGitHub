//
//  PKHomePageViewModel.h
//  GitHub
//
//  Created by pepsikirk on 16/9/4.
//  Copyright © 2016年 pepsikirk. All rights reserved.
//

#import "PKBaseViewModel.h"
@class PKUserModel;

typedef void (^PKSelectUserBlock)(PKUserModel *user);
typedef void (^PKHomePageCompletionBlock)(NSError *error);

@interface PKHomePageViewModel : PKBaseViewModel <UITableViewDelegate, UITableViewDataSource>

#pragma mark - Public

- (void)searchUsersWithIsFirst:(BOOL)isFirst completeHandler:(PKHomePageCompletionBlock)completeBlock;
- (void)setSelectUserBlock:(PKSelectUserBlock)block;

@end
