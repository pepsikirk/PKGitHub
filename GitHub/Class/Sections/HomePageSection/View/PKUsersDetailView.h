//
//  PKUserDetailView.h
//  GitHub
//
//  Created by pepsikirk on 16/9/4.
//  Copyright © 2016年 pepsikirk. All rights reserved.
//

#import "PKBaseView.h"
@class PKUserModel;

@interface PKUsersDetailView : PKBaseView

- (void)refreshViewWithUser:(PKUserModel *)user;

@end
