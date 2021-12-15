//
//  AppDelegate.m
//  CircleProgressBar
//
//  Created by bhPark on 2021/12/15.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    ProgressBarView *progressBarView;
    CircleProgressBarView *circleProgressBarView;
    
    circleProgressBarView = [[CircleProgressBarView alloc]initWithFrame:NSMakeRect(0, 0, self.customView_1.frame.size.width, self.customView_1.frame.size.height)];
    [self.customView_1 addSubview:circleProgressBarView];
    
    progressBarView = [[ProgressBarView alloc]initWithFrame:NSMakeRect(0, 0, self.customView_2.frame.size.width, self.customView_2.frame.size.height)];
    [self.customView_2 addSubview:progressBarView];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}


@end
