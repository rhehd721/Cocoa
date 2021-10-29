//
//  GetViewArray.m
//  ViewBaseTableView
//
//  Created by bhPark on 2021/10/27.
//

#import "GetViewArray.h"

@implementation GetViewArray

-(NSMutableArray *)returnViewArray{ // 5개로
    NSLog(@"returnViewArray");
    _viewArray = [[NSMutableArray alloc]init];
    for(int i = 0; i < 5; i++){
        _testView = [[TestView alloc]initWithFrame:NSMakeRect(0, 0, 100, 100)];
        [_viewArray addObject:_testView.customCellView];
    }
    return _viewArray;
}

@end
