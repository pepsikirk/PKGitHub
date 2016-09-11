//
//  NSObject+PKCommon.h
//  GitHub
//
//  Created by pepsikirk on 16/9/4.
//  Copyright © 2016年 pepsikirk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (PKCommon)

- (NSString*)className;
+ (NSString*)className;

- (BOOL)isNull;

@end
