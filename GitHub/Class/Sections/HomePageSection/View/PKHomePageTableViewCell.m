//
//  PKHomePageTableViewCell.m
//  GitHub
//
//  Created by pepsikirk on 16/9/4.
//  Copyright © 2016年 pepsikirk. All rights reserved.
//

#import "PKHomePageTableViewCell.h"
#import "PKUserModel.h"
#import "UIImageView+WebCache.h"

@interface PKHomePageTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation PKHomePageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Public

- (void)refreshCellWithUserModel:(PKUserModel *)model {
    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:model.avatar_url]];
    self.nameLabel.text = model.login;
}

@end
