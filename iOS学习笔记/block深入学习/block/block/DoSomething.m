
//
//  DoSomething.m
//  block
//
//  Created by 熊欣 on 16/8/26.
//  Copyright © 2016年 熊欣. All rights reserved.
//

#import "DoSomething.h"

@implementation DoSomething


- (void)doSomeThing:(void(^)())block {
	
    if (block) {
        block();
    }
}


@end
