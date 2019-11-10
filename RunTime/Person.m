//
//  Person.m
//  RunTime
//
//  Created by JianfengXu on 2019/11/10.
//  Copyright © 2019 JianfengXu. All rights reserved.
//  Runtime动态查找类的属性

#import "Person.h"
#import <objc/message.h>

//@interface Person()
//
//@property(nonatomic,copy)NSString *adasa;
//
//@end

@implementation Person

- (void)eat{
    
    NSLog(@"吃东西");
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    //归档
//    [coder encodeObject:_name forKey:@"name"];
//    [coder encodeInt:_age forKey:@"age"];
    
   //利用runtime动态查找该类的属性进行归档
      unsigned int count = 0;//属性个数
         //c语言里面，如果传递一个基本数据类型的指针，那么一般都是需要在函数内部修改它的值
         Ivar *ivars = class_copyIvarList([Person class], &count);//拿到对象里边属性个数
      for (int i = 0; i<count; i++) {
          //拿出属性的名称
          Ivar ivar = ivars[i];
          const char *name = ivar_getName(ivar);
          NSString *KEY = [NSString stringWithUTF8String:name];
          id value = [self valueForKey:KEY];//取出属性的值
          //归档
          [coder encodeObject:value forKey:KEY];
      }
    //c语言释放指针
    free(ivars);

}
-(instancetype)initWithCoder:(NSCoder *)coder{
    
    self = [super init];
    if (self) {
        //解归档
//        _name = [coder decodeObjectForKey:@"name"];
//        _age = [coder decodeIntForKey:@"age"];
        
        //利用runtime动态查找该类的属性进行解归档
             unsigned int count = 0;//属性个数
                //c语言里面，如果传递一个基本数据类型的指针，那么一般都是需要在函数内部修改它的值
                Ivar *ivars = class_copyIvarList([Person class], &count);//拿到对象里边属性个数
             for (int i = 0; i<count; i++) {
                 //拿出属性的名称
                 Ivar ivar = ivars[i];
                 const char *name = ivar_getName(ivar);
                 NSString *KEY = [NSString stringWithUTF8String:name];
                     
                 //解归档运用kvc赋值
                id value = [coder decodeObjectForKey:KEY];
                //将值设置到属性上面 KVC
                 [self setValue:value forKey:KEY];
             }
           //c语言释放指针
           free(ivars);
    }
    
    return self;
}
//监听到了 object 的keyPath的属性进行了变化
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"%@%@%@",object,keyPath,change);
}

@end

