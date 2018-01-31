//
//  FJMTSObject.m
//  消息转发
//
//  Created by jin fu on 2018/1/31.
//  Copyright © 2018年 Jiuhuar. All rights reserved.
//

#import "FJMTSObject.h"

@implementation FJMTSObject

- (void)methodTransferStation:(NSString *)targetName selectorName:(NSString *)selectorName
{
    NSString *errorMessage = @"unrecognized selector sent to instance";
    if (targetName) {
        errorMessage = [NSString stringWithFormat:@"%@ no method %@",targetName,selectorName];
    }
    NSLog(@"%@",errorMessage);
    NSAssert(NO, errorMessage);
}

@end
