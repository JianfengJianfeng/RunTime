//
//  AppDelegate.m
//  RunTime
//
//  Created by JianfengXu on 2019/11/10.
//  Copyright © 2019 JianfengXu. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "ViewController1.h"//动态改变对象方法
#import "ViewController2.h"//动态查找对象的属性
#import "ViewController3.h"//KVO 通过Runtime动态添加了这个类
#import "ViewController4.h"//通过Runtime动态添加方法

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    ViewController4 *mainVC = [[ViewController4 alloc] init];

       self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
       self.window.backgroundColor = [UIColor whiteColor];
       self.window.rootViewController = mainVC;
       [self.window makeKeyAndVisible];
    return YES;
}

@end
