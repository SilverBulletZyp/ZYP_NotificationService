//
//  ViewController.m
//  ZYP_NotificationService
//
//  Created by 赵云鹏 on 2017/5/19.
//  Copyright © 2017年 赵云鹏. All rights reserved.
//

#import "ViewController.h"
#import <UserNotifications/UserNotifications.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    

    
    // 本地通知
    [self requestLocationNotification];
    
}

- (void)requestLocationNotification {
    // 创建本地通知
    
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.title = @"测试通知title";
    content.subtitle = @"测试通知subtitle";
    content.body = @"测试通知body";
    content.badge = @1;
    UNTextInputNotificationAction *action = [UNTextInputNotificationAction actionWithIdentifier:@"id" title:@"title" options:UNNotificationActionOptionForeground];
    
    
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"icon_certification_status1@2x" ofType:@"png"];
    
    // 触发模式1
    UNTimeIntervalNotificationTrigger *trigger1 = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:1 repeats:NO];
    
    // 触发模式2
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.weekday = 2; // 周日开始，周一为2
    components.hour = 8;// 周一早上 8：00 上班
    UNCalendarNotificationTrigger *trigger2 = [UNCalendarNotificationTrigger triggerWithDateMatchingComponents:components repeats:YES];
    
    
    NSString *requestIdentifer = @"TestRequestww1";
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:requestIdentifer content:content trigger:trigger1];

    //把通知加到UNUserNotificationCenter, 到指定触发点会被触发
    [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        
    }];
}





/*
 通知类型：
 
 1.UNPushNotificationTrigger （远程通知） 远程推送的通知类型
 
 2.UNTimeIntervalNotificationTrigger （本地通知） 一定时间之后，重复或者不重复推送通知。我们可以设置timeInterval（时间间隔）和repeats（是否重复）。
 
 3.UNCalendarNotificationTrigger（本地通知） 一定日期之后，重复或者不重复推送通知 例如，你每天8点推送一个通知，只要dateComponents为8，如果你想每天8点都推送这个通知，只要repeats为YES就可以了。
 
 4.UNLocationNotificationTrigger （本地通知）地理位置的一种通知，
 当用户进入或离开一个地理区域来通知。在CLRegion标识符必须是唯一的。因为如果相同的标识符来标识不同区域的UNNotificationRequests，会导致不确定的行为。
 
 
 */

@end
