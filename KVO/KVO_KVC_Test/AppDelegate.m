//
//  AppDelegate.m
//  KVO_KVC_Test
//
//  Created by bhPark on 2021/12/23.
//

#import "AppDelegate.h"
#import "KVO.h"


@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    _p = [[Person alloc]init];
    _p.name = @"hello";
    _p.age = 1;
    _localVar = 0;
    
    [_p addObserver:self forKeyPath:@"age"
                         options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld)
                         context:nil];
    
    [_label1 setStringValue:[NSString stringWithFormat:@"%lu", _p.age]];
    [_lable2 setStringValue:[NSString stringWithFormat:@"%lu", _localVar]];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}

- (IBAction)pushBtn:(id)sender {
    _p.age++;
    NSLog(@">> %lu", _p.age);
    
    [_label1 setStringValue:[NSString stringWithFormat:@"%lu", _p.age]];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"age"]) {
        NSLog(@"age = %@", change);
    }
    _localVar++;
    
    [_lable2 setStringValue:[NSString stringWithFormat:@"%lu", _localVar]];
}


@end
