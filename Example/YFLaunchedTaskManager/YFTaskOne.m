//
//  YFTaskOne.m
//  YFLaunchedTaskManager_Example
//
//  Created by yFeii on 2018/12/5.
//  Copyright © 2018 yFeii. All rights reserved.
//

#import "YFTaskOne.h"

@implementation YFTaskOne


- (nonnull id<YFLaunchedTaskProtocol>)launchedTask {
    return [[YFTaskOne alloc] init];
}

- (void)launchedTaskWithApplication:(nonnull UIApplication *)application options:(nonnull NSDictionary *)launchOptions {
    
    //set up something
    //exp UM Or Network...
}

- (void)dealloc{

}
@end
