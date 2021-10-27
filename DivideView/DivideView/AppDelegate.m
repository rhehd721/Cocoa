//
//  AppDelegate.m
//  DivideView
//
//  Created by bhPark on 2021/10/27.
//

#import "AppDelegate.h"
#import "TestWindowController.h"
#import "TestViewController.h"
#import "TestView.h"

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@property TestWindowController * testWindowController;
@property TestViewController * testViewController;
@property TestView * testView;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
//    _testViewController = [[TestViewController alloc]initWithNibName:@"TestViewController" bundle:nil];
    _testWindowController = [[TestWindowController alloc]initWithWindowNibName:@"TestWindowController"];
    
  
    [_testWindowController showWindow:nil];
    
//    _testView = [[TestView alloc] initWithFrame:NSMakeRect(0, 0, 100, 100)];
//
//    [_testWindowController.customView addSubview:_testView.customView];
    
//    [_testWindowController.customView addSubview:_testViewController.view];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}


@end
