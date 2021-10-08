//
//  AppDelegate.m
//  OutlineTableViewUpgread
//
//  Created by bhPark on 2021/10/08.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@property (strong) IBOutlet NSWindow *window;
@property OutlineTable * outlineViewTable;
@property SchoolInfo * schoolViewTable;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    _outlineViewTable = [[OutlineTable alloc]initWithWindowNibName:@"OutlineTable"];
    [_outlineViewTable showWindow:nil];
    
    _schoolViewTable = [[SchoolInfo alloc]initWithWindowNibName:@"SchoolInfo"];
    [_schoolViewTable showWindow:nil];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}


@end
