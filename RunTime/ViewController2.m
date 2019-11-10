//
//  ViewController2.m
//  RunTime
//
//  Created by JianfengXu on 2019/11/10.
//  Copyright © 2019 JianfengXu. All rights reserved.
//  OC序列化 == 归档

#import "ViewController2.h"
#import "Person.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
   
  //  NSLog(@"%@",NSTemporaryDirectory());

    UIButton *savebtn =[[UIButton alloc]initWithFrame:CGRectMake(50, 100, 80, 80)];
    savebtn.backgroundColor = [UIColor redColor];
    [savebtn setTitle:@"存" forState:UIControlStateNormal];
    [savebtn addTarget:self action:@selector(saveButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:savebtn];

    UIButton *putbtn =[[UIButton alloc]initWithFrame:CGRectMake(50, 300, 80, 80)];
    putbtn.backgroundColor = [UIColor redColor];

       [putbtn setTitle:@"取" forState:UIControlStateNormal];
       [putbtn addTarget:self action:@selector(putButtonAction) forControlEvents:UIControlEventTouchUpInside];
       [self.view addSubview:putbtn];

}
//归档
- (void)saveButtonAction{
    
    Person *p = [Person new];
    p.name = @"feng";
    p.age = 15;
    //归档路径
    NSString *temp = NSTemporaryDirectory();
    NSString *filePath =[temp stringByAppendingPathComponent:@"person.person"];
    
    [NSKeyedArchiver archiveRootObject:p toFile:filePath];
   
}
- (void)putButtonAction{
    
    //归档路径
    NSString *temp = NSTemporaryDirectory();
    NSString *filePath =[temp stringByAppendingPathComponent:@"person.person"];
    
    //接归档 == OC的反序列化
    Person *p = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    
    NSLog(@"%@%d",p.name,p.age);
}


@end
