//
//  SecondViewController.m
//  NavigationBarGradient
//
//  Created by 看楼听雨 on 16/3/24.
//  Copyright © 2016年 XJ. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()



@end


@implementation SecondViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    button.frame = CGRectMake(0, 0, 100, 100);
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(addLocalNote) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:button];
    
    UIButton *button1 = [UIButton buttonWithType:(UIButtonTypeCustom)];
    button1.frame = CGRectMake(0, 400, 100, 100);
    button1.backgroundColor = [UIColor redColor];
    [button1 addTarget:self action:@selector(removeLocalNote) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:button1];
    
}


/**
 *  点击按钮后添加本地通知
 */
- (void)addLocalNote {
    
    // 1.创建一个本地通知
    UILocalNotification *localNote = [[UILocalNotification alloc] init];
    
    // 1.1.设置通知发出的时间
    localNote.fireDate = [NSDate dateWithTimeIntervalSinceNow:5];
    
    // 1.2.设置通知发出的内容
    localNote.alertBody = @"吃饭了吗?";
    
    // 1.3.是否弹出提示框
    localNote.hasAction = YES;
    
    // 1.4.设置提示框
    localNote.alertAction = @"查看";
    
    // 1.5.设置启动的图片
    localNote.alertLaunchImage = @"1111";
    
    // 1.6.设置启动的音效
    localNote.soundName = UILocalNotificationDefaultSoundName;
    
    // 1.7.设置应用图标提醒的数字
    localNote.applicationIconBadgeNumber = 999;
    
    // 1.8.如果想将通知的信息传递过去,必须使用userInfo属性
    localNote.userInfo = @{@"msg" : @"吃饭了吗", @"date" : localNote.fireDate};
    
    // 2.调度通知
    [[UIApplication sharedApplication] scheduleLocalNotification:localNote];
}

- (void)registerLocalNotification
{
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    // 设置触发通知的时间
    NSDate *fireDate = [NSDate dateWithTimeIntervalSinceNow:5];
    NSLog(@"fireDate=%@",fireDate);
    
    notification.fireDate = fireDate;
    // 时区
    notification.timeZone = [NSTimeZone defaultTimeZone];
    // 设置重复的间隔
    notification.repeatInterval = kCFCalendarUnitSecond;
    
    // 通知内容
    notification.alertBody =  @"该起床了...";
    notification.applicationIconBadgeNumber = 1;
    // 通知被触发时播放的声音
    notification.soundName = UILocalNotificationDefaultSoundName;
    // 通知参数
    NSDictionary *userDict = [NSDictionary dictionaryWithObject:@"开始学习iOS开发了" forKey:@"msg"];
    notification.userInfo = userDict;
    
    // ios8后，需要添加这个注册，才能得到授权
    if ([[UIApplication sharedApplication] respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        UIUserNotificationType type =  UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound;
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:type
                                                                                 categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
        // 通知重复提示的单位，可以是天、周、月
        notification.repeatInterval = NSCalendarUnitDay;
    } else {
        // 通知重复提示的单位，可以是天、周、月
        notification.repeatInterval = NSDayCalendarUnit;
    }
    
    // 执行通知注册
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];  
}

- (void)removeLocalNote {
    [[UIApplication sharedApplication] cancelAllLocalNotifications];

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
