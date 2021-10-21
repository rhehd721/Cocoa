//
//  AppDelegate.m
//  Lotto
//
//  Created by bhPark on 2021/10/20.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *winningNumberTextField;
@property NSMutableArray * LuckyNumbers;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}

- (IBAction)pushStartBtn:(id)sender {
    BOOL checkOverlap = NO;
    NSNumber * maxNum = [[NSNumber alloc]initWithInt:45];
    _LuckyNumbers = [NSMutableArray array];
    while([_LuckyNumbers count] < 6){
        NSNumber * LuckyNum = [[NSNumber alloc]initWithInt:(int)(random() % 100) +1];
        if([LuckyNum intValue] <= [maxNum intValue]){
            for(id object in _LuckyNumbers){
                if(object == LuckyNum){
                    checkOverlap = YES;
                    break;
                }
            }
            if(checkOverlap != YES){
                [_LuckyNumbers addObject:LuckyNum];
            }
            checkOverlap = NO;
        }
    }
    NSSortDescriptor *sd = [[NSSortDescriptor alloc] initWithKey:nil ascending:YES];
    _LuckyNumbers = [_LuckyNumbers sortedArrayUsingDescriptors:@[sd]];
    
    [_winningNumberTextField setStringValue:[NSString stringWithFormat:@"%@, %@, %@, %@, %@, %@", _LuckyNumbers[0],_LuckyNumbers[1],_LuckyNumbers[2],_LuckyNumbers[3],_LuckyNumbers[4],_LuckyNumbers[5] ]];
}

@end
