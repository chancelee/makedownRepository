//
//  ViewController.m
//  MVVMDemo
//
//  Created by James on 2017/12/2.
//  Copyright © 2017年 TZ. All rights reserved.
//

#import "ViewController.h"
#import "MVVMController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        MVVMController *vc = [[MVVMController alloc] init];
        [self presentViewController:vc animated:YES completion:nil];
    });
}

@end
