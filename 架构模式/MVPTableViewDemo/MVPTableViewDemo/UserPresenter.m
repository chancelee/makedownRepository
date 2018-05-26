//
//  UserPresenter.m
//  MVPTableViewDemo
//
//  Created by James on 2017/12/1.
//  Copyright © 2017年 TZ. All rights reserved.
//

#import "UserPresenter.h"

@implementation UserViewData

- (instancetype)initWithName:(NSString *)name age:(NSString*)age {
    self = [super init];
    if (self) {
        _name = name;
        _age = age;
    }
    return self;
}

@end

@implementation UserPresenter

- (void)getUsers {
    
    __weak typeof(self) weakSelf = self;
    [User getUsers:^(NSArray<User *> *users) {
        [weakSelf.delegate finishLoading];
        
        BOOL hasUser = users && users.count;
        if (!hasUser) {
            [self.delegate setEmptyUsers];
        } else {
            NSMutableArray<UserViewData *> *userViewDatas = [NSMutableArray arrayWithCapacity:11];
            
            for (User *user in users) {
                NSString *ageStr = [NSString stringWithFormat:@"%zd",user.age];
                UserViewData *userViewData = [[UserViewData alloc] initWithName:user.fristName age:ageStr];
                
                [userViewDatas addObject:userViewData];
            }
                [self.delegate setUsers:userViewDatas];
        }
    }];
}
@end
