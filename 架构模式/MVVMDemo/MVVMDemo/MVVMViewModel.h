//
//  MVVMViewModel.h
//  MVVMDemo
//
//  Created by James on 2017/12/2.
//  Copyright © 2017年 TZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FBKVOController.h"
#import "NSObject+FBKVOController.h"
#import "MVVMModel.h"

@interface MVVMViewModel : NSObject
@property (nonatomic, copy) NSString *contentStr;

- (void)setWithModel;

- (void)viewModelPrintClick;
@end
