//
//  SecondViewController.h
//  NavigationBarGradient
//
//  Created by 看楼听雨 on 16/3/24.
//  Copyright © 2016年 XJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController
/**
 *  点击按钮后添加本地通知
 */
- (void)addLocalNote;
/**
 *  移除通知(不常用)
 */
- (void)removeLocalNote;
@end
