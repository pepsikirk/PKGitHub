//
//  PKUserModel.m
//  GitHub
//
//  Created by pepsikirk on 16/9/4.
//  Copyright © 2016年 pepsikirk. All rights reserved.
//

#import "PKUserModel.h"
#import "NSObject+PKCommon.h"

@implementation PKUserModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (!dictionary) {
        return nil;
    }
    
    self = [super init];
    if (self) {
        _login = [dictionary objectForKey:@"login"] ;
        _userId = [[dictionary objectForKey:@"id"] intValue] ;
        _avatar_url = [dictionary objectForKey:@"avatar_url"] ;
        _gravatar_id = [dictionary objectForKey:@"gravatar_id"] ;
        _url = [dictionary objectForKey:@"url"] ;
        _html_url = [dictionary objectForKey:@"html_url"] ;
        _followers_url = [dictionary objectForKey:@"followers_url"] ;
        _following_url = [dictionary objectForKey:@"following_url"] ;
        _gists_url = [dictionary objectForKey:@"gists_url"] ;
        _starred_url = [dictionary objectForKey:@"starred_url"] ;
        _subscriptions_url = [dictionary objectForKey:@"subscriptions_url"] ;
        _organizations_url = [dictionary objectForKey:@"organizations_url"] ;
        _repos_url = [dictionary objectForKey:@"repos_url"] ;
        _events_url = [dictionary objectForKey:@"events_url"] ;
        _received_events_url = [dictionary objectForKey:@"received_events_url"] ;
        _type = [dictionary objectForKey:@"type"] ;
        _site_admin = [[dictionary objectForKey:@"site_admin"] boolValue] ;
        _score = [dictionary objectForKey:@"score"] ;
        
        _name = [[dictionary objectForKey:@"name"] isNull]?@"":[dictionary objectForKey:@"name"] ;
        _company = [[dictionary objectForKey:@"company"] isNull]?@"":[dictionary objectForKey:@"company"];
        _blog = [[dictionary objectForKey:@"blog"] isNull]?@"":[dictionary objectForKey:@"blog"];
        _location =  [[dictionary objectForKey:@"location"] isNull]?@"":[dictionary objectForKey:@"location"];
        _email = [[dictionary objectForKey:@"email"] isNull]?@"":[dictionary objectForKey:@"email"];
        _public_repos = [[dictionary objectForKey:@"public_repos"] intValue];
        _followers = [[dictionary objectForKey:@"followers"] intValue];
        _following = [[dictionary objectForKey:@"following"] intValue];
        _created_at = [dictionary objectForKey:@"created_at"] ;
    }
    return self;
}

+ (PKUserModel *)modelWithDict:(NSDictionary *)dict {
    PKUserModel *model = [[PKUserModel alloc] initWithDictionary:dict];
    return model;
}

@end
