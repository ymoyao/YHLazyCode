//
//  NSString+Add.h
//  YHLazyCode
//
//  Created by MasterFly on 2017/6/9.
//  Copyright © 2017年 MasterFly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Add)


/**
 返回中间字符串
 
 @param leftStr 左边字符
 @param rightStr 右边字符
 @return 中间字符串
 */
- (NSString *)stringBetweenLeftStr:(NSString *)leftStr andRightStr:(NSString *)rightStr;
@end
