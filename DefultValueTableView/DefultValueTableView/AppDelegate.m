//
//  AppDelegate.m
//  DefultValueTableView
//
//  Created by bhPark on 2021/10/07.
//

#import "AppDelegate.h"
#import "TableviewWindowController.h"

@interface AppDelegate () <NSTableViewDataSource>
@property NSArray *testArray;
@property (strong) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTableView *testTable;
@property TableviewWindowController *tableviewwindow;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    self.testArray = @[@"Process1",@"Process2",@"Process3",@"Process4",@"Process5",@"Process6"];
    _tableviewwindow = [[TableviewWindowController alloc] initWithWindowNibName:[TableviewWindowController className]];
    [_tableviewwindow showWindow:nil];
//    _testTable setDelegate:<#(id<NSTableViewDelegate> _Nullable)#>
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}

#pragma mark tableview delegate
- (NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView
{
    return [_testArray count];
}

- (id)tableView:(NSTableView *)aTableView objectValueForTableColumn:(NSTableColumn *)aTableColumn row:(NSInteger)rowIndex
{
    return [_testArray objectAtIndex:rowIndex];
}


@end
