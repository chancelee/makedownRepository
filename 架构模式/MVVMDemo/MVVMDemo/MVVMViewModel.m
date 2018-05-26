//
//  MVVMViewModel.m
//  MVVMDemo
//
//  Created by James on 2017/12/2.
//  Copyright © 2017年 TZ. All rights reserved.
//

#import "MVVMViewModel.h"

@interface MVVMViewModel ()
@property (nonatomic, strong) MVVMModel *model;
@end

@implementation MVVMViewModel
- (void)setWithModel {
    self.model = [MVVMModel new];
    self.model.content = @"MVVM架构模式";
    self.contentStr = self.model.content;
}

- (void)viewModelPrintClick {
    int num = arc4random_uniform(20);
    
    self.model.content = [NSString stringWithFormat:@"%d",num];
    self.contentStr = self.model.content;
}
@end
