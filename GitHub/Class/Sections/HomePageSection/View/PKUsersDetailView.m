//
//  PKUserDetailView.m
//  GitHub
//
//  Created by pepsikirk on 16/9/4.
//  Copyright © 2016年 pepsikirk. All rights reserved.
//

#import "PKUsersDetailView.h"
#import "PKUserModel.h"
#import "UIImageView+WebCache.h"

@interface PKUsersDetailView ()

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *companyLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *followersCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *repositoriesCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *followingCountLabel;

@end

@implementation PKUsersDetailView

#pragma mark - Public

- (void)refreshViewWithUser:(PKUserModel *)user {
    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:user.avatar_url]];
    [self.nameLabel setText:user.name];
    [self.nickNameLabel setText:user.login];
    [self.companyLabel setText:user.company];
    [self.locationLabel setText:user.location];
    [self.followersCountLabel setText:@(user.followers).stringValue];
    [self.repositoriesCountLabel setText:@(user.public_repos).stringValue];
    [self.followingCountLabel setText:@(user.following).stringValue];
}

@end
