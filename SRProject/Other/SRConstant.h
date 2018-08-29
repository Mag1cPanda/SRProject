//
//  SRConstant.h
//  SRProject
//
//  Created by longrise on 2018/8/29.
//  Copyright © 2018年 longrise. All rights reserved.
//

#import <Foundation/Foundation.h>

//编译时刻:宏是预编译（编译之前处理），const是编译阶段。
//编译检查:宏不做检查，不会报编译错误，只是替换，const会编译检查，会报编译错误。
//宏的好处:宏能定义一些函数，方法。 const不能。
//宏的坏处:使用大量宏，容易造成编译时间久，每次都需要重新替换。

//const作用：限制类型
//1.const仅仅用来修饰右边的变量（基本数据变量p，指针变量*p）
//2.被const修饰的变量是只读的。

//static作用:
//修饰局部变量：
//1.延长局部变量的生命周期,程序结束才会销毁。
//2.局部变量只会生成一份内存,只会初始化一次。
//3.改变局部变量的作用域。

//修饰全局变量
//1.只能在本文件中访问,修改全局变量的作用域,生命周期不会改
//2.避免重复定义全局变量

//extern作用:
//只是用来获取全局变量(包括全局静态变量)的值，不能用于定义变量

//extern工作原理:
//先在当前文件查找有没有全局变量，没有找到，才会去其他文件查找。



//extern与const联合使用
//开发中使用场景:在多个文件中经常使用的同一个字符串常量，可以使用extern与const组合。
extern NSString * const nameKey;

static const NSString *BBURL = @"http://59.173.241.186:51108/BBT/restservices/bbapp";

@interface SRConstant : NSObject

@end
