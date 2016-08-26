//
//  DoSomething.h
//  block
//
//  Created by 熊欣 on 16/8/26.
//  Copyright © 2016年 熊欣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DoSomething : NSObject

- (void)doSomeThing:(void(^)())block;

@end
