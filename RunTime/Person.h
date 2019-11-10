//
//  Person.h
//  RunTime
//
//  Created by JianfengXu on 2019/11/10.
//  Copyright © 2019 JianfengXu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject<NSCoding>

- (void)eat;

@property(nonatomic,assign)int age;

@property(nonatomic,copy)NSString *name;


@end

NS_ASSUME_NONNULL_END
