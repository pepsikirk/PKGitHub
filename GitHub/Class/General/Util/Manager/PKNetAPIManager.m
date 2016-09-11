//
//  PKNetAPIManager.m
//  GitHub
//
//  Created by pepsikirk on 16/9/4.
//  Copyright © 2016年 pepsikirk. All rights reserved.
//

#import "PKNetAPIManager.h"
#import "AFNetworking.h"
#import "PKUserModel.h"

@interface PKNetAPIManager ()

@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

@implementation PKNetAPIManager

+ (instancetype)sharedManager {
    static PKNetAPIManager *manager = nil;
    static dispatch_once_t once;
    
    dispatch_once(&once, ^{
        manager = [[self alloc] init];
    });
    
    return manager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://api.github.com/"]];
        _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json", @"text/html", nil];
        [_manager.requestSerializer setValue:@"application/vnd.github.v3+json" forHTTPHeaderField:@"Accept"];
    }
    return self;
}

#pragma mark - Public

- (NSURLSessionDataTask *)searchUsersWithPage:(NSInteger)page
                          completeHandler:(PKListResponseBlock)completeBlock
                                errorHandel:(PKErrorBlock)errorBlock {
    NSString *getString = [NSString stringWithFormat:@"/search/users?q=language:Objective-C&page=%li",(long)page];
    
    NSURLSessionDataTask *task = [self.manager GET:getString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSInteger totalCount=[[responseObject objectForKey:@"total_count"] intValue];
        NSArray *items = [responseObject objectForKey:@"items"];
        
        if ([items isKindOfClass:[NSArray class]]) {
            if (items.count > 0) {
                NSMutableArray *modelArray = [NSMutableArray new];
                
                for (NSInteger i = 0; i < items.count; i++) {
                    NSDictionary *dict = [items objectAtIndex:i];
                    PKUserModel *model = [PKUserModel modelWithDict:dict];
                    [modelArray addObject:model];
                }
                
                completeBlock(modelArray, page,totalCount);
            }
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
    
    return task;
}

- (NSURLSessionDataTask *)userDetailWithUserName:(NSString *)userName
                             completeHandler:(PKUserModelResponseBlock)completionBlock
                                   errorHandel:(PKErrorBlock)errorBlock {
    NSString *getString = [NSString stringWithFormat:@"/users/%@",userName];
    
    NSURLSessionDataTask *task = [self.manager GET:getString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            PKUserModel *model = [PKUserModel modelWithDict:responseObject];
            
            completionBlock(model);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        errorBlock(error);
    }];
    
    return task;
}


@end
