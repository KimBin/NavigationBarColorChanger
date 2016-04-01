//
//  AppDelegate.m
//  NavigationBarGradient
//
//  Created by 看楼听雨 on 16/3/24.
//  Copyright © 2016年 XJ. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "XJNavigationController.h"
@interface AppDelegate ()<UIAlertViewDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    XJNavigationController *navi = [[XJNavigationController alloc]initWithRootViewController:[[ViewController alloc] init]];
    self.window.rootViewController = navi;

    /*
     UIUserNotificationTypeNone    = 0,      无类型(不给用户发通知)
     UIUserNotificationTypeBadge   = 1 << 0, 是否可以改变应用图标右上角的提示数字
     UIUserNotificationTypeSound   = 1 << 1, 该通知是否会有声音
     UIUserNotificationTypeAlert   = 1 << 2, 是否有弹出提示
     */
    if ([UIDevice currentDevice].systemVersion.doubleValue >= 8.0) {
        // 1.向用户请求可以给用户推送消息
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert categories:nil];
        [application registerUserNotificationSettings:settings];
        
        // 2.注册远程通知(拿到用户的DeviceToken)
        [application registerForRemoteNotifications];
    } else {
        [application registerForRemoteNotificationTypes:UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound];
    }
    
    if (launchOptions[UIApplicationLaunchOptionsRemoteNotificationKey]) {
        // 页面的跳转
        NSLog(@"ssss");
    }
    
    [application setApplicationIconBadgeNumber:0];

    [self.window makeKeyAndVisible];
    return YES;
}

///**
// *  点击通知打开应用的时候会执行该方法
// *  应用在前台的时候,收到通知也会执行该方法
// *
// *  @param notification 通知
// */
//- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
//    NSLog(@"noti:%@",notification);
//    
//    // 这里真实需要处理交互的地方
//    // 获取通知所带的数据
//    NSString *notMess = [notification.userInfo objectForKey:@"msg"];
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"本地通知(前台)"
//                                                    message:notMess
//                                                   delegate:self
//                                          cancelButtonTitle:@"取消"
//                                          otherButtonTitles:@"OK", nil];
//    [alert show];
//    
//    // 更新显示的徽章个数
//    NSInteger badge = [UIApplication sharedApplication].applicationIconBadgeNumber;
//    badge--;
//    badge = badge >= 0 ? badge : 0;
//    [UIApplication sharedApplication].applicationIconBadgeNumber = badge;
//    
//    // 在不需要再推送时，可以取消推送
////    [HomeViewController cancelLocalNotificationWithKey:@"key"];
//}
//
//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
//{
//    if (buttonIndex == 1) {
//        [[UIApplication sharedApplication] cancelAllLocalNotifications];
//    }else{
//        NSLog(@"取消");
//    }
//}

/**
 *  远程推送
 *
 *  @param application <#application description#>
 *  @param deviceToken <#deviceToken description#>
 */
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    // 5e8cf393 9e950137 86ac8375 12185078 19eb3ebd 936777e1 f061caec a48cb236
    // 将用户的用户名和deviceToken发送给服务器,让服务器进行保存备份即可
    NSLog(@"%@", deviceToken);
}

/**
 *  当接受到远程通知的时候会调用该方法
 *
 *  @param userInfo    远程通知的信息
 */
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    // 在这里可以跳转的其他页面
    NSLog(@"%@", userInfo);
}

/**
 *  如果接受到远程通知时,想要后台执行任务,则实现调用该方法
 *
 *  @param userInfo
 *  @param completionHandler 后台执行完之后要告知系统,是否更新成功
 */
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    NSLog(@"%@", userInfo);
    
    completionHandler(UIBackgroundFetchResultNewData);
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
