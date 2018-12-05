//
//  YFLaunchedTaskProtocol.h
//  Expecta
//
//  Created by yFeii on 2018/12/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger,  YFLaunchedTaskPriority) {
    YFLaunchedTaskPriorityLow          =  1,
    YFLaunchedTaskPriorityDefault      =  2,
    YFLaunchedTaskPriorityHigh         =  3,
};


@protocol YFLaunchedTaskProtocol <NSObject>

@optional
//任务优先级
- (YFLaunchedTaskPriority)priorityOfInitialization;
@required

//返回任务示例。可是单例，或其他。manager内部不永久持有task对象
- (id<YFLaunchedTaskProtocol>)launchedTask;

//app 启动回调
- (void)launchedTaskWithApplication:(UIApplication *)application options:(NSDictionary *)launchOptions;
@end



NS_ASSUME_NONNULL_END
