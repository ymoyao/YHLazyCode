//
//  SourceEditorCommand.m
//  YHLazyCodeTool
//
//  Created by MasterFly on 2017/6/9.
//  Copyright © 2017年 MasterFly. All rights reserved.
//

#import "SourceEditorCommand.h"
#import "YHLazyCode.h"

@implementation SourceEditorCommand

- (void)performCommandWithInvocation:(XCSourceEditorCommandInvocation *)invocation completionHandler:(void (^)(NSError * _Nullable nilOrError))completionHandler
{
    // Implement your command here, invoking the completion handler when done. Pass it nil on success, and an NSError on failure.
    
    NSString *identifier = invocation.commandIdentifier;
    
    if ([identifier hasPrefix:@"com.YHLazyCode"]) {
        
        //添加懒加载
        [YHLazyCode addLazyCodeWithInvocation:invocation];
    }
    completionHandler(nil);
    
}

@end
