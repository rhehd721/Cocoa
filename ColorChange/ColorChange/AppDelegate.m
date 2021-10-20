//
//  AppDelegate.m
//  ColorChange
//
//  Created by bhPark on 2021/10/07.
//

#import "AppDelegate.h"
#import "Window_1.h"
#import "Window_2.h"
#import "Delegate.h"

@interface AppDelegate () <Window_1ColorControll, Window_2ColorControll>

@property (strong) IBOutlet NSWindow *window;
@property Window_1 * win1;
@property Window_2 * win2;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    _win1 = [[Window_1 alloc]initWithWindowNibName:@"Window_1"];
    _win2 = [[Window_2 alloc]initWithWindowNibName:@"Window_2"];
    
    _win1.delegate = _win2;
    _win2.delegate = _win1;
    
    [_win1.window display];
    [_win2.window display];
    
    
    
    NSLog(@"hello ColorChange!");
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}


@end
