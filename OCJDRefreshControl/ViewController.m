//
//  ViewController.m
//  OCJDRefreshControl
//
//  Created by tztddong on 2016/12/26.
//  Copyright © 2016年 dongjiangpeng. All rights reserved.
//

#import "ViewController.h"
#import "JPRefreshControl.h"

@interface ViewController ()<UITableViewDataSource>

@property(nonatomic,strong)JPRefreshControl *refreshControl;
@property(nonatomic,strong)UITableView *refreshTableView;
@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.refreshTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.refreshTableView.dataSource = self;
    [self.refreshTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.refreshTableView];
    
    self.refreshControl = [[JPRefreshControl alloc] initWithFrame:CGRectZero];
    
    [self.refreshControl addTarget:self action:@selector(loadData) forControlEvents:UIControlEventValueChanged];
    
    [self.refreshTableView addSubview:self.refreshControl];
}

#pragma mark - loadData
- (void)loadData {
    
    NSLog(@"开始刷新");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"结束刷新");
        [self.refreshControl endRefreshing];
    });
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"%zd",indexPath.row];
    return cell;
}


@end
