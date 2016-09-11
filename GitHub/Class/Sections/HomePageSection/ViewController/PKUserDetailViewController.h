//
//  PKUserDetailViewController.h
//  GitHub
//
//  Created by pepsikirk on 16/9/4.
//  Copyright © 2016年 pepsikirk. All rights reserved.
//

#import "PKBaseViewController.h"
@class PKUserModel;

@interface PKUserDetailViewController : PKBaseViewController

- (instancetype)initWithUser:(PKUserModel *)user;

@end
