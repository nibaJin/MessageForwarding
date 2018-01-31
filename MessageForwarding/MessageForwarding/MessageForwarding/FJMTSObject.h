//
//  FJMTSObject.h
//  消息转发
//
//  Created by jin fu on 2018/1/31.
//  Copyright © 2018年 Jiuhuar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FJMTSObject : NSObject

- (void)methodTransferStation:(NSString *)targetName selectorName:(NSString *)selectorName;

@end
