//
//  YHLazyCode.m
//  YHLazyCode
//
//  Created by MasterFly on 2017/6/9.
//  Copyright © 2017年 MasterFly. All rights reserved.
//


#import "YHLazyCode.h"
#import "NSString+Add.h"

#define BtnFormat @"- (%@ *)%@ {\n    if (_%@ == nil) {\n        _%@ = [%@ buttonWithType:<#(UIButtonType)#>];\n    }\n    return _%@;\n}"
#define TableFormat @"- (%@ *)%@{\n    if (_%@ == nil) {\n        _%@ = [[%@ alloc] initWithFrame:<#(CGRect)#> style:<#(UITableViewStyle)#>];\n    }\n    return _%@;\n}"
#define CollectionFormat @"- (%@ *)%@{\n    if (_%@ == nil) {\n        _%@ = [[%@ alloc] initWithFrame:<#(CGRect)#> collectionViewLayout:<#(nonnull UICollectionViewLayout *)#>];\n    }\n    return _%@;\n}"
#define CommonFormat @"- (%@ *)%@{\n    if (_%@ == nil) {\n        _%@ = [[%@ alloc] init];\n    }\n    return _%@;\n}"
@implementation YHLazyCode

/**
 添加懒加载的函数到对应的文件中

 @param invocation invocation
 */
+ (void)addLazyCodeWithInvocation:(XCSourceEditorCommandInvocation *)invocation{
    for (XCSourceTextRange *range in invocation.buffer.selections) {
        NSInteger startLine = range.start.line;
        NSInteger endLine = range.end.line;
        NSInteger lineCount = invocation.buffer.lines.count;

        
        NSMutableArray *nameMulDataArr = [NSMutableArray array];
        for (NSInteger i = startLine; i <= endLine; i ++) {
            NSString *lineStr = invocation.buffer.lines[i];
            
            if ([lineStr isEqualToString:@"\n"] || ![lineStr containsString:@";"]) {
                continue;
            }
            
            //去掉空格
            lineStr = [lineStr stringByReplacingOccurrencesOfString:@" " withString:@""];
            
            //获取类名
            NSString *classNameStr = [lineStr stringBetweenLeftStr:@")" andRightStr:@"*"];
            
            //获取属性名
            NSString *propertyName = [lineStr stringBetweenLeftStr:@"*" andRightStr:@";"];
            
            
            //获取的数据存到字典中
            NSArray *formatArr = [self stringForClassName:classNameStr andPropertyName:propertyName];
            [nameMulDataArr addObject:formatArr];
            NSLog(@"%@",lineStr);
        }
        
        //输出到文件
        for (NSInteger i = 0 ; i < lineCount; i ++) {
            NSString *lineStr = invocation.buffer.lines[i];
            if ([lineStr containsString:@"#pragma mark - Get and Set"]) {
                for (NSInteger j = i + 1 ; j < nameMulDataArr.count + i + 1 ; j ++) {
                    NSArray *formatArr = [nameMulDataArr objectAtIndex:nameMulDataArr.count - j -1  + (i + 1 )];
                    for (int z = 0; z <formatArr.count ; z ++) {
                        [invocation.buffer.lines insertObject:formatArr[z] atIndex:i + 1  + z];
                    }
                }
                break;
            }
        }
        
    }
}


/**
 格式化字符并返回数组

 @param className 类名
 @param propertyName 属性名
 @return 需要写入文件的数组
 */
+ (NSArray *)stringForClassName:(NSString *)className andPropertyName:(NSString *)propertyName{
    NSString *str = @"";
    if ([className containsString:@"Button"]) {
        str = [NSString stringWithFormat:BtnFormat,className,propertyName,propertyName,propertyName,className,propertyName];
    }else if ([className containsString:@"TableView"]){
        str = [NSString stringWithFormat:TableFormat,className,propertyName,propertyName,propertyName,className,propertyName];
    }else if ([className containsString:@"CollectionView"]){
        str = [NSString stringWithFormat:CollectionFormat,className,propertyName,propertyName,propertyName,className,propertyName];
    }else{
        str = [NSString stringWithFormat:CommonFormat,className,propertyName,propertyName,propertyName,className,propertyName];
    }
    NSArray *formaterArr = [[str componentsSeparatedByString:@"\n"] arrayByAddingObject:@"\n"];

    return formaterArr;
}

@end
