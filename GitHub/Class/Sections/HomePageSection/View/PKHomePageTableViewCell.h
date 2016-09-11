//
//  PKHomePageTableViewCell.h
//  GitHub
//
//  Created by pepsikirk on 16/9/4.
//  Copyright © 2016年 pepsikirk. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PKUserModel;

@interface PKHomePageTableViewCell : UITableViewCell

- (void)refreshCellWithUserModel:(PKUserModel *)model;

@end
