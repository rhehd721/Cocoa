//
//  TestWindowController.m
//  ViewBaseTableView
//
//  Created by bhPark on 2021/10/27.
//

#import "TestWindowController.h"


@interface TestWindowController ()

@end

@implementation TestWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    NSLog(@"windowDidLoad");
    
    _testViewController = [[TestViewController alloc]initWithNibName:@"TestViewController" bundle:nil];
    [self.customView addSubview:_testViewController.view];  // WindowController Window에 존재하는 CustomView에 View 넣어주기
//    [self.customView addSubview:_testViewController.viewControllerCustomView];    // 왜 안될까?
}

@end
