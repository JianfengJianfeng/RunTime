//
//  Dog.m
//  RunTime
//
//  Created by JianfengXu on 2019/11/10.
//  Copyright © 2019 JianfengXu. All rights reserved.
//

#import "Dog.h"
#import "objc/message.h"
@implementation Dog

void eat(id self ,SEL _cmd){
    NSLog(@"%@%@",self,NSStringFromSelector(_cmd));
}

void play(id self ,SEL _cmd,id objc){
    NSLog(@"狗狗玩了%@",objc);
}

+(BOOL)resolveInstanceMethod:(SEL)sel{
    
    NSLog(@"%@",NSStringFromSelector(sel));
    /**
     1.cls 类类型
     2.name 方法编号
     3.IMP：方法实现，就是函数指针
     4.type 返回值和参数
     */
    if (sel == @selector(eat)) {
        class_addMethod([Dog class], sel, (IMP)eat, "v");
    } else if (sel == @selector(play:)){
        class_addMethod([Dog class], sel, (IMP)play, "v@:");
    }
    
    return [super resolveInstanceMethod:sel];
}

@end
