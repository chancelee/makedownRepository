//
//  ViewController.m
//  MVPTableViewDemo
//
//  Created by James on 2017/12/1.
//  Copyright © 2017年 TZ. All rights reserved.
//

#import "ViewController.h"
#import "UserPresenter.h"

@interface ViewController () <UITableViewDataSource, UserViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *emptyView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;

@property (nonatomic, strong) NSArray<UserViewData *> *userViewDatas;
@property (nonatomic, strong) UserPresenter *userPresenter;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.userPresenter = [[UserPresenter alloc] init];
    self.tableView.dataSource = self;
    self.userPresenter.delegate = self;
    
    // 调userPresenter里面的方法
    [self.userPresenter getUsers];
}

#pragma mark - UserViewDelegate
- (void)startloading {
    self.indicator.hidden = NO;
    [self.indicator startAnimating];
}
- (void)finishLoading {
    [self.indicator stopAnimating];
    self.indicator.hidden = YES;

}

// 用户界面的数据
- (void)setUsers:(NSArray<UserViewData *> *)userViewData {
    self.userViewDatas = userViewData;
    self.tableView.hidden = NO;
    self.emptyView.hidden = YES;
    [self.tableView reloadData];
}

// 数据是空的时候,显示
- (void)setEmptyUsers {
    self.emptyView.hidden = NO;
    self.tableView.hidden = YES;
    self.indicator.hidden = YES;
}


#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.userViewDatas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *kCellIDStr = @"kCellIDStr";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIDStr];
    
    // 设置 Cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:kCellIDStr];
    }
    UserViewData *userViewData = self.userViewDatas[indexPath.row];
    
    cell.textLabel.text = userViewData.name;
    cell.detailTextLabel.text = userViewData.age;
    
    return cell;
}

@end
