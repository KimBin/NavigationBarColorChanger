//
//  UINavigationBar+AssociatedObjects.m
//  NavigationBarGradient
//
//  Created by 看楼听雨 on 16/3/24.
//  Copyright © 2016年 XJ. All rights reserved.
//

#import "UINavigationBar+AssociatedObjects.h"
#import <objc/runtime.h>

@implementation UINavigationBar (AssociatedObjects)

static char keyTopView;

- (UIView *)topView
{
    return objc_getAssociatedObject(self, &keyTopView);
}

- (void)setTopView:(UIView *)topView
{
    objc_setAssociatedObject(self, &keyTopView, topView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)xj_setBackgroundColor:(UIColor *)backgroundColor
{
    if (!self.topView) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        self.topView = [[UIView alloc] initWithFrame:CGRectMake(0, -20, [[UIScreen mainScreen] bounds].size.width, CGRectGetHeight(self.bounds) + 20)];
        self.topView.userInteractionEnabled = NO;
        self.topView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self insertSubview:self.topView atIndex:0];
    }
    self.topView.backgroundColor = backgroundColor;
}

- (void)xj_removeOneView
{
    [self.topView removeFromSuperview];
    self.topView = nil;

}

@end
