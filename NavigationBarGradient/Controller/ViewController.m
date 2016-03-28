//
//  ViewController.m
//  NavigationBarGradient
//
//  Created by 看楼听雨 on 16/3/24.
//  Copyright © 2016年 XJ. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Hello";    
}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    FirstViewController *firstVC = [[FirstViewController alloc] init];
    firstVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:firstVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
