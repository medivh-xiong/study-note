//
//  ViewController.m
//  block
//
//  Created by 熊欣 on 16/8/25.
//  Copyright © 2016年 熊欣. All rights reserved.
//

#import "ViewController.h"
#import "DoSomething.h"

@interface ViewController ()

@property (nonatomic, readwrite, copy) void(^block)();

@end

@implementation ViewController




- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    [self test1];
    
    [self test2]();
}

- (void)test1
{
    NSLog(@"test1");
}

- (void(^)())test2
{
    NSLog(@"1111");
    
    return ^ {
        NSLog(@"test2");
    };
}


- (void(^)(NSString *))test3
{
    NSLog(@"1111");
    
    return ^(NSString *value){
        NSLog(@"%@", value);
    };
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
