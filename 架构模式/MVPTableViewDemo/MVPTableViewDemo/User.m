//
//  User.m
//  MVPTableViewDemo
//
//  Created by James on 2017/12/1.
//  Copyright © 2017年 TZ. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)initWithFristName:(NSString *)fristName lastName:(NSString *)lastName email:(NSString *)email age:(NSInteger)age
{
    self = [super init];
    if (self) {
        _fristName = fristName;
        _lastName = lastName;
        _email = email;
        _age = age;
    }
    return self;
}

+ (void)getUsers:(void(^)(NSArray<User*> *users))usersBlock {
    // 11行
    NSInteger count = 11;
    
    NSMutableArray<User *> *users = [NSMutableArray arrayWithCapacity:count];
    
    for (NSInteger i = 0; i < count; ++i) {
        NSString *idxStr = [NSString stringWithFormat:@"%ld", (long)i];
        
        User *user =
        [[User alloc] initWithFristName:idxStr lastName:idxStr email:idxStr age:i];
        // 添加数组
        [users addObject:user];
    }
    //GCD设置延迟 2
    double delay = 2;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (usersBlock) {
            usersBlock(users);
        }
    });
}


@end
