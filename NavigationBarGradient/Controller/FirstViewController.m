//
//  FirstViewController.m
//  NavigationBarGradient
//
//  Created by 看楼听雨 on 16/3/24.
//  Copyright © 2016年 XJ. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "TopView.h"
#import "UINavigationBar+AssociatedObjects.h"
#define ScreenWidth [[UIScreen mainScreen]bounds].size.width
#define ScreenHeight [[UIScreen mainScreen]bounds].size.height
@interface FirstViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>
/**
 *  主视图
 */
@property (nonatomic, strong) UITableView *mainTableView;
/**
 *  leftButton
 */
@property (nonatomic, strong) UIButton *leftBtn;
/**
 *  rigthButton
 */
@property (nonatomic, strong) UIButton *rightBtn;
/**
 *  标题
 */
@property (nonatomic, strong) UILabel *naviTitleLabel;
/**
 *  头部视图
 */
@property (nonatomic, strong) TopView *topView;
/**
 *  假设的navigationBar
 */
@property (nonatomic, strong) UIView *naviBar;
@end

static CGFloat const headTop   = 200;
static CGFloat const naviH     = 64;
static NSString * const cellID = @"cellID";
#define NAVBAR_CHANGE_POINT 50

@implementation FirstViewController
{
    CGFloat _contenOffsetY; // 记录之前偏移量
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.mainTableView.delegate = self;
    [self scrollViewDidScroll:self.mainTableView];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.mainTableView.delegate = nil;
    [self.navigationController.navigationBar xj_removeOneView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.navigationController.navigationBar xj_setBackgroundColor:[UIColor clearColor]];
    [self createMainTableView];
}

- (void)createMainTableView
{
    self.mainTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:(UITableViewStyleGrouped)];
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    self.mainTableView.backgroundColor = [UIColor whiteColor];
    self.mainTableView.contentInset = UIEdgeInsetsMake(headTop, 0, 0, 0);
    self.mainTableView.tableFooterView = [[UIView alloc] init];
    self.mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.mainTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    [self.view addSubview:_mainTableView];
    
    self.topView = [[TopView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, headTop)];
    [self.view addSubview:_topView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"测试--------%ld",indexPath.row + 1];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    secondVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:secondVC animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    UIColor * color = [UIColor whiteColor];
    CGFloat offsetY = scrollView.contentOffset.y;
    offsetY = headTop + offsetY;
    if (offsetY > 0) {
        CGFloat alpha = MIN(1, 1 - ((headTop - naviH - offsetY) / headTop));
        [self.navigationController.navigationBar xj_setBackgroundColor:[color colorWithAlphaComponent:alpha]];
    } else {
        [self.navigationController.navigationBar xj_setBackgroundColor:[color colorWithAlphaComponent:0]];
    }
    
    CGFloat delta = offsetY + headTop;
    CGFloat tempWidth = delta;
    if (tempWidth > 0) {
        tempWidth = 0;
    }
    CGFloat height;
    CGFloat y;
    if (offsetY > 0) {
        height = headTop;
    }else{
        height = headTop - offsetY;
    }
    
    if (offsetY > 0) {
        y = offsetY;
    }else{
        y = 0;
    }
    self.topView.frame = CGRectMake(tempWidth, -y, ScreenWidth - tempWidth, height);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
