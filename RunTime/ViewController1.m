//
//  ViewController1.m
//  RunTime
//
//  Created by JianfengXu on 2019/11/10.
//  Copyright © 2019 JianfengXu. All rights reserved.
//
/* Runtime运行时
    苹果提供了一个api,属于c语言的库
 有什么用：
 利用Runtime运行时，在程序的运行过程中，动态创建一个类。
 利用Runtime运行时，在程序的运行过程中，动态修改一个类的属性/方法
 利用Runtime运行时，遍历一个类的属性和方法
 
 头文件<objc/runtime> <objc/message>(包含runtime)
 
 Method:成员方法
 ivar  :成员变量
 
 **/

#import "ViewController1.h"

@interface ViewController1 ()

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];

    //如果为空编译不过
    NSURL *url = [NSURL URLWithString:@"www.baidu.com/中文"];

    NSLog(@"%@",url);

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
