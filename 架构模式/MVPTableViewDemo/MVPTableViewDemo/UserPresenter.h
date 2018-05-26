//
//  UserPresenter.h
//  MVPTableViewDemo
//
//  Created by James on 2017/12/1.
//  Copyright © 2017年 TZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface UserViewData : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *age;

- (instancetype)initWithName:(NSString *)name age:(NSString*)age;
@end


@protocol UserViewDelegate <NSObject>

- (void)startloading;
- (void)finishLoading;

// 用户界面的数据
- (void)setUsers:(NSArray<UserViewData *> *)userViewData;
// 数据是空的时候,显示
- (void)setEmptyUsers;

@end

@interface UserPresenter : NSObject
@property (nonatomic, weak) id<UserViewDelegate> delegate;

- (void)getUsers;
@end
