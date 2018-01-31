//
//  FJObject.m
//  消息转发
//
//  Created by jin fu on 2018/1/31.
//  Copyright © 2018年 Jiuhuar. All rights reserved.
//

#import "FJObject.h"
#import "FJMTSObject.h"

@interface FJObject ()

@property (nonatomic, assign) SEL selector;

@end
@implementation FJObject

- (instancetype)init {
    self = [super init];
    if (self) {
        //
    }
    return self;
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    
    return [super resolveInstanceMethod:sel];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    
    return [super forwardingTargetForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[FJMTSObject instanceMethodSignatureForSelector:@selector(methodTransferStation:selectorName:)]];
    FJMTSObject *target = [[FJMTSObject alloc] init];
    invocation.target = target;
    invocation.selector = @selector(methodTransferStation:selectorName:);
    NSString *arg2 = NSStringFromClass([self class]);
    [invocation setArgument:&arg2 atIndex:2];
    NSString *arg3 = NSStringFromSelector(self.selector);
    [invocation setArgument:&arg3 atIndex:3];
    [invocation invoke];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    self.selector = aSelector;
    NSMethodSignature *methodSignature = [[self class] methodSignatureForSelector:aSelector];
    if (!methodSignature) {
        methodSignature = [NSMethodSignature signatureWithObjCTypes:"@:"];
    }
    return methodSignature;
}

@end
