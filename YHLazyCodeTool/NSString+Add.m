//
//  NSString+Add.m
//  YHLazyCode
//
//  Created by MasterFly on 2017/6/9.
//  Copyright © 2017年 MasterFly. All rights reserved.
//

#import "NSString+Add.h"

@implementation NSString (Add)



/**
 返回中间字符串

 @param leftStr 左边字符
 @param rightStr 右边字符
 @return 中间字符串
 */
- (NSString *)stringBetweenLeftStr:(NSString *)leftStr andRightStr:(NSString *)rightStr{
    NSString *str = @"";
    NSArray *arr = [self componentsSeparatedByString:leftStr];
    if (arr.count > 1) {
        NSArray * subArr = [arr[1] componentsSeparatedByString:rightStr];
        if (subArr.count > 0) {
            str = subArr.firstObject;
        }
    }
    return str;
}


@end
