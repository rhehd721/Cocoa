//
//  AppDelegate.m
//  OutlineTableViewUpgread
//
//  Created by bhPark on 2021/10/08.
//

#import "AppDelegate.h"

@interface AppDelegate () <obtainFreshProcessList> 
@property OutlineTable * outlineViewTable;
@property BSDProcessList * processList;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    _processList = [[BSDProcessList alloc]init];
    [_processList obtainFreshProcessList];
    
    _outlineViewTable = [[OutlineTable alloc]initWithWindowNibName:@"OutlineTable"];
    _outlineViewTable.delegate = self;
    _outlineViewTable.list = [_processList ProcessListReturn];
    
    NSPoint pos;
    pos.x = ([[NSScreen mainScreen] frame].size.width)/2;

    pos.y = ([[NSScreen mainScreen] frame].size.height)/2;

    [_outlineViewTable.window setFrame:CGRectMake(pos.x, pos.y, [_outlineViewTable.window frame].size.width , [_outlineViewTable.window frame].size.height) display:YES];
    
//    [_outlineViewTable showWindow:nil];
    
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}

-(void)prcessListRefrash{
    [_processList obtainFreshProcessList];
    _outlineViewTable.list = [_processList ProcessListReturn];
}

@end
