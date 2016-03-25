//
//  TopView.m
//  NavigationBarGradient
//
//  Created by 看楼听雨 on 16/3/24.
//  Copyright © 2016年 XJ. All rights reserved.
//

#import "TopView.h"

@interface TopView ()

@property (nonatomic, weak) UIButton *button;

@end

@implementation TopView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.image = [UIImage imageNamed:@"personal_background"];
        self.contentMode = UIViewContentModeScaleAspectFill;
        self.clipsToBounds = YES;
        [self addSubview:self.button];
    }return self;
}

- (UIButton *)button
{
    if (!_button) {
        UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
        button.frame = CGRectMake(self.bounds.size.width / 2, self.bounds.size.height / 2, 50, 50);
        button.backgroundColor = [UIColor redColor];
        [button addTarget:self action:@selector(doTap) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:button];
        _button = button;
    }return _button;
}

- (void)doTap
{
    NSLog(@"123");
}

@end
