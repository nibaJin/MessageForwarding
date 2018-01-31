//
//  ViewController.m
//  MessageForwarding
//
//  Created by jin fu on 2018/1/31.
//  Copyright © 2018年 Jiuhuar. All rights reserved.
//

#import "ViewController.h"
#import "FJObject.h"

@interface FJTestObject : FJObject
- (void)eatMethod;
@end

@implementation FJTestObject
- (void)eatMethod
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
}
@end

@interface FJNormalObject : NSObject
- (void)eatMethod;
@end

@implementation FJNormalObject
- (void)eatMethod
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
}
@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // test example
    FJTestObject *testObject = [[FJTestObject alloc] init];
    FJNormalObject *normalObject = [[FJNormalObject alloc] init];
    
    // nomal method call
    [testObject performSelector:@selector(eatMethod) withObject:nil];
    [normalObject performSelector:@selector(eatMethod) withObject:nil];

    SEL otherSel = NSSelectorFromString(@"drinkMethod");
    // debug Throw crash (will Throw FJTestObject no method drinkMethod)
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [testObject performSelector:otherSel withObject:nil];
#pragma clang diagnostic pop
    
    // crash
//    [normalObject performSelector:@selector(drinkMehtod) withObject:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
