//
//  AppDelegate.m
//  TableView
//
//  Created by bhPark on 2021/10/08.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@property Table_1 *table_1_ptr;
@property Table_2 *table_2_ptr;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    _table_1_ptr = [[Table_1 alloc]initWithWindowNibName:@"Table_1"];
    _table_2_ptr = [[Table_2 alloc]initWithWindowNibName:@"Table_2"];
    _table_1_ptr.delegate = _table_2_ptr;
    _table_2_ptr.delegate = _table_1_ptr;
    
    [_table_1_ptr showWindow:nil];
    [_table_2_ptr showWindow:nil];
    
    NSLog(@"Hello");
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}

@end
