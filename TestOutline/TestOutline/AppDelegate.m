//
//  AppDelegate.m
//  TestOutline
//
//  Created by bhPark on 2021/10/08.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@property OutlineView * outlineViewTable;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    _outlineViewTable = [[OutlineView alloc]initWithWindowNibName:@"OutlineView"];
    [_outlineViewTable showWindow:nil];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}


@end
