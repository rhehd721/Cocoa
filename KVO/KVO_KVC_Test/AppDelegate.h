//
//  AppDelegate.h
//  KVO_KVC_Test
//
//  Created by bhPark on 2021/12/23.
//

#import <Cocoa/Cocoa.h>
#import "Person.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>
@property (weak) IBOutlet NSTextField *label1;
@property (weak) IBOutlet NSTextField *lable2;
@property Person * p;

@property NSInteger localVar;

@end

