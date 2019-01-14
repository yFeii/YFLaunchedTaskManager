//
//  YFLaunchedTaskManager.h
//  Expecta
//
//  Created by yFeii on 2018/12/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YFLaunchedTaskManager : NSObject


//startTaskWithApplication:didFinishLaunchingWithOptions: 走完即释放（所有任务执行完即释放）
+ (YFLaunchedTaskManager *)manager;

//加入启动任务队列
- (void)registerTaskModule:(NSArray <NSString *> *)classNames;

//开始任务
- (void)startTaskWithApplication:(UIApplication *)application options:(NSDictionary *)launchOptions;

@end

NS_ASSUME_NONNULL_END
