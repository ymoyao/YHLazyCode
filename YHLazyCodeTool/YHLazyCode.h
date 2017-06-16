//
//  YHLazyCode.h
//  YHLazyCode
//
//  Created by MasterFly on 2017/6/9.
//  Copyright © 2017年 MasterFly. All rights reserved.
//
/************************************************************************************************************
 写这个的目的是为了减少懒加载的重复代码，提高code 效率.
 GitHub:https://github.com/developeryh  
 简书:http://www.jianshu.com/u/5fdaf204eb9e
 *************************************************************************************************************/

#import <XcodeKit/XcodeKit.h>

@interface YHLazyCode : NSObject


/**
 添加懒加载的函数到对应的文件中
 
 @param invocation invocation
 */
+ (void)addLazyCodeWithInvocation:(XCSourceEditorCommandInvocation *)invocation;

@end
