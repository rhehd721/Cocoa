//
//  BSDProcessList.m
//  ProcessOutlineTableView
//
//  Created by bhPark on 2021/10/19.
//

#import "BSDProcessList.h"

@implementation BSDProcessList

- (id) init
{
    self = [super init];
 
    if (self != nil)
    {
        numberOfProcesses = -1; // means "not initialized"
        process = NULL;
        processList = NULL;
    }
 
    return self;
}
 
- (int)numberOfProcesses    // procsee 갯수
{
    return numberOfProcesses;
}
 
- (void)setNumberOfProcesses:(int)num   // SetNumberOfProcesses
{
    numberOfProcesses = num;
}
 
- (int)getBSDProcessList:(kinfo_proc **)procList
   withNumberOfProcesses:(size_t *)procCount
{
    int             err;
    kinfo_proc *    result;
    bool            done;
    static const int    name[] = { CTL_KERN, KERN_PROC, KERN_PROC_ALL, 0 };
    size_t          length;
 
    // a valid pointer procList holder should be passed
    assert( procList != NULL );
    // But it should not be pre-allocated
    assert( *procList == NULL );
    // a valid pointer to procCount should be passed
    assert( procCount != NULL );
 
    *procCount = 0;
 
    result = NULL;
    done = false;
 
    do
    {
        assert( result == NULL );
 
        // Call sysctl with a NULL buffer to get proper length
        length = 0;
        err = sysctl((int *)name,(sizeof(name)/sizeof(*name))-1,NULL,&length,NULL,0);
        if( err == -1 )
            err = errno;
 
        // Now, proper length is optained
        if( err == 0 )
        {
            result = malloc(length);
            if( result == NULL )
                err = ENOMEM;   // not allocated
        }
 
        if( err == 0 )
        {
            err = sysctl( (int *)name, (sizeof(name)/sizeof(*name))-1, result, &length, NULL, 0);
            if( err == -1 )
                err = errno;
 
            if( err == 0 )
                done = true;
            else if( err == ENOMEM )
            {
                assert( result != NULL );
                free( result );
                result = NULL;
                err = 0;
            }
        }
    }while ( err == 0 && !done );
 
    // Clean up and establish post condition
    if( err != 0 && result != NULL )
    {
        free(result);
        result = NULL;
    }
 
    *procList = result; // will return the result as procList
    if( err == 0 )
        *procCount = length / sizeof( kinfo_proc );
 
    assert( (err == 0) == (*procList != NULL ) );
 
    return err;
}
 
- (void)obtainFreshProcessList  // Get Procsee List
{
    int i;
    kinfo_proc *allProcs = 0;
    size_t numProcs;
 
    int err =  [self getBSDProcessList:&allProcs withNumberOfProcesses:&numProcs];  // procsee list 및 갯수 받아오고 error 확인하기
    if( err )
    {
        numberOfProcesses = -1;
        process = NULL;
        processList = NULL;
        return;
    }
    
    processList = [NSMutableArray array];   // 전체 프로세스 리스트
    
    for( i = 0; i < numProcs; i++ )
    {
        process = [NSMutableDictionary dictionary];
        processInfoList = [NSMutableArray array];
        
        procName = [NSString stringWithFormat:@"%s", allProcs[i].kp_proc.p_comm];
        [process setValue:procName forKey:@"procName"]; // 일단 이름부터 추가
        
        // process의 정보
        processInfoDic = [NSMutableDictionary dictionary];
        procInfo = [NSString stringWithFormat:@"%d",allProcs[i].kp_proc.p_pid];
        [processInfoDic setValue:@"PID" forKey:@"procName"];
        [processInfoDic setValue:procInfo forKey:@"value"];
        [processInfoList addObject:processInfoDic];
        
        processInfoDic = [NSMutableDictionary dictionary];
        procInfo = [NSString stringWithFormat:@"%d",allProcs[i].kp_eproc.e_ppid];
        [processInfoDic setValue:@"PPID" forKey:@"procName"];
        [processInfoDic setValue:procInfo forKey:@"value"];
        [processInfoList addObject:processInfoDic];
        
        processInfoDic = [NSMutableDictionary dictionary];
        procInfo = [NSString stringWithFormat:@"%d",allProcs[i].kp_eproc.e_pgid];
        [processInfoDic setValue:@"PGID" forKey:@"procName"];
        [processInfoDic setValue:procInfo forKey:@"value"];
        [processInfoList addObject:processInfoDic];
        
        [process setValue:processInfoList forKey:@"information"];
        
        
        [processList addObject:process];    // list에 process 추가
    }
 
    [self setNumberOfProcesses:(int)numProcs];   // 현재 돌아가는 process 갯수 알리기
 
    free( allProcs );
 
}
 
- (void)printProcessList;{
    for (id obj in processList)
       NSLog(@"processList: %@", obj);
}

- (NSMutableArray*)ProcessListReturn {
    return processList;
}
@end
