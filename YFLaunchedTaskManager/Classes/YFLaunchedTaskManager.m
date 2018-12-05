
//
//  YFLaunchedTaskManager.m
//  Expecta
//
//  Created by yFeii on 2018/12/5.
//

#import "YFLaunchedTaskManager.h"
#import "YFLaunchedTaskProtocol.h"

@interface YFLaunchedTaskManager ()

@property (nonatomic, strong) NSMutableArray *taskModules;

@end

@implementation YFLaunchedTaskManager
static YFLaunchedTaskManager *launchManager = nil;

+ (YFLaunchedTaskManager *)manager {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        launchManager = [YFLaunchedTaskManager alloc];
        launchManager.taskModules = [[NSMutableArray alloc] init];
    });
    return launchManager;
}

- (void)taskFinished:(id<YFLaunchedTaskProtocol>)task {
    
    [self.taskModules removeObject:task];
}

- (void)registerTaskModule:(NSArray<NSString *> *)classNames {
    
    for (NSString *className in classNames) {
        
        Class class = NSClassFromString(className);
        id <YFLaunchedTaskProtocol>task = [[class alloc] init];
        if ([task respondsToSelector:@selector(launchedTaskWithApplication:options:)]) {
            
            [self.taskModules addObject:task];
        }
    }
}

- (void)startTaskWithApplication:(UIApplication *)application options:(NSDictionary *)launchOptions {
    
    NSArray *sortedArrays = [self.taskModules sortedArrayUsingComparator:^NSComparisonResult(id<YFLaunchedTaskProtocol> task1, id<YFLaunchedTaskProtocol> task2) {
        
        NSNumber *m1 = @(1);
        NSNumber *m2 = @(1);
        if ([task1 respondsToSelector:@selector(priorityOfInitialization)]) {
            
            m1 = @([task1 priorityOfInitialization]);
        }
        
        if ([task2 respondsToSelector:@selector(priorityOfInitialization)]) {
            
            m2 = @([task2 priorityOfInitialization]);
        }
        return [m1 compare:m2];
    }];
    for (id<YFLaunchedTaskProtocol> task in sortedArrays) {
        
        [task launchedTaskWithApplication:application options:launchOptions];
    }
    sortedArrays = nil;
    [self.taskModules removeAllObjects];
    launchManager = nil;
}

- (void)dealloc {
    
    
}
//任务完成 任务对象被释放
//- (void)taskFinished:(id<JSLaunchedTaskProtocol>)task;
@end
