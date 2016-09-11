//
//  NSObject+PKCommon.m
//  GitHub
//
//  Created by pepsikirk on 16/9/4.
//  Copyright © 2016年 pepsikirk. All rights reserved.
//

#import "NSObject+PKCommon.h"

@implementation NSObject (PKCommon)

- (NSString*)className{
    return NSStringFromClass([self class]);
}

+ (NSString*)className{
    return NSStringFromClass([self class]);
}

- (BOOL)isNull {
    if (!self) {
        return YES;
    }
    if ([self isEqual:[NSNull null]]) {
        return YES;
    } else if ([self isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([self isKindOfClass:[NSString class]]) {
        if ([((NSString *)self) isEqualToString:@"(null)"]) {
            return YES;
        }
    }
    return NO;
}


@end
