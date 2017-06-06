//
//  NotificationViewController.m
//  NotificationViewController
//
//  Created by 赵云鹏 on 2017/5/19.
//  Copyright © 2017年 赵云鹏. All rights reserved.
//

#import "NotificationViewController.h"
#import <UserNotifications/UserNotifications.h>
#import <UserNotificationsUI/UserNotificationsUI.h>
#import <UserNotifications/UNNotificationServiceExtension.h>

@interface NotificationViewController () <UNNotificationContentExtension>
@property (nonatomic, strong) void (^contentHandler)(UNNotificationContent *contentToDeliver);
@property (nonatomic, strong) UNMutableNotificationContent *bestAttemptContent;
@property IBOutlet UILabel *label;

@end

@implementation NotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any required interface initialization here.
}

- (void)didReceiveNotification:(UNNotification *)notification {
    self.label.text = notification.request.content.body;
    NSLog(@"112231231231233132312");
    
}
// 返回默认样式的button
- (UNNotificationContentExtensionMediaPlayPauseButtonType)mediaPlayPauseButtonType
{
    return UNNotificationContentExtensionMediaPlayPauseButtonTypeDefault;
}

- (void)didReceiveNotificationResponse:(UNNotificationResponse *)response completionHandler:(void (^)(UNNotificationContentExtensionResponseOption))completion {
    NSLog(@"%s",__func__);
    
    self.bestAttemptContent.title = @"hahaha";
    self.contentHandler(self.bestAttemptContent);
}

- (void)didReceiveNotificationRequest:(UNNotificationRequest *)request withContentHandler:(void (^)(UNNotificationContent *contentToDeliver))contentHandler {
    NSLog(@"%s",__func__);
    self.bestAttemptContent.title = @"hahaha2";
    self.contentHandler(self.bestAttemptContent);
}

- (void)serviceExtensionTimeWillExpire {
    self.contentHandler(self.bestAttemptContent);
}

/*
 info.plist
 
 NSExtensionAttributes:
 
 UNNotificationExtensionCategory可以为string或array，每一个字符串都为identifier
 对应一个UNMutableNotificationViewController的categoryIdentifier的属性
 以上作为不同的分类标识符 - 可区分为不同类型通知（视频、图片、音乐之类的通知内容）

 
 UNNotificationExtensionDefaultContentHidden
 
 
 
 
 
 
 
 
 
 
 
 */



@end
