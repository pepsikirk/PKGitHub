//
//  PKHomePageView.h
//  GitHub
//
//  Created by pepsikirk on 16/9/4.
//  Copyright © 2016年 pepsikirk. All rights reserved.
//

#import "PKBaseView.h"

@interface PKHomePageView : PKBaseView

@property (nonatomic, strong, readonly) UITableView *tableView;

- (void)bindTableViewDelegate:(id <UITableViewDelegate>)delegate dataSoure:(id <UITableViewDataSource>)dataSoure;
- (void)reloadData;

@end
