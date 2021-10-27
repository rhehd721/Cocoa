//
//  TestWindowController.m
//  DivideView
//
//  Created by bhPark on 2021/10/27.
//

#import "TestWindowController.h"
#import "TestViewController.h"
#import "TestView.h"

@interface TestWindowController ()
@property TestViewController * testViewController;
@end

@implementation TestWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
//    _testViewController = [[TestViewController alloc]initWithNibName:@"TestViewController" bundle:nil];
//
//    [self.customView addSubview:_testViewController.view];
//    [self setCustomView:_testViewController.view];
//    self.customView = _testViewController.view;
    
    TestView *testView = [[TestView alloc] initWithFrame:NSMakeRect(0, 0, 100, 100)];
    [_customView addSubview:testView];
//    [_customView addSubview:testView.view];
}


@end
