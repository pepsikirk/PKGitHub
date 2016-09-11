//
//  PKUserDetailViewModel.h
//  GitHub
//
//  Created by pepsikirk on 16/9/4.
//  Copyright © 2016年 pepsikirk. All rights reserved.
//

#import "PKBaseViewModel.h"
@class PKUserModel;

typedef void (^PKUserDetailCompletionBlock)(PKUserModel *user, NSError *error);

@interface PKUserDetailViewModel : PKBaseViewModel

- (instancetype)initWithUser:(PKUserModel *)user;

- (void)requestUserDetailWithCompleteHandler:(PKUserDetailCompletionBlock)completeBlock;

@end
