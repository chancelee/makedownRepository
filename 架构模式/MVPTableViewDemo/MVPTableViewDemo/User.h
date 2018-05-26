//
//  User.h
//  MVPTableViewDemo
//
//  Created by James on 2017/12/1.
//  Copyright © 2017年 TZ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
@property (nonatomic, copy) NSString *fristName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, copy) NSString *email;
@property (nonatomic) NSInteger age;

- (instancetype)initWithFristName:(NSString *)fristName lastName:(NSString *)lastName email:(NSString *)email age:(NSInteger)age;

+ (void)getUsers:(void(^)(NSArray<User*> *users))usersBlock;
@end
