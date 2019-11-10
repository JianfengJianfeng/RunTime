//
//  ViewController3.m
//  RunTime
//
//  Created by JianfengXu on 2019/11/10.
//  Copyright © 2019 JianfengXu. All rights reserved.
//  KVO键值观察

#import "ViewController3.h"
#import "Person.h"
#import "Dog.h"

@interface ViewController3 ()

@property (nonatomic,strong)Person *p;
@property (nonatomic,strong)Dog * d;

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.d = [[Dog alloc]init];
    self.p = [[Person alloc]init];
    
    //注册监听 KVO  options一个位移枚举
    [self.d addObserver:self.p forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:nil];
    
    
    /*底层实现原理
     [willChangeValueForKey:@"age"];
     [didChangeValueForKey:@"age"];
     */
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //此处d并非Dog类型属于NSKVONotifying_Dog类型 在isa指针中可以看到 通过Runtime动态添加了这个类 重写了set方法
    self.d.age = 99;
}
@end
