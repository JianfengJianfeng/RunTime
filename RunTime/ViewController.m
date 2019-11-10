//
//  ViewController.m
//  RunTime
//
//  Created by JianfengXu on 2019/11/10.
//  Copyright © 2019 JianfengXu. All rights reserved.
//  消息发送机制

#import "ViewController.h"
//#import "Person.h"
#import <objc/message.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //OC
//    Person *p = [[Person alloc]init];
  //  Person *p = [Person alloc];
//    Person *p = objc_msgSend(objc_getClass("Person"), @selector(alloc));
//
////    p = [p init];
//    p = objc_msgSend(p, @selector(init));
//
//   // [p eat];
//   // [p performSelector:@selector(eat)];
//
//    //消息发送 C语言 xcode5.0 开始苹果不建议使用底层方法
//    objc_msgSend(p,@selector(eat));
    
    
    //c语言下运行时态一行代码搞定 没要导入头文件
    objc_msgSend(objc_msgSend(objc_msgSend(objc_getClass("Person"), @selector(alloc)), @selector(init)),@selector(eat));
}


@end
