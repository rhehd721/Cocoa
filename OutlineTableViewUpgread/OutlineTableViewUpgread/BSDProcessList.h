#import <Foundation/Foundation.h>

#include <assert.h>
#include <errno.h>
#include <stdbool.h>
#include <sys/sysctl.h>

typedef struct kinfo_proc kinfo_proc;

NS_ASSUME_NONNULL_BEGIN

@interface BSDProcessList : NSObject{
    
@private
    int numberOfProcesses;
    NSMutableDictionary *process;   // process 단일 객체
    NSMutableDictionary *processInfoDic;    // PID : 365 ...
    NSMutableArray *processList;    // 전체 Process list
    NSMutableArray *processInfoList;
    NSString *procName; // process 이름
    NSString *procInfo; // PID, .. 정보
}
- (id) init;
- (int)numberOfProcesses;
- (void)obtainFreshProcessList;
- (void)printProcessList;
- (NSMutableArray*)ProcessListReturn;

@end

NS_ASSUME_NONNULL_END
