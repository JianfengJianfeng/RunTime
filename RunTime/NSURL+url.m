//
//  NSURL+url.m
//  RunTime
//
//  Created by JianfengXu on 2019/11/10.
//  Copyright © 2019 JianfengXu. All rights reserved.
//  方法交换

#import "NSURL+url.h"
#import <objc/message.h>

@implementation NSURL (url)

//当类加载时调用
+ (void)load{
  //方法交换
  //拿到两个方法（Method)利用runtime停供的方法进行方法交换
    /*class_getClassMethod 拿到一个类的类方法
     class_getInstanceMethod 拿到一个类的对象方法
     */
   Method URLWith = class_getClassMethod([NSURL class], @selector(URLWithString:));
   Method MYURLWith = class_getClassMethod([NSURL class], @selector(MyURLWithStr:));
    //交换方法的实现
    method_exchangeImplementations(URLWith, MYURLWith);
    
}
//*******************重点
+(instancetype)MyURLWithStr:(NSString *)str{
    
    //此处特别注意调用不然引起死循环
    NSURL *url = [NSURL MyURLWithStr:str];
    if (url == nil) {
        NSLog(@"空值了");
    }
    return url;
}


@end
