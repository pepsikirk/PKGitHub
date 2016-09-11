//
//  PKNetAPIManager.h
//  GitHub
//
//  Created by pepsikirk on 16/9/4.
//  Copyright © 2016年 pepsikirk. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PKUserModel;

typedef void (^PKErrorBlock)(NSError* error);
typedef void (^PKListResponseBlock)(NSArray* modelArray,NSInteger page,NSInteger totalCount);
typedef void (^PKUserModelResponseBlock)(PKUserModel* model);


@interface PKNetAPIManager : NSObject

+ (instancetype)sharedManager;

#pragma mark - Public

//https://developer.github.com/v3/search/#search-users
//Search users
- (NSURLSessionDataTask *)searchUsersWithPage:(NSInteger)page
                            completeHandler:(PKListResponseBlock)completionBlock
                                  errorHandel:(PKErrorBlock)errorBlock;


//https://developer.github.com/v3/users/#get-a-single-user
//Get a single user ,GET /users/:username
- (NSURLSessionDataTask *)userDetailWithUserName:(NSString *)userName
                               completeHandler:(PKUserModelResponseBlock)completionBlock
                                     errorHandel:(PKErrorBlock)errorBlock;



@end
